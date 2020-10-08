# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
FoodItem.destroy_all
FoodEntry.destroy_all
DailyLog.destroy_all
Bet.destroy_all

cat = User.create(name: 'Catrina Friday', email:"email.com", password:'password', weight: '140', bank: 100, image: 'image', city: 'North Bethesda, MD')

day_1 = DailyLog.create(user_id: cat.id, date: Date.today, day_number: 'day 1')

bacon = FoodItem.create(category: 'breakfast', food_name: 'bacon', calories: 80, serving_qty: 2, serving_unit: 'oz')
eggs = FoodItem.create(category: 'breakfast', food_name: 'eggs', calories: 60, serving_qty: 1, serving_unit: 'piece')
avocado = FoodItem.create(category: 'breakfast', food_name: 'avocado', calories: 70, serving_qty: 2, serving_unit: 'oz')



puts 'Another One!'