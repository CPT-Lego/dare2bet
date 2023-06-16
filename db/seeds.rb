# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require "open-uri"

puts "Cleaning database..."
Bet.destroy_all
User.destroy_all
Tag.destroy_all

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
user_6 = User.new(email: "albert@myemail.com", password: "123123", name: "Albert", location: "Barcelona, Spain")
file = URI.open("https://i0.wp.com/albertgrimaldo.com/wp-content/uploads/2022/09/Albert-Grimaldo.jpg")
user_6.photo.attach(io: file, filename: "albert.jpg", content_type: "image/jpg")
user_6.save!
user_7 = User.new(email: "alfredo@myemail.com", password: "123123", name: "Alfredo", location: "Santiago, Chile")
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1685354163/xufo9v8p94zdqx8tyved.jpg")
user_7.photo.attach(io: file, filename: "albert.jpg", content_type: "image/jpg")
user_7.save!
user_8 = User.new(email: "penaldo@myemail.com", password: "123123", name: "Penaldo", location: "Madeira, Portugal")
file = URI.open("https://qatarmoments.awicdn.com/site-images/sites/default/files/qatarmoments-prod/article/e/9/528991/cef1a5abbd8b012d50c6ab19df416b95bc750c02-111222135406.png?preset=v3.0_DYNxDYN&rnd=12344&save-png=1")
user_8.photo.attach(io: file, filename: "penaldo.jpg", content_type: "image/jpg")
user_8.save!

tag_1 = Tag.new(name: "Sports")
tag_1.save!
tag_2 = Tag.new(name: "Video games & e-sports")
tag_2.save!
tag_3 = Tag.new(name: "Challenges")
tag_3.save!
tag_4 = Tag.new(name: "Fact-check")
tag_4.save!
tag_5 = Tag.new(name: "Cards & board games")
tag_5.save!
tag_6 = Tag.new(name: "Other ;)")
tag_6.save!

puts "Creating bets..."
bet_1 = Bet.new(name: "Ping pong", location: "Sintra, Portugal", stake: "€10", end_time: "2023-11-10", status: 1, tag: tag_1, privacy: "public", user: user_3, opponent: user_7)
bet_1.save!

bet_2 = Bet.new(name: "Fifa - best of 7", location: "Paris, France", stake: "€50", end_time: "2023-06-20", status: 1, tag: tag_2, privacy: "public", user: user_1, opponent: user_4)
bet_2.save!

bet_3 = Bet.new(name: "Trump in jail", location: "Guantanamo Bay, Cuba", stake: "€35", end_time: "2024-11-05", status: 1, tag: tag_4, privacy: "public", user: user_2, opponent: user_3)
bet_3.save!

bet_4 = Bet.new(name: "Drink 2L sangria", location: "Madrid, Spain", stake: "€5000", end_time: "2023-12-31", status: 1, tag: tag_3, privacy: "public", user: user_4, opponent: user_7)
bet_4.save!

bet_5 = Bet.new(name: "Man City treble", location: "Manchester, England", stake: "Lunch at Honest Greens", end_time: "2023-06-10", status: 2, tag: tag_1, privacy: "public", user: user_6, opponent: user_1)
bet_5.save!

bet_6 = Bet.new(name: "Backgammon", location: "Faro, Portugal", stake: "Beach Cocktails", end_time: "2023-06-30", status: 0, tag: tag_5, privacy: "public", user: user_1, opponent: user_8)
bet_6.save!

bet_7 = Bet.new(name: "Denver NBA champ", location: "Denver, USA", stake: "$20", end_time: "2023-06-13", status: 2, tag: tag_1, privacy: "public", user: user_2, opponent: user_1)
bet_7.save!

bet_8 = Bet.new(name: "Sing Umbrella", location: "Porto, Portugal", stake: "Spa day", end_time: "2023-12-31", status: 0, tag: tag_6, privacy: "public", user: user_1, opponent: user_5)
bet_8.save!

bet_9 = Bet.new(name: "Build an app", location: "Costa da Caparica, Portugal", stake: "Our future", end_time: "2023-06-16", status: 1, tag: tag_3, privacy: "public", user: user_1, opponent: user_7)
bet_9.save!
