# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(first_name: "David", last_name: "Trevino", email: "david@example.com", address: "123 Main St")
customer2 = Customer.create!(first_name: "Larry", last_name: "Grace", email: "larry@example.com", address: "321 Main St")
customer3 = Customer.create!(first_name: "Judith", last_name: "McCarthy", email: "judith@example.com", address: "1000 Main St")

tea1 = Tea.create!(title: "Green Tea", description: "Green", temperature: 200, brew_time: 3)
tea2 = Tea.create!(title: "Black Tea", description: "Black", temperature: 200, brew_time: 5)
tea3 = Tea.create!(title: "Oolong Tea", description: "Oolong", temperature: 200, brew_time: 5)
tea4 = Tea.create!(title: "White Tea", description: "White", temperature: 200, brew_time: 4)

subscription1 = Subscription.create!(title: tea1.title, price: 10, status: 1, frequency: 1, customer_id: customer1.id, tea_id: tea1.id)
subscription2 = Subscription.create!(title: tea2.title, price: 10, status: 0, frequency: 1, customer_id: customer1.id, tea_id: tea2.id)

subscription3 = Subscription.create!(title: tea3.title, price: 10, status: 0, frequency: 1, customer_id: customer2.id, tea_id: tea3.id)
subscription4 = Subscription.create!(title: tea4.title, price: 10, status: 0, frequency: 1, customer_id: customer2.id, tea_id: tea4.id)

subscription5 = Subscription.create!(title: tea1.title, price: 10, status: 0, frequency: 1, customer_id: customer3.id, tea_id: tea1.id)