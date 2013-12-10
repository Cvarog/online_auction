FactoryGirl.define do
  factory :lot do
    name "Lot"
    price 15.00
    description "Some text about this lot"
    end_time "2013-12-11 01:57:12"
    bet_step 0.25
    time_step "0000-00-00 00:00:10"
    association(:item)
  end
end