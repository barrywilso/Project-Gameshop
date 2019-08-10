require_relative('../models/customer.rb')


#INDEX
get '/customers' do
  @customers = Customer.all()
  erb(:"customers/index")
end

# NEW
get '/customers/new' do
  erb(:"customers/new")
end

# CREATE
post '/customers' do
  customer = Customer.new(params)
  customer.save()
  redirect "/customers"
end

# SHOW
get '/customers/:id' do
  id = params[:id].to_i()
  @customer = Customer.find(id)
  erb(:"customers/show")
end

# DELETE
post '/customers/:id/delete' do
  id = params[:id].to_i()
  customer = Customer.find(id)
  customer.delete()
  redirect '/customers'
end

# EDIT
get '/customers/:id/edit' do
  id = params[:id].to_i()
  @customer = Customer.find(id)
  erb(:"customers/edit")
end

#UPDATE
post '/customers/:id' do
  customer = Customer.new(params)
  customer.update()
  redirect '/customers'
end
