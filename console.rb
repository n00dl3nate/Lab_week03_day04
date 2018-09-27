require_relative('./models/movie.rb')
require_relative('./models/actor.rb')
require_relative('./models/role.rb')
require('pry')
# require('pg')

Movie.delete_all
Actor.delete_all
Role.delete_all
movie1 = Movie.new({
  "title" => "Fight Club",
  "genre" => "Drama"
  })

movie2 = Movie.new({
  "title" => "The Nun",
  "genre" => "Horror"
    })

    movie1.save
    movie2.save




actor1 = Actor.new({
  "f_name" => "Brad",
  "l_name" => "Pitt"
})

actor2 = Actor.new({
  "f_name" => "Edward",
  "l_name" => "Norton"
})

actor3 = Actor.new({
  "f_name" => "Taissa",
  "l_name" => "Farmiga"
})

actor4 = Actor.new({
  "f_name" => "Jonas",
  "l_name" => "Bloquet"
})

  actor1.save
  actor2.save
  actor3.save
  actor4.save



role1 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor1.id,
  "fee" => 1000000
  })

role2 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor2.id,
  "fee" => 500000
  })

role3 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor3.id,
  "fee" => 10000000
  })

role4 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor1.id,
  "fee" => 50000
  })

role5 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor4.id,
  "fee" => 250000
    })


role1.save
role2.save
role3.save
role4.save
role5.save


movie1.title = "Fight Pub"
movie1.update

actor3.f_name = "Jackie"
actor3.update
binding.pry
role4.fee = 40000
role4.update
