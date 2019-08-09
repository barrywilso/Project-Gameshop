require_relative("../db/sql_runner")
class Game

  attr_reader :id
  attr_accessor :platform, :title, :genre

  def initialize(game)
    @id = game['id'].to_i() if game['id']
    @platform = game['platform']
    @title = game['title']
    @genre = game['genre']
  end

  def save()
    sql = "INSERT INTO games(platform, title, genre)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@platform, @title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM games"
    games = SqlRunner.run(sql)
    return  games.map {|game| Game.new(game)}
  end

  def self.find(id)
    sql = "SELECT * FROM games WHERE id = $1"
    values = [id]
    game = SqlRunner.run(sql, values).first()
    return Game.new(game)
  end

  def update()
    sql = "UPDATE games SET(platform, title, genre) = ($1, $2, $3) WHERE id = $4"
    values = [@platform, @title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM games"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM games WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



end
