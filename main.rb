# frozen_string_literal: true

require 'active_record'
require_relative 'db/connection'
require_relative 'db/schema'
require_relative 'config/constants'
Dir['./models/*.rb'].each { |file| require file.gsub('.rb', '') }
require_relative './lib/services/campaign_discrepancies.rb'
require_relative 'db/seed.rb'

output = CampaignDiscrepancies.call(url: URL)
puts output
