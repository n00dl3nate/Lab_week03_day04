require_relative("../db/sql_runner")

class Actor

attr_reader :id
attr_accessor :f_name ,:l_name

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @f_name = options['f_name']
    @l_name = options['l_name']

  end

  def save

    sql = "INSERT INTO actors (
    f_name,
    l_name
    )
    VALUES ($1,$2)
    RETURNING id;
    "
    values = [@f_name,@l_name]
    actor = SqlRunner.run(sql,values)[0]
    @id = actor['id'].to_i

  end

  def self.delete_all

    sql = "DELETE FROM actors"

    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE actors
           SET (
             f_name,
             l_name
            )
           = ($1,$2)
           WHERE id = $3 ;
           "
        values = [@f_name,@l_name,@id]
        SqlRunner.run(sql,values)
  end

  def movies()

    sql =
    'SELECT movies .* FROM movies
     INNER JOIN roles
     ON roles.movie_id = movies.id
     WHERE roles.actor_id = $1;'

  results = SqlRunner.run(sql,[@id])

  movies = results.map do |order_hash|

  Movie.new(order_hash)
end

end


end
