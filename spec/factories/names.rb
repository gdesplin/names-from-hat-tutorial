FactoryBot.define do
  factory :name do
    hat { nil }
    sequence(:name) {|n| "Name #{n}" }
  end
end
