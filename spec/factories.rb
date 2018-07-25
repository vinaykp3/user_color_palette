FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "integration_name_#{n}"}
    uniq_identifier '123456'
  end
end