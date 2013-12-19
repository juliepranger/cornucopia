# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    drinks "MyString"
    appetizer "MyString"
    salad "MyString"
    soup_or_stew "MyString"
    main_dish "MyString"
    dessert "MyString"
  end
end
