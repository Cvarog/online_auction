FactoryGirl.define do
  factory :item do
    name "Item"
    price 10.00
    description "Some wild wild text about items"
    category_id 1
    lot_id 1
    # image_id 1
    # association(:category)
    # association(:lot)
  end
end