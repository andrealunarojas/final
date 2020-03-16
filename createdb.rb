# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :restaurants do
  primary_key :id
  String :name
  String :description, text: true
  String :foundation
  String :location
end
DB.create_table! :reservations do
  primary_key :id
  foreign_key :restaurant_id
  Boolean :going
  String :name
  String :email
  String :Number_guests, text: true
end

DB.create_table! :users do
  primary_key :id
  String :name
  String :email
  String :password
end

# Insert initial (seed) data
restaurants_table = DB.from(:restaurants)

restaurants_table.insert(name: "Maido", 
                    description: "Nikkei gastronomy combined with peruvian flavors",
                    foundation: "2017",
                    location: " 399 San Martin Street, Miraflores")

events_table.insert(title: "Central", 
                    description: "Virgilio Martinez's restaurant. 6th place in the top 50 restaurants around the world.",
                    date: "2016",
                    location: "301 Pedro de Osma Street, Barranco")

events_table.insert(title: "La Mar", 
                    description: "The most famous ceviche in Peru. A very dynamic menu, that changes throughout the year.",
                    date: "2017",
                    location: "770 Mariscal La Mar Miraflores")

events_table.insert(title: "Panchita", 
                    description: "Traditional peruvian food, the most traditional and legendary peruvian dishes.",
                    date: "2015",
                    location: "298 Dos de Mayo Street, Miraflores")

events_table.insert(title: "Isolina", 
                    description: "The best tabern in Peru, a relaxed place in which you could taste the best dishes and drinks from Peru",
                    date: "2017",
                    location: "101 San Martin Street, Barranco")
