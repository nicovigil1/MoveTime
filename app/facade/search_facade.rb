class SearchFacade
  attr_reader :city_id, :walkers, :cyclists, :property_val, :population 

  def initialize(search_info = Hash.new(0))
    @city_id = search_info[:city_id]
    @walkers = search_info[:walkers]
    @cyclists = search_info[:cyclists]
    @property_val = search_info[:property_val]
    @population = search_info[:population]
  end

  def self.gen(city)
    city_data = CityDataService.new
    search_info = Hash.new
    search_info[:city_id] = city_data.find_city_id(city)
    search_info[:walkers] = city_data.find_city_walkers(city)
    search_info[:cyclists] = city_data.find_city_cyclists(city)
    search_info[:property_val] = city_data.median_property_value(city)
    search_info[:population] = city_data.population(city)
    SearchFacade.new(search_info)
  end 

end 