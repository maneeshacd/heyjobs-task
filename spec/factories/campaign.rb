FactoryBot.define do
  factory :campaign do
    job_id { 2 }
    status { 'active' }
    external_reference { '1' }
    ad_description { 'Desc 1' }
  end
end
