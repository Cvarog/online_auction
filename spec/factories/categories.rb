FactoryGirl.define do
  factory :category do
    sequence(:name) { |i| "Technic#{i}" }
  end
end
