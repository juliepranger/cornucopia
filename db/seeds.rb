# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Category.create(category_name: 'Drinks') 
Category.create(category_name: 'Appetizer')
Category.create(category_name: 'Side Dish')
Category.create(category_name: 'Salad')
Category.create(category_name: 'Main Dish')
Category.create(category_name: 'Dessert')
Category.create(category_name: 'Soup or Stew')
