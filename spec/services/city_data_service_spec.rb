require 'rails_helper'

RSpec.describe "City Data Service" do
  it "can connect to city data api", :vcr do 
    city_data = CityDataService.new
    res = city_data.find_city_id("denver")

    expect(res).to eq("16000US0820000")
  end 

  it "can return a cities id", :vcr do 
    city_data = CityDataService.new
    res = city_data.find_city_id("denver")

    expect(res).to eq("16000US0820000")
  end 

  it "can return a cities walkability", :vcr do 
    city_data = CityDataService.new
    res = city_data.find_city_walkers("denver")

    expect(res).to eq(16856.0)
  end 

  it "can return a cities bike friendlyness", :vcr do 
    city_data = CityDataService.new
    res = city_data.find_city_cyclists("denver")

    expect(res).to eq(8181.0)
  end 

  it "can return a city's median property value", :vcr do 
    city_data = CityDataService.new
    res = city_data.median_property_value("denver")

    expect(res).to eq(360900.0)
  end 

  it "can return a city's population", :vcr do 
    city_data = CityDataService.new
    res = city_data.population("denver")
    
    expect(res).to eq(693060)
  end 
end 