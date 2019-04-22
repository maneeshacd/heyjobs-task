# Set up database tables and columns
ActiveRecord::Schema.define do
  create_table :campaigns do |t|
    t.integer :job_id
    t.integer :status
    t.string :external_reference
    t.text :ad_description
    t.timestamps
  end
end
