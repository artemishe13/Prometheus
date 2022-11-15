#Pete, the baker
#https://www.codewars.com/kata/525c65e51bf619685c000059/solutions/ruby
#Pete likes to bake some cakes. He has some recipes and ingredients. 
#Unfortunately he is not good in maths. Can you help him to find out, 
#how many cakes he could bake considering his recipes?

#Write a function cakes(), which takes the recipe (object) 
#and the available ingredients (also an object) and returns 
#the maximum number of cakes Pete can bake (integer). For simplicity 
#there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). 
#Ingredients that are not present in the objects, can be considered as 0.

def cakes(recipe, available)
    arrRecipe,arrAvailable,arrMin =[],[],[]
   #recept.each_pair {|key, value| arrRecept.push(key, value)}
    recipe.each_pair {|key, value| arrRecipe.push(key, value)}
    #Возвращает новый массив, состоящий из ключей данного хеша.
    #arrReceptKey << recept.keys
    available.each_pair {|key, value| arrAvailable.push(key, value)}

    arrRecipe.length.times {|i|
    if i%2==0 && available.has_key?(arrRecipe[i])
        arrMin << (available[arrAvailable[i]])/(recipe[arrAvailable[i]])
    elsif i%2==0
        return 0
    end
}
arrMin.min
end


puts cakes({flour: 500, sugar: 200, eggs: 1, milk: 200}, {flour: 1200, susgar: 1200, eggss: 5,mislk: 200})

#good and very hard
#recipe.collect { | k, v | available[k].to_i / v }.min

#goood
#recipe.keys.map { |i| (available[i] || 0) / recipe[i] }.min