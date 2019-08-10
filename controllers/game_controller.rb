require_relative('../models/game.rb')

#INDEX
get '/games' do
  @games = Game.all()
  erb(:"games/index")
end

# NEW
get '/games/new' do
  erb(:"games/new")
end

# CREATE
post '/games' do
  game = Game.new(params)
  game.save()
  redirect "/games"
end

# SHOW
get '/games/:id' do
  id = params[:id].to_i()
  @game = Game.find(id)
  erb(:"games/show")
end

# DELETE
post '/games/:id/delete' do
  id = params[:id].to_i()
  game = Game.find(id)
  game.delete()
  redirect '/games'
end

# EDIT
get '/games/:id/edit' do
  id = params[:id].to_i()
  @game = Game.find(id)
  erb(:"games/edit")
end

#UPDATE
post '/games/:id' do
  game = Game.new(params)
  game.update()
  redirect '/games'
end
