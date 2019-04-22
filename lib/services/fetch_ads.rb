# frozen_string_literal: true

require 'faraday'

# fetch ads from external API
class FetchAds
  def initialize(params)
    @url = params[:url]
  end

  def self.call(*args)
    new(*args).perform
  end

  def perform
    resp = Faraday.get(@url)
    JSON.parse(resp.body)['ads']
  rescue => e
    warn "Error while fetching ads : #{e.message}"
    []
  end
end
