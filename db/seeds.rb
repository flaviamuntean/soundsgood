# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserInstrument.destroy_all
UserGenre.destroy_all
Instrument.destroy_all
Genre.destroy_all
User.destroy_all
Conversation.destroy_all
Message.destroy_all



addresses = ['Rua Rodrigues Sampaio 172, Lisboa', 'São Jorge de Arroios, Lisbon', 'Rua João Penha 2-14, Lisboa', 'Rua Damasceno Monteiro 74-152, Lisboa', 'Rua Manuel Soares Guedes 1, Lisboa', "Rua de Sant'Ana à Lapa 2-52, Lisboa", 'Rua do Patrocínio 55-1, Lisboa', 'Rua de Borges Carneiro 57, Lisboa', 'Rua Vítor Cordon 24-40, Lisboa']

# Create instruments

Instrument.create(name:"acoustic guitar", icon: "instruments/Guitar Classical.svg")
Instrument.create(name:"electric guitar", icon: "instruments/Guitar Electric.svg")
Instrument.create(name:"drums", icon: "instruments/Drums.svg")
Instrument.create(name:"percussion", icon: "instruments/Percussions.svg")
Instrument.create(name:"bass guitar", icon: "instruments/Bass.svg")
Instrument.create(name:"vocal", icon: "instruments/Vocals.svg")
Instrument.create(name:"piano", icon: "instruments/Piano.svg")
Instrument.create(name:"violin", icon: "instruments/Violin.svg")
Instrument.create(name:"trumpet", icon: "instruments/Trumpet.svg")
Instrument.create(name:"saxophone", icon: "instruments/Sax.svg")

# Create genres

Genre.create(name:"pop")
Genre.create(name:"rock")
Genre.create(name:"metal")
Genre.create(name:"jazz")
Genre.create(name:"classical")
Genre.create(name:"hard core")
Genre.create(name:"funk")
Genre.create(name:"electronic")
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

# Create users
User.create(first_name:"Cory", last_name:"Wong", email:"cory@lw.com", password:"abcd123", address: addresses.sample, birthday: "1988-02-10")
User.create(first_name:"Jennifer", last_name:"Diehl", email:"jennifer@lw.com", password:"abcd123", address: addresses.sample, birthday: "1996-02-10")
User.create(first_name:"Francesco", last_name:"Lucidi", email:"francesco@lw.com", password:"abcd123", address: addresses.sample, birthday: "1992-02-10")
User.create(first_name:"Pietro", last_name:"Dalla Vecchia", email:"pietro@lw.com", password:"abcd123", soundcloud_profile: "https://soundcloud.com/pietro-dallavecchia", address: addresses.sample, birthday: "1995-02-10")
User.create(first_name:"Giacomo", last_name:"Bigoni", email:"giacomo@lw.com", password:"abcd123", address: addresses.sample, birthday: "1990-02-10")
User.create(first_name:"Heidi", last_name:"Joubert", email:"heidi@lw.com", password:"abcd123", address: addresses.sample, birthday: "1988-02-10")
User.create(first_name:"David", last_name:"Grohl", email:"david@lw.com", password:"abcd123", address: addresses.sample, birthday: "1972-02-10", soundcloud_profile: "https://soundcloud.com/davegrohlofficial")
# User.create(first_name:"Flavia", last_name:"Muntean", email:"flavia@lw.com", password:"abcd123", address: addresses.sample, soundcloud_profile: "https://soundcloud.com/pietro-dallavecchia", birthday: "1991-02-10")
User.create(first_name:"Bruno", last_name:"Nery", email:"bruno@lw.com", password:"abcd123", address: addresses.sample, soundcloud_profile: "https://soundcloud.com/brunomerz", birthday: "1989-02-10")
User.create(first_name:"Tiago", last_name:"Alexandre Vaz Faria", email:"tiago@lw.com", password:"abcd123", address: addresses.sample, soundcloud_profile: "https://soundcloud.com/tiago_cruzer1", birthday: "1998-02-10")
User.create(first_name:"Carolina", last_name:"Vieira", email:"carolina@lw.com", password:"abcd123", address: addresses.sample,  birthday: "1996-02-10", soundcloud_profile: "https://soundcloud.com/carol-lobrigato")


# Assign instruments and genres to users

users = User.all
instruments = Instrument.all
genres = Genre.all

users.each do |user|
  instruments.sample(rand(1..5)).each do |instrument|
    UserInstrument.create(user: user, instrument: instrument)
  end

  genres.sample(5).each do |genre|
    UserGenre.create(user: user, genre: genre)
  end
end


Video.create(url: "https://www.youtube.com/watch?v=Mh89hr54B2Q",user: users.find(1))
Video.create(url: "https://www.youtube.com/watch?v=BtNNwspPPCE",user: users.find(2))
Video.create(url: "https://www.youtube.com/watch?v=3inQYHjpWMA",user: users.find(3))
Video.create(url: "https://www.youtube.com/watch?v=Jm-hzt6mFh4",user: users.find(4))
Video.create(url: "https://www.youtube.com/watch?v=0-GY2R-7JN8",user: users.find(5))
Video.create(url: "https://www.youtube.com/watch?v=zielGCfHA-8",user: users.find(6))

# Assign videos to users
# video_urls = ["https://www.youtube.com/watch?v=hLSEH4Bbb8A", "https://www.youtube.com/watch?v=S3fTw_D3l10",
#               "https://www.youtube.com/watch?v=hi4pzKvuEQM", "https://www.youtube.com/watch?v=eKQuwAmIVKA",
#               "https://www.youtube.com/watch?v=zFb86yrodxE", "https://www.youtube.com/watch?v=-98o_QOrJho",
#               "https://www.youtube.com/watch?v=UrMmr1oMPGA", "https://www.youtube.com/watch?v=jxKjOOR9sPU",
#               "https://www.youtube.com/watch?v=bpOSxM0rNPM", "https://www.youtube.com/watch?v=YXwYJyrKK5A",
#               "https://www.youtube.com/watch?v=_GMQLjzVGfw", "https://www.youtube.com/watch?v=YKBw6CikgzA",
#               "https://www.youtube.com/watch?v=jJp3kVelU3c", "https://www.youtube.com/watch?v=7lp3pgAiZqo",
#               "https://www.youtube.com/watch?v=sFrNsSnk8GM", "https://www.youtube.com/watch?v=eWc9hvNV3ko"
#               ]

# video_urls.each do |u|
#   Video.create(url: u, user: users.sample)
# end
