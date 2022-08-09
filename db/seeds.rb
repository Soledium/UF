# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
Unit.delete_all
YEAR = '2022'
MONTHS = {
    "Ene": '01', 
    "Feb": '02',
}
CSV.foreach("#{Rails.root}/db/UF2022.csv", headers: true, col_sep: ';') do |row|
    hash = row.to_h
    day = hash[hash.keys.first]
    months = hash.keys[1..2]  #hace refencia a enero y febrero

    months.each do |m|
        months = MONTHS[m.to_sym]
        period = "#{YEAR}-#{months}-#{day}"
        value = hash[m]
        value.gsub!(".", "").gsub!("," ".") unless value.nil?  #le pide que cambie los signos a menos que el valor sea nulo.
        Unit.create(period: period, value: value)  #la línea necesaria para correr el seeds
    end
end