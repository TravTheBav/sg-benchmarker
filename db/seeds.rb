# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed user
User.destroy_all

user = User.create!(
    {
        username: "Foob",
        email: "foobar123@example.com",
        password: "123456",
        password_confirmation: "123456"
    }
)

p "Created #{ User.count } user"

# Seed build orders through user
user.build_orders.build([
    { name: "3-rax", faction: "Resistance", notes: "Lorem ipsum" },
    { name: "4-gate", faction: "Infernals", notes: "Hello there" },
    { name: "2 vulcan evac drop", faction: "Resistance", notes: "Early harass and pressure on chicken camp"}
])
user.build_orders.each { |bo| bo.save }

p "Created #{ BuildOrder.count } build orders"

# Seed benchmarks through user
build_orders = ["3-rax", "4-gate", "2 vulcan evac drop"]
maps = ["Glittering Ash", "Neon Violet", "Steppes of War", "Blackbird"]
match_outcomes = ["Win", "Loss", "Tie"]

40.times do |i|
    user.attack_benchmarks.build(
        { build_order: build_orders.sample,
          map: maps.sample,
          match_outcome: match_outcomes.sample,
          time: DateTime.new(2000, 1, 1, 0, (4..7).to_a.sample, (0..59).to_a.sample, "+00:00"),
          created_at: DateTime.new(2023, (1..12).to_a.sample, (1..30).to_a.sample)
        }
    )
end
user.attack_benchmarks.each { |ab| ab.save }

p "Created #{ AttackBenchmark.count } benchmarks"