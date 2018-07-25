FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "integration_name_#{n}"}
    uniq_identifier '123456'
  end

  factory :user_color do
    sequence(:color_code) {|n| "#34598#{n}"}
    row 1
    col 1
    user_id 1
  end
end