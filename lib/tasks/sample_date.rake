namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
   Place.new(name: "Fabryka rzutek",
              city: "Krakow",
              address: "Miodowa 23")
  
   @league1 = League.new(name: "Pierwsza swiatowa liga")
   @league1.place = Place.first
   @league1.save
    
=begin
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
=end
  end
end