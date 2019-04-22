require 'active_record'
require_relative '../../db/connection'
require_relative '../../db/schema'
require_relative '../../models/campaign'
require_relative '../../models/job'
require_relative '../support/shoulda_matchers'

describe Campaign, type: :model do
  context 'association' do
    it { is_expected.to belong_to(:job) }
  end

  context 'validation' do
    it {
      is_expected.to define_enum_for(:status)
        .with_values(%w[active paused deleted])
    }
  end
end
