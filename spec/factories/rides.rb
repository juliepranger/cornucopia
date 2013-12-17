# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ride do
    need_ride "MyString"
    boolean "MyString"
    name "MyString"
    need_ride_location "MyString"
  end
end
