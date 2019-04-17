require 'rails_helper'

describe "search facade" do
  it 'can have attributes' do 
    search = SearchFacade.new

    expect(search.id).to eq(0)
    expect(search.walkers).to eq(0)
    expect(search.cyclists).to eq(0)
    expect(search.property_val).to eq(0)
    expect(search.population).to eq(0)
  end 

  it 'can generate itself with a series of api calls', :vcr do 
    search_gen = SearchFacade.gen("denver")
   
    expect(search_gen.id).to eq("16000US0820000")
    expect(search_gen.walkers).to eq(16856.0)
    expect(search_gen.cyclists).to eq(8181.0)
    expect(search_gen.property_val).to eq(360900.0)
    expect(search_gen.population).to eq(693060)
  end
end 