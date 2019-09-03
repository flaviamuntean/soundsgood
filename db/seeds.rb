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
User.create(first_name:"Pietro", last_name:"Dalla Vecchia", email:"pietro@lw.com", password:"abcd123")
User.create(first_name:"Tiago", last_name:"Alexandre Vaz Faria", email:"tiago@lw.com", password:"abcd123")
