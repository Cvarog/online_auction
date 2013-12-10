FactoryGirl.define do
  factory :category do
    sequence(:name) { |i| "Techic#{i}" }
  end
end


#FactoryGirl.define do
#  factory :category do
#    name "Electronics"
#    category_id nil
#  end
#end