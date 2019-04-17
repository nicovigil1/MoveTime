require "rails_helper"

describe "CRUD favorites endpoints" do
  it 'can see all favorites' do
    params = {
      username: "nico",
      password: "please"
    }
    user = User.create(params)
    fav1 = user.favorites.create(city_id: "id123", walkers:1, cyclists: 2, property_val:3, population: 4)
    fav2 = user.favorites.create(city_id: "id1223", walkers:1, cyclists: 2, property_val:3, population: 4)
    
    get "/api/v1/favorites?id=#{user.id}"
    
    res = JSON.parse(response.body)
    expect(res["data"].length).to eq(2)
  end 

  it 'can create a favorite' do
    user = User.create({
      username: "nico",
      password: "please"
    })

    params = {user_id: user.id,
              city_id: "id123",
              walkers:1,
              cyclists: 2,
              property_val:3,
              population: 4}

    post api_v1_favorites_path(params)
    
    res = JSON.parse(response.body)

    expect(res["user_id"]).to eq(user.id.to_s)
  end 

  it 'can delete a favorite' do
    params = {
      username: "nico",
      password: "please"
    }
    user = User.create(params)
    fav1 = user.favorites.create(city_id: "id123", walkers:1, cyclists: 2, property_val:3, population: 4)
              
    delete api_v1_favorites_path({city_id: "id123", user_id: user.id})
    
    expect(Favorite.all.length).to eq(0)
  end 
end
