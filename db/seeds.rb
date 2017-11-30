require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
cocktails = ["Gin","Mojito","Happy","Whiskey","Spritz","Vodka","Strawberry","SuperGin"]

puts "seeding starts"


Cocktail.destroy_all
Ingredient.destroy_all


cocktails.each do |cocktail|
  drink = Cocktail.new(name: cocktail)

  if drink.save
    puts "#{drink.name} saved"
  end
end
# 5.times do
#   drink = Cocktail.new(name: Faker::BossaNova.song)

#   if drink.save
#     puts "#{drink.name} saved"
#   end
# end

ingredients["drinks"].each do |ingredient|
  ing = Ingredient.new(name: ingredient["strIngredient1"])

  if ing.save
    puts "#{ing.name} saved"
  end
end

puts "seeding finished"
