# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Instrument.destroy_all
Genre.destroy_all
User.destroy_all
UserInstrument.destroy_all
Genre.destroy_all 
UserGenre.destroy_all

Instrument.create(name:"acoustic guitar", icon: "instruments/Guitar Classical.svg")
Instrument.create(name:"guitar", icon: "instruments/Guitar Electric.svg")
Instrument.create(name:"drums", icon: "instruments/Drums.svg")
Instrument.create(name:"percussion", icon: "instruments/Percussions.svg")
Instrument.create(name:"bass guitar", icon: "instruments/Bass.svg")
Instrument.create(name:"vocal", icon: "instruments/Vocals.svg")
Instrument.create(name:"piano", icon: "instruments/Piano.svg")
Instrument.create(name:"violin", icon: "instruments/Violin.svg")
Instrument.create(name:"trumpet", icon: "instruments/Trumpet.svg")
Instrument.create(name:"saxophone", icon: "instruments/Sax.svg")


Genre.create(name:"pop")
Genre.create(name:"rock")
Genre.create(name:"metal")
Genre.create(name:"jazz")
Genre.create(name:"classical")
Genre.create(name:"hard core")
Genre.create(name:"funk")
Genre.create(name:"eletronic")
Genre.create(name:"hip-hop")
Genre.create(name:"rap")
Genre.create(name:"alternative")
Genre.create(name:"indie")
Genre.create(name:"R&B")
Genre.create(name:"dance")
Genre.create(name:"MPB")
Genre.create(name:"country")
Genre.create(name:"blues")
Genre.create(name:"soul")
Genre.create(name:"reggae")


User.create(first_name:"David", last_name:"Grohl", email:"davig@lw.com", password:"abcd123")
User.create(first_name:"Flavia", last_name:"Muntean", email:"flavia@lw.com", password:"abcd123")
User.create(first_name:"Bruno", last_name:"Nery", email:"bruno@lw.com", password:"abcd123")
User.create(first_name:"Pietro", last_name:"Dalla Vecchia", email:"pietro@lw.com", password:"abcd123")
User.create(first_name:"Tiago", last_name:"Alexandre Vaz Faria", email:"tiago@lw.com", password:"abcd123")
User.create(first_name:"Carolina", last_name:"Vieira", email:"carolina@lw.com", password:"abcd123", spotify_config: "{\"provider\"=>\"spotify\", \"uid\"=>\"11121402338\", \"info\"=>{\"name\"=>\"Carolina Vieira\", \"nickname\"=>\"11121402338\", \"email\"=>\"carolv0395@gmail.com\", \"urls\"=>{\"spotify\"=>\"https://open.spotify.com/user/11121402338\"}, \"image\"=>\"https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/47681692_10155991676127444_1552682668083118080_n.jpg?_nc_cat=111&_nc_oc=AQkC9mOCoG6NHN4ANnokpHR_25KtLFeJ0E17wqkgRldcIKLKhQNOI69CQWsbXNYyt2w&_nc_ht=scontent.xx&oh=5017b187f3bf1f8d2cfbb1c12c2d3b48&oe=5E0D74F9\", \"birthdate\"=>nil, \"country_code\"=>\"PT\", \"product\"=>\"premium\", \"follower_count\"=>32}, \"credentials\"=>{\"token\"=>\"BQAiI4L5XOV4pmInlQDB3mlWlr8SklW-TGvq7oqE8XXHOcnQYWStCo0QVQu8vqZ2KG-tH8lwAK72mremTd6WDKFZJHJyWLRXHnyPHlBphfKj8JjrLREExWrq-jnv46ZWTVya6BR5KewpSoUc6UCuiW24ahQBsl18E-75nOhzUFNNEou6nuqO8V3ooVPQSBL8X__D9QJJxG8zZojrV9nx6XUoSJ9DQKMMPjUc\", \"refresh_token\"=>\"AQAFc7f5ATByT1grmwFxZuo7XIE8EHB5L73TLdpl65ZKybshwfco98j4nuyoukNRt54ClGPUF5qH0pzheC5-N0tBa9MtXxKR19XXrRjHCaZ9u1HTs6RhiYBy3JYQjIRNlKWzRg\", \"expires_at\"=>1567453966, \"expires\"=>true}, \"extra\"=>{\"raw_info\"=>{\"country\"=>\"PT\", \"display_name\"=>\"Carolina Vieira\", \"email\"=>\"carolv0395@gmail.com\", \"explicit_content\"=>{\"filter_enabled\"=>false, \"filter_locked\"=>false}, \"external_urls\"=>{\"spotify\"=>\"https://open.spotify.com/user/11121402338\"}, \"followers\"=>{\"href\"=>nil, \"total\"=>32}, \"href\"=>\"https://api.spotify.com/v1/users/11121402338\", \"id\"=>\"11121402338\", \"images\"=>[{\"height\"=>nil, \"url\"=>\"https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/47681692_10155991676127444_1552682668083118080_n.jpg?_nc_cat=111&_nc_oc=AQkC9mOCoG6NHN4ANnokpHR_25KtLFeJ0E17wqkgRldcIKLKhQNOI69CQWsbXNYyt2w&_nc_ht=scontent.xx&oh=5017b187f3bf1f8d2cfbb1c12c2d3b48&oe=5E0D74F9\", \"width\"=>nil}], \"product\"=>\"premium\", \"type\"=>\"user\", \"uri\"=>\"spotify:user:11121402338\"}}}")

# users = User.all
instruments = Instrument.all
id = 1
6.times do
    UserInstrument.create(user: User.find(id), instrument: instruments.sample)
    id += 1 unless id == 6
end 

id2 = 1
genres = Genre.all
6.times do
    UserGenre.create(user: User.find(id2), genre: genres.sample)
    id2 += 1 unless id2 == 6
end

