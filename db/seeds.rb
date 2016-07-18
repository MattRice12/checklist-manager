# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lists = ["Stuff I like", "Stuff I hate", "Stuff That Reminds Me How Much I Hate Dane", "Stuff That Reminds Me How Much I Love Dane"]

stuff = ["Kittens", "Dogs", "Elephants", "Giraffes", "Free Popcorn", "New Movies", "Britney Spears", "Coffee", "Pokemon", "Coding", "Cars", "Bikes", "Dinosaurs", "Birds", "Kangaroos", "Food", "Eggs", "Beaks", "Beakers", "Aardvarks", "Rocky Balboa", "Arnold Schwarzenegger", "Batman", "Spiderman", "Superman", "Pens", "Clouds", "Grass", "Trees", "Websites", "URLs", "Bootstrap", "Skeleton", "Ghosts", "Halloween", "Tigers", "Lions"]

count = 0

lists.each do |list_name|
  list = List.create!(name: "#{list_name}")

  5.times do
    Task.create!(body: "#{stuff.sample}",
                 complete: rand(0..1),
                 position: count += 1,
                 list_id: list.id
                 )
  end
end
