# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :party do
    name "MyString"
    date "MyString"
    location "MyString"
    email "MyString"
    userid "MyString"
    host_id "MyString"
    guest_list ""
  end
end
