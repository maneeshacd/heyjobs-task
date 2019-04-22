# frozen_string_literal: true

# find discrepancy b/w single remote and local ad
class Discrepancy
  def initialize(params)
    @remote = params[:remote]
    @local = params[:local]
  end

  def self.call(*args)
    new(*args).perform
  end

  def perform
    {
      'remote_reference': @remote['reference'],
      'discrepancies': [
        'status': { 'remote': @remote['status'], 'local': @local.status },
        'description': {
          'remote': @remote['description'],
          'local': @local.ad_description
        }
      ]
    }
  end
end
