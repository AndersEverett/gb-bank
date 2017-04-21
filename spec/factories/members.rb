require 'ffaker'

FactoryGirl.define do
  factory :member do |f|
    f.name { FFaker::Name.first_name }
    f.email { FFaker::Internet.email }
    f.balance 100.00
  end
end