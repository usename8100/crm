# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Account.create!(name: Faker::Name.unique.name, email: 'qwe@qwe.qwe', password: '123123')
CustomerRole.create!(name: 'lead')
CustomerRole.create!(name: 'customer')
Staff.create!(user_id: 1, designation: 'Manager')
UserRole.create(name: "Manager")
UserRole.create(name: "Seller")
UserRole.create(name: "Customer Officer")
Customer.create!(website: Faker::Internet.domain_name, source: 'facebook.com', status: 'new',note: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco ', 
						name: Faker::Name.unique.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, staff_id: 1, customer_role_id: 1, detail_address: 'Huynh Cung', city: 'Ha Noi')
Customer.create!(website: Faker::Internet.domain_name, source: 'facebook.com', status: 'new',note: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco ', 
						name: Faker::Name.unique.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, staff_id: 1, customer_role_id: 1, detail_address: 'Huynh Cung', city: 'Ha Noi')
Customer.create!(website: Faker::Internet.domain_name, source: 'facebook.com', status: 'new',note: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco ', 
						name: Faker::Name.unique.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, 
						staff_id: 1, customer_role_id: 1, detail_address: 'Huynh Cung', city: 'Ha Noi')
Customer.create!(website: Faker::Internet.domain_name, source: 'facebook.com', status: 'new',note: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco ', 
						name: Faker::Name.unique.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, 
						staff_id: 1, customer_role_id: 1, detail_address: 'Huynh Cung', city: 'Ha Noi')
Customer.create!(website: Faker::Internet.domain_name, source: 'facebook.com', status: 'new',note: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco ', 
						name: Faker::Name.unique.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, 
						staff_id: 1, customer_role_id: 1, detail_address: 'Huynh Cung', city: 'Ha Noi')
Contact.create!(customer_id: 1, name: 'Hannah', phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, designation: 'Secretary', notes: 'secondary contact for work')
Contact.create!(customer_id: 1, name: 'Tom', phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, designation: 'Secretary', notes: 'contact for entertainment')
Call.create!(customer_id: 1, staff_id: 1, date: Time.zone.now, description: 'Talk about newest product')
Call.create!(customer_id: 1, staff_id: 1, date: Time.zone.now, description: 'Talk about ordering experience')
Call.create!(customer_id: 1, staff_id: 1, date: Time.zone.now, description: "Talk about customer's feedback")
Appointment.create!(customer_id: 1, date: Time.zone.now, subject: 'New product information', 
							content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
Appointment.create!(customer_id: 1, date: Time.now.tomorrow, subject: 'New product information', 
							content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
Note.create(customer_id: 1, content: Faker::Books::Lovecraft.paragraph)
Note.create(customer_id: 1, content: Faker::Books::Lovecraft.paragraph)
Note.create(customer_id: 1, content: Faker::Books::Lovecraft.paragraph)
Category.create(name: "Do gia dung")
Item.create(name: "tv 14inch", category_id: 1, tax_id: 1, quantity: 22, price: 1200000, status: true)
Item.create(name: "may giat 200l", category_id: 1, tax_id: 1, quantity: 22, price: 1200000, status: true)
Item.create(name: "tu lanh 140l", category_id: 1, tax_id: 1, quantity: 22, price: 1200000, status: true)
Item.create(name: "xe may xuduka", category_id: 1, tax_id: 1, quantity: 22, price: 1200000, status: true)
UserRole.create(name: 'Manager')
UserRole.create(name: 'Customer Officer')
UserRole.create(name: 'Seller')
Tax.create(name: "No tax", tax_percent: 0)
Tax.create(name: "VAT", tax_percent: 5)
