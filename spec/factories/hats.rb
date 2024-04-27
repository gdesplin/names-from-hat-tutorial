FactoryBot.define do
  factory :hat do
    sequence(:name) {|n| "Name #{n}" }
  end
end

