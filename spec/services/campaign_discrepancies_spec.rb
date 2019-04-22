require 'active_record'
require_relative '../../db/connection'
require_relative '../../db/schema'
require_relative '../../models/campaign'
require_relative '../../lib/services/campaign_discrepancies'
require_relative '../../db/seed'
require_relative '../../config/constants'

describe CampaignDiscrepancies do
  it 'should return an array' do
    remote_ads =
      [{ 'reference' => '1', 'status' => 'enabled',
         'description' => 'Description for campaign 11' }]
    discrepancies = described_class.new(url: URL)
                                   .detect_discrepancies(remote_ads)
    expect(discrepancies).to be_an_instance_of(Array)
  end

  it 'should return empty array if no discrepancy' do
    remote_ads =
      [{ 'reference' => '1', 'status' => 'active',
         'description' => 'Desc 1' }]
    discrepancies = described_class.new(url: URL)
                                   .detect_discrepancies(remote_ads)
    expect(discrepancies).to be_eql([])
  end

  it 'should return empty array if no local campaigns with
      remote campaigns reference' do
    remote_ads =
      [{ 'reference' => '10', 'status' => 'enabled',
         'description' => 'Description for campaign 11' }]
    discrepancies = described_class.new(url: URL)
                                   .detect_discrepancies(remote_ads)
    expect(discrepancies).to be_eql([])
  end
end
