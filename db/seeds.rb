puts "seeding starts"

Cocktail.destroy_all

5.times do
  drink = Cocktail.new(name: Faker::Beer.name)

  if drink.save
    puts "#{drink.name} saved"
  end
end

ingredients = ["basil", "lemon", "mint", "soda", "gingerale", "tonic"]

ingredients.each do |ingredient|
  ing = Ingredient.new(name:ingredient)

  if ing.save
    puts "#{ing.name} saved"
  end
end

puts "seedind finished"
