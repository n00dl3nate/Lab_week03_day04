require_relative("../db/sql_runner")

class Role

  attr_reader :id , :movie_id , :actor_id
  attr_accessor :fee

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @movie_id= options['movie_id']
    @actor_id = options['actor_id']
    @fee = options['fee']

    end

  def save

    sql = "INSERT INTO roles (
    movie_id,
    actor_id,
    fee
    )
    VALUES ($1,$2,$3)
    RETURNING id;
    "

    values = [@movie_id,@actor_id,@fee]

    roles = SqlRunner.run( sql,values ).first

    @id = roles['id'].to_i
  end

  def self.delete_all

    sql = "DELETE FROM roles"

    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE roles
           SET (
           movie_id,
           actor_id,
           fee
         )
           = ($1,$2,$3)
           WHERE id = $4 ;
           "
        values = [@movie_id,@actor_id,@fee,@id]
        SqlRunner.run(sql,values)
  end
end
