require_relative('../models/game.rb')
require_relative('../models/customer.rb')
require_relative('../models/rental.rb')


Game.delete_all()
Customer.delete_all()
Rental.delete_all()

customer1 = Customer.new(
  {
    'first_name' => 'John',
    'last_name' => 'Carmack'
  }
)

customer2 = Customer.new(
  {
    'first_name' => 'Sid',
    'last_name' => 'Meier'
  }
)
customer3 = Customer.new(
  {
    'first_name' => 'Shigeru',
    'last_name' => 'Miyamoto'
  }
)
customer4 = Customer.new(
  {
    'first_name' => 'Gabe',
    'last_name' => 'Newell'
  }
)
customer5 = Customer.new(
  {
    'first_name' => 'Alexey',
    'last_name' => 'Pajitnov'
  }
)

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()


game1 = Game.new(
  {
    'platform' => 'PC',
    'title' => 'Half Life',
    'genre' => 'FPS'

  }
)
game2 = Game.new(
  {
    'platform' => 'Nintendo 64',
    'title' => 'Legend of Zelda',
    'genre' => 'Adventure'

  }
)
game3 = Game.new(
  {
    'platform' => 'Xbox',
    'title' => 'Halo',
    'genre' => 'FPS'

  }
)
game4 = Game.new(
  {
    'platform' => 'Playstation 2',
    'title' => 'GTA III',
    'genre' => 'FPS'

  }
)

game5 = Game.new(
  {
    'platform' => 'PC',
    'title' => 'Witcher 3',
    'genre' => 'RPG'

  }
)

game1.save()
game2.save()
game3.save()
game4.save()
game5.save()

rental1 = Rental.new({'customer_id' => customer1.id, 'game_id' => game1.id})
rental2 = Rental.new({'customer_id' => customer2.id, 'game_id' => game2.id})

rental1.save()
rental2.save()
