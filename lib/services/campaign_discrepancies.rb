# frozen_string_literal: true

require 'faraday'
require_relative 'discrepancy'
require_relative 'Fetch_ads'
# find discrepancies b/w local campaigns and remote ads
class CampaignDiscrepancies
  def initialize(params)
    @url = params[:url]
  end

  def self.call(*args)
    new(*args).perform
  end

  def perform
    detect_discrepancies(ads)
  end

  def detect_discrepancies(ads)
    ads.map do |ad|
      campaign = Campaign.find_by(external_reference: ad['reference'])
      next if campaign.blank? || !discrepancy?(ad, campaign)

      Discrepancy.call(remote: ad, local: campaign)
    end.compact
  end

  def ads
    FetchAds.call(url: URL)
  end

  def discrepancy?(remote, local)
    remote['status'] != local.status ||
      remote['description'] != local.ad_description
  end
end
