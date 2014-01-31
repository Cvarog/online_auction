FactoryGirl.define do
  factory :user do
    email "test@gmail.com"
    nickname "User"
    first_name "First"
    last_name "Last"
    password "12345678"
    password_confirmation "12345678"
  end
end
