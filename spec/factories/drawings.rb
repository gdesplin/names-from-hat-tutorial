FactoryBot.define do
  factory :drawing do
    hat { nil }
    sequence(:name) {|n| "Name #{n}" }
  end
end

