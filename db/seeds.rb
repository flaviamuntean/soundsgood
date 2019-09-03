# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Instrument.destroy_all

Instrument.create(name:"acoustic guitar")
Instrument.create(name:"guitar")
Instrument.create(name:"drums")
Instrument.create(name:"percussion")
Instrument.create(name:"bass guitar")
Instrument.create(name:"vocal")
Instrument.create(name:"piano")
Instrument.create(name:"violin")
Instrument.create(name:"trumpet")
Instrument.create(name:"saxophone")

Genre.destroy_all

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

User.destroy_all

User.create(first_name:"David", last_name:"Grohl", email:"davig@lw.com", password:"abcd123")
User.create(first_name:"Flavia", last_name:"Muntean", email:"flavia@lw.com", password:"abcd123")
User.create(first_name:"Bruno", last_name:"Nery", email:"bruno@lw.com", password:"abcd123")
User.create(first_name:"Pietro", last_name:"Dalla Vecchia", email:"pietro@lw.com", password:"abcd123", soundcloud_profile: "https://soundcloud.com/pietro-dallavecchia")
User.create(first_name:"Tiago", last_name:"Alexandre Vaz Faria", email:"tiago@lw.com", password:"abcd123")
User.create(first_name:"Carolina", last_name:"Vieira", email:"carolina@lw.com", password:"abcd123", spotify_config: "{\"provider\"=>\"spotify\", \"uid\"=>\"11121402338\", \"info\"=>{\"name\"=>\"Carolina Vieira\", \"nickname\"=>\"11121402338\", \"email\"=>\"carolv0395@gmail.com\", \"urls\"=>{\"spotify\"=>\"https://open.spotify.com/user/11121402338\"}, \"image\"=>\"https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/47681692_10155991676127444_1552682668083118080_n.jpg?_nc_cat=111&_nc_oc=AQkC9mOCoG6NHN4ANnokpHR_25KtLFeJ0E17wqkgRldcIKLKhQNOI69CQWsbXNYyt2w&_nc_ht=scontent.xx&oh=5017b187f3bf1f8d2cfbb1c12c2d3b48&oe=5E0D74F9\", \"birthdate\"=>nil, \"country_code\"=>\"PT\", \"product\"=>\"premium\", \"follower_count\"=>32}, \"credentials\"=>{\"token\"=>\"BQAiI4L5XOV4pmInlQDB3mlWlr8SklW-TGvq7oqE8XXHOcnQYWStCo0QVQu8vqZ2KG-tH8lwAK72mremTd6WDKFZJHJyWLRXHnyPHlBphfKj8JjrLREExWrq-jnv46ZWTVya6BR5KewpSoUc6UCuiW24ahQBsl18E-75nOhzUFNNEou6nuqO8V3ooVPQSBL8X__D9QJJxG8zZojrV9nx6XUoSJ9DQKMMPjUc\", \"refresh_token\"=>\"AQAFc7f5ATByT1grmwFxZuo7XIE8EHB5L73TLdpl65ZKybshwfco98j4nuyoukNRt54ClGPUF5qH0pzheC5-N0tBa9MtXxKR19XXrRjHCaZ9u1HTs6RhiYBy3JYQjIRNlKWzRg\", \"expires_at\"=>1567453966, \"expires\"=>true}, \"extra\"=>{\"raw_info\"=>{\"country\"=>\"PT\", \"display_name\"=>\"Carolina Vieira\", \"email\"=>\"carolv0395@gmail.com\", \"explicit_content\"=>{\"filter_enabled\"=>false, \"filter_locked\"=>false}, \"external_urls\"=>{\"spotify\"=>\"https://open.spotify.com/user/11121402338\"}, \"followers\"=>{\"href\"=>nil, \"total\"=>32}, \"href\"=>\"https://api.spotify.com/v1/users/11121402338\", \"id\"=>\"11121402338\", \"images\"=>[{\"height\"=>nil, \"url\"=>\"https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/47681692_10155991676127444_1552682668083118080_n.jpg?_nc_cat=111&_nc_oc=AQkC9mOCoG6NHN4ANnokpHR_25KtLFeJ0E17wqkgRldcIKLKhQNOI69CQWsbXNYyt2w&_nc_ht=scontent.xx&oh=5017b187f3bf1f8d2cfbb1c12c2d3b48&oe=5E0D74F9\", \"width\"=>nil}], \"product\"=>\"premium\", \"type\"=>\"user\", \"uri\"=>\"spotify:user:11121402338\"}}}")
