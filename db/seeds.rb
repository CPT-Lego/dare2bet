# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

puts "Cleaning database..."
BetMember.destroy_all
Bet.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = User.new(email: "chris@fake.com", password: "123123", name: "Chris")
user_1.save!
user_2 = User.new(email: "dennis@fake.com", password: "123123", name: "Dennis")
user_2.save!
user_3 = User.new(email: "mateo@fake.com", password: "123123", name: "Mateo")
user_3.save!
user_4 = User.new(email: "david@fake.com", password: "123123", name: "David")
user_4.save!
user_5 = User.new(email: "riri@fake.com", password: "123123", name: "Rihanna")
user_5.save!

tag_1 = Tag.new(name: "sport")
tag_1.save!
tag_2 = Tag.new(name: "gaming")
tag_2.save!
tag_3 = Tag.new(name: "challenge")
tag_3.save!

puts "Creating bets..."
bet_1 = Bet.new(name: "Bet 1", location: "Paris", stake: "$45", end_time: "10-11-2023", status: "pending", outcome: "ongoing", tag: tag_1, privacy: "public")
bet_1.save!
BetMember.create!(bet: bet_1, user: user_1)
BetMember.create!(bet: bet_1, user: user_2)

bet_2 = Bet.new(name: "Bet 2", location: "Lisbon", stake: "$25", end_time: "10-12-2023", status: "pending", outcome: "ongoing", tag: tag_2, privacy: "public")
bet_2.save!
BetMember.create!(bet: bet_2, user: user_3)
BetMember.create!(bet: bet_2, user: user_4)

bet_3 = Bet.new(name: "Bet 3", location: "London", stake: "$35", end_time: "10-13-2023", status: "pending", outcome: "ongoing", tag: tag_3, privacy: "public")
bet_3.save!
BetMember.create!(bet: bet_3, user: user_4)
BetMember.create!(bet: bet_3, user: user_5)
