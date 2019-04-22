# frozen_string_literal: true

# campaign model
class Campaign < ActiveRecord::Base
  belongs_to :job
  enum status: %w[active paused deleted]
end
