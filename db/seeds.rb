# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

puts "Cleaning database..."
Bet.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = User.new(email: "chris@fake.com", password: "123123", name: "Chris", location: "Athens, Greece")
user_1.save!
user_2 = User.new(email: "dennis@fake.com", password: "123123", name: "Dennis", location: "Denver, Colorado, USA")
user_2.save!
user_3 = User.new(email: "mateo@fake.com", password: "123123", name: "Mateo", location: "Paris, France")
user_3.save!
user_4 = User.new(email: "david@fake.com", password: "123123", name: "David", location: "Lisbon, Portugal")
user_4.save!
user_5 = User.new(email: "riri@fake.com", password: "123123", name: "Rihanna", location: "Bridgetown, Barbados")
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
