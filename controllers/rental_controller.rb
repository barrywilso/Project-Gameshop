require_relative('../models/rental.rb')


#INDEX
get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

# NEW
get '/rentals/new' do
  erb(:"rentals/new")
end

# CREATE
post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  redirect "/rentals"
end

# SHOW
get '/rentals/:id' do
  id = params[:id].to_i()
  @rental = Rental.find(id)
  erb(:"rentals/show")
end

# DELETE
post '/rentals/:id/delete' do
  id = params[:id].to_i()
  rental = Rental.find(id)
  rental.delete()
  redirect '/rentals'
end

# EDIT
get '/rentals/:id/edit' do
  id = params[:id].to_i()
  @rental = Rental.find(id)
  erb(:"rentals/edit")
end

#UPDATE
post '/rentals/:id' do
  rental = Rental.new(params)
  rental.update()
  redirect '/rentals'
end
