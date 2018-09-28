require_relative("../db/sql_runner")

class Movie

attr_reader :id
attr_accessor :title, :genre ,:budget

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']

  end

  def save

    sql = "INSERT INTO movies (
    title,
    genre
    )
    VALUES ($1,$2)
    RETURNING id;
    "
    values = [@title,@genre]
    movie = SqlRunner.run(sql,values).first
    @id = movie['id'].to_i

  end

  def self.delete_all

    sql = "DELETE FROM movies"

    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE movies
           SET (
           title,
           genre )
           = ($1,$2)
           WHERE id = $3 ;
           "
        values = [@title,@genre,@id]
        SqlRunner.run(sql,values)
  end

  def actor()

    sql =
    'SELECT actors .* FROM actors
     INNER JOIN roles
     ON roles.actor_id = actors.id
     WHERE roles.movie_id = $1;'

  results = SqlRunner.run(sql,[@id])

  actors = results.map do |order_hash|

  Actor.new(order_hash)

    end

  end

  def remainder

    sql = "SELECT roles.fee
	   FROM actors
     INNER JOIN roles
     ON roles.actor_id = actors.id
     WHERE roles.movie_id = $1;"

    results = SqlRunner.run(sql,[@id])

    remainder = results.map do |hash|

    result = hash[0]['fee']
    # casting1 = hash
    #
    # casting_fees = casting1.map{|casting| casting.fee}
    #
    # p casting_fees


     end





     # total = 0
     # order.each { |fee| total += fee[0]['fee'].to_i }
     # return total


  end







end
