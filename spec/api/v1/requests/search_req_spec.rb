require "rails_helper"
# describe SearchController, :type => :controller do
describe "when a GET request is made to the /search endpoint", :vcr do
  it 'can respond with a cities walkability' do
    get "/api/v1/search?city=denver"
    
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to be_a(Hash)
    expect(JSON.parse(response.body)["data"]).to be_truthy 
  end 
end

