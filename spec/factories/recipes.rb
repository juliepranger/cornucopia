# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name "MyString"
    serves 1
    total_time 1
  end
end
