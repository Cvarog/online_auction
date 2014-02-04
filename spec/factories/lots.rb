FactoryGirl.define do
  factory :lot do
    name "Lot"
    price 100
    description "Some text about this lot and a few words more"
    expired_time "2013-12-11 01:57:12"
    time_step 30
    item_id 1
    # association(:item)
  end
end
