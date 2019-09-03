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
User.create(first_name:"Pietro", last_name:"Dalla Vecchia", email:"pietro@lw.com", password:"abcd123", soundcloud_profile: "https://soundcloud.com/pietro-dallavecchia")
User.create(first_name:"Tiago", last_name:"Alexandre Vaz Faria", email:"tiago@lw.com", password:"abcd123")
User.create(first_name:"Carolina", last_name:"Vieira", email:"carolina@lw.com", password:"abcd123")

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
