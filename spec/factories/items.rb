FactoryGirl.define do
  factory :item do
    name "Item"
    price 10.00
    description "Some wild wild text"
    association(:category)
    association(:lot)
  end
end