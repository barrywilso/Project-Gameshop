require_relative('../models/customer.rb')


#INDEX
get 'customers' do
@customers = Customer.all()
erb(:"customers/index")
end
