# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

puts "Cleaning database..."
Bet.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = User.new(email: "chris@fake.com", password: "123123")
user_1.save!
user_2 = User.new(email: "dennis@fake.com", password: "123123")
user_2.save!

tag_1 = Tag.new(name: "sport")
tag_1.save!
tag_2 = Tag.new(name: "gaming")
tag_2.save!
tag_3 = Tag.new(name: "challenges")
tag_3.save!

puts "Creating bets..."
bet_1 = Bet.new(name: "Bet 1", location: "Paris", stake: "$45", end_time: "10-11-2023", status: "pending", outcome: "ongoing", tag: tag_1)
bet_1.save!
bet_2 = Bet.new(name: "Bet 2", location: "Lisbon", stake: "$25", end_time: "10-12-2023", status: "pending", outcome: "ongoing", tag: tag_2)
bet_2.save!
bet_3 = Bet.new(name: "Bet 3", location: "London", stake: "$35", end_time: "10-13-2023", status: "pending", outcome: "ongoing", tag: tag_3)
bet_3.save!
