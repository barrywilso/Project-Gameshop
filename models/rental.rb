require_relative("../db/sql_runner")

class Rental

  attr_reader :id
  attr_accessor :customer_id, :game_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @game_id = options['game_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals (customer_id, game_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @game_id]
    rental = SqlRunner.run(sql, values)[0]
    @id = rental['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    rental= SqlRunner.run(sql)
    return rental.map{|rental|Rental.new(rental)}
  end

  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM rentals WHERE id = $1"
    values = [id]
    rental = SqlRunner.run(sql, values).first()
    return Rental.new(rental)
  end

  def update()
    sql = "Update rentals SET (customer_id, game_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @game_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
