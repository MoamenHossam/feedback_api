# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do


  Company.create({
    name:Faker::Company.name,
    token: Faker::Company.french_siren_number
    })
    
    Feedback.create({
      company_token: "448765578",
      priority: 1
      })

      State.create({
        device: Faker::Pokemon.move,
        os: Faker::Pokemon.name,
        storage: Faker::Number.number(6),
        memory: Faker::Number.number(4)
        })

        Feedback.create({
          company_token: "226227981",
          priority: 2
          })
  end
