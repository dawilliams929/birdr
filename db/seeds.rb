# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Species.delete_all

table = CSV.table("db/NACC_list_species.csv")
table.each do |row|
  Species.create({
    common_name: row[:common_name],
    scientific_name: row[:species],
    family: row[:family]
  })
end