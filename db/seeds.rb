# europe = Continent.create(name: "Europe")
# spain = Country.create(name: "Spain", continent_id: europe.id)
# barcelona = City.create(name: "Barcelona", country_id: spain.id)
# australia = Continent.create(name: "Australia")
# australia_country = Country.create(name: "Australia", continent_id: australia.id)
# sydney = City.create(name: "Sydney", country_id: australia_country.id)
# north_a = Continent.create(name: "North America")
# united_states = Country.create(name: "United States", continent_id: north_a.id)
# chicago = City.create(name: "Chicago", country_id: united_states.id)
# south_a = Continent.create(name: "South America")
# argentina = Country.create(name: "Argentina", continent_id: south_a.id)
# buenos_aires = City.create(name: "Buenos Aires", country_id: south_a.id)
# africa = Continent.create(name: "Africa")
# egypt = Country.create(name: "Egypt", continent_id: africa.id)
# cairo = City.create(name: "Cairo", country_id: egypt.id)
# asia = Continent.create(name: "Asia")
# china = Country.create(name: "China", continent_id: asia.id)
# beijing = City.create(name: "Beijing", country_id: china.id)

10.times do
  @user = User.create(username: ShakespeareIpsum::Name.name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  3.times do
    @article = Article.create(title: ShakespeareIpsum.insult!, body: ShakespeareIpsum::Sonnets.sonnet, user_id: @user.id)
    2.times do
      @category = Category.create(name: Faker::Company.catch_phrase)
      @tag = Tag.create(category_id: @category.id, article_id: @article.id)
    end
  end
end

 city_hash_array = [{:city=>"Cupertino", :state=>"California"},
  {:city=>"Bethesda", :state=>"Maryland"},
  {:city=>"Greenwich", :state=>"Connecticut"},
  {:city=>"Mound", :state=>"Texas"},
  {:city=>"Burke", :state=>"Virginia"},
  {:city=>"Township", :state=>"Michigan"},
  {:city=>"Marin", :state=>"California"},
  {:city=>"Pleasanton", :state=>"California"},
  {:city=>"Alto", :state=>"California"},
  {:city=>"Linda", :state=>"California"},
  {:city=>"Naperville", :state=>"Illinois"},
  {:city=>"Ranch", :state=>"Colorado"},
  {:city=>"Newton", :state=>"Massachusetts"},
  {:city=>"Woodlands", :state=>"Texas"},
  {:city=>"Milpitas", :state=>"California"},
  {:city=>"Wayne", :state=>"New"},
  {:city=>"Fairfield", :state=>"Connecticut"},
  {:city=>"Beach", :state=>"California"},
  {:city=>"Cobb", :state=>"Georgia"},
  {:city=>"Huntington", :state=>"New"},
  {:city=>"Clarkstown", :state=>"New"},
  {:city=>"Verdes", :state=>"California"},
  {:city=>"Land", :state=>"Texas"},
  {:city=>"Plateau", :state=>"Washington"},
  {:city=>"Hempstead", :state=>"New"},
  {:city=>"Niguel", :state=>"California"},
  {:city=>"Smithtown", :state=>"New"},
  {:city=>"Greenburgh", :state=>"New"},
  {:city=>"Trabuco", :state=>"California"},
  {:city=>"Reston", :state=>"Virginia"}]


city_hash_array.each {|city_hash| City.create(name: city_hash[:city], province: city_hash[:state], country: "USA")}
City.all.each do |city|
  3.times do 
    Itinerary.create(city_id: city.id, article_id: rand(1..30))
  end
end
