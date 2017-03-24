require_relative ('models/customer')
require_relative ('models/film')
require_relative ('models/ticket')

require ('pry')

customer1 = Customer.new({ 'name' => 'Samwise Gamgee' })
customer1.save()
customer2 = Customer.new({ 'name' => 'Frodo Baggins' })
customer2.save()












binding.pry
nil