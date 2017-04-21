require 'ffaker'

FactoryGirl.define do
  factory :transaction do |f|
    f.amount BigDecimal.new("50.00")
    f.member_id { FactoryGirl.create(:member).id }
    f.description { FFaker::Lorem.phrase }
  end
end