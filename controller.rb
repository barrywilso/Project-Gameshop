require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
also_reload('./models/*')

require_relative("./controllers/game_controller.rb")
require_relative("./controllers/customer_controller.rb")


get '/' do
  erb(:home)
end
