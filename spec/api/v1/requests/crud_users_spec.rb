require 'rails_helper'

describe "crud users endpoint" do
  it 'can create a user' do 
    params = {
      username: "nico",
      password: "please"
    }
    post api_v1_users_path(params)

    res = JSON.parse(response.body)
     
    expect(res["success"]).to eq("user successfully created / logged in")
    expect(User.all.length).to eq 1
  end

  it 'can create a user' do 
    params = {
      username: "nico",
      password: "please"
    }
    User.create(params)
    post api_v1_users_path(params)
    
    res = JSON.parse(response.body)
     
    expect(res["success"]).to eq("user successfully created / logged in")
    expect(User.all.length).to eq 1
  end
end