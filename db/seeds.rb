# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require "open-uri"

puts "Cleaning database..."
Bet.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = User.new(email: "chris@myemail.com", password: "123123", name: "Chris", location: "Athens, Greece,")
file = URI.open("https://cdna.artstation.com/p/assets/images/images/015/425/426/large/frederic-caeyers-athenianv4.jpg")
user_1.photo.attach(io: file, filename: "chris.jpg", content_type: "image/jpg")
user_1.save!
user_2 = User.new(email: "dennis@myemail.com", password: "123123", name: "Dennis", location: "Denver, Colorado, USA")
file = URI.open("https://c8.alamy.com/comp/EWEA8G/dennis-the-menace-EWEA8G.jpg")
user_2.photo.attach(io: file, filename: "dennis.jpg", content_type: "image/jpg")
user_2.save!
user_3 = User.new(email: "mateo@myemail.com", password: "123123", name: "Mateo", location: "Paris, France")
file = URI.open("https://media.istockphoto.com/id/157421404/pt/foto/franc%C3%AAs-baguettes-e-vinho.jpg?s=1024x1024&w=is&k=20&c=81ACw2BfCvcQ1bZa_q2Lpi9NxnseQDuxLpzWIblpofc=")
user_3.photo.attach(io: file, filename: "mateo.jpg", content_type: "image/jpg")
user_3.save!
user_4 = User.new(email: "miguel@myemail.com", password: "123123", name: "Miguel", location: "Lisbon, Portugal")
file = URI.open("https://cdn.resfu.com/media/img_news/goal_nuno-gomes_llwaw6jb7c5h1dus80yol8krn.jpg")
user_4.photo.attach(io: file, filename: "miguel.jpg", content_type: "image/jpg")
user_4.save!
user_5 = User.new(email: "riri@myemail.com", password: "123123", name: "Rihanna", location: "Bridgetown, Barbados")
file = URI.open("https://static.wikia.nocookie.net/whumpapedia/images/0/07/Rihanna.jpeg")
user_5.photo.attach(io: file, filename: "rihanna.jpg", content_type: "image/jpg")
user_5.save!

tag_1 = Tag.new(name: "Sport")
tag_1.save!
tag_2 = Tag.new(name: "Gaming")
tag_2.save!
tag_3 = Tag.new(name: "Challenge")
tag_3.save!

puts "Creating bets..."
bet_1 = Bet.new(name: "Bet 1", location: "Paris", stake: "$45", end_time: "10-11-2023", status: "pending", tag: tag_1, privacy: "public", user: user_1, opponent: user_2)
bet_1.save!

bet_2 = Bet.new(name: "Bet 2", location: "Lisbon", stake: "$25", end_time: "10-12-2023", status: "pending", tag: tag_2, privacy: "public", user: user_3, opponent: user_4)
bet_2.save!

bet_3 = Bet.new(name: "Bet 3", location: "London", stake: "$35", end_time: "10-13-2023", status: "pending", tag: tag_3, privacy: "public", user: user_4, opponent: user_5)
bet_3.save!
