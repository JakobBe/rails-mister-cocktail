puts "seeding starts"

Cocktail.destroy_all

5.times do
  drink = Cocktail.new(name: Faker::Beer.name)

  if drink.save
    puts "#{drink.name} saved"
  end
end

puts "seedind finished"
