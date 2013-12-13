# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient_recipe do
    recipe nil
    ingredient nil
    quantity 1.5
    unit_measure "MyString"
  end
end
