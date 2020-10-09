# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

years = (2000..2019).to_a.map(&:to_s)
months = (1..12).to_a.map(&:to_s)
days = (1..28).to_a.map(&:to_s)
colors = %w(black white orange)
sex = %w(M F)
description = ('A'..'z').to_a
names = description

100.times do 
    birth_date = (years.sample + '/' + months.sample + '/' + days.sample)
    Cat.create!({birth_date: birth_date, color: colors.sample, name: names.sample, sex: sex.sample, description: description.sample})
end