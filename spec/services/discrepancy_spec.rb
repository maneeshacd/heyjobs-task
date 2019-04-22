require 'active_record'
require_relative '../../db/connection'
require_relative '../../db/schema'
require_relative '../../lib/services/discrepancy'
require_relative '../support/factory_bot'
require_relative '../factories/campaign'
require_relative '../../models/campaign'

describe Discrepancy do
  let(:campaign) { create(:campaign) }

  context 'calling with remote and local campaigns' do
    it 'should return the discrepancy hash' do
      remote = { 'reference' => '1', 'status' => 'enabled',
                 'description' => 'Description for campaign 11' }
      d_hash = described_class.call(remote: remote, local: campaign)
      expect(d_hash).to be_eql(
        remote_reference: '1',
        discrepancies: [
          status: { remote: 'enabled', local: 'active' },
          description: {
            remote: 'Description for campaign 11', local: 'Desc 1'
          }
        ]
      )
    end
  end
end
