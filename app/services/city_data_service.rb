class CityDataService
  # FIXME - Initialize with a city location
  def conn
    @conn ||= Faraday.new(url: "https://api.datausa.io") do |c|
      c.request :url_encoded
      c.response :json, :parser_options => { :symbolize_names => true }
      c.adapter Faraday.default_adapter
    end 
  end
  
  def find_city_id(city)
    res = conn.get("/attrs/search/?kind=geo&q=#{city}")
    res.body[:data][0][0]
  end 

  def find_city_walkers(city)
    res = conn.get("/api/?geo=#{find_city_id(city)}&show=geo&sumlevel=place&year=latest&force=acs.yg_transport")
    num_walkers = res.body[:data][0][40]
  end

  def find_city_cyclists(city)
    res = conn.get("/api/?geo=#{find_city_id(city)}&show=geo&sumlevel=place&year=latest&force=acs.yg_transport")

    num_cyclists = res.body[:data][0][2]
  end 

  def median_property_value(city)
    res = conn.get("/api/?geo=#{find_city_id(city)}&show=geo&sumlevel=place&year=latest&force=acs.yg")
    res.body[:data][0][11]
  end 

  def population(city)
    res = conn.get("/api/?geo=#{find_city_id(city)}&show=geo&sumlevel=place&year=latest&force=acs.yg")
    res.body[:data][0][4]
  end 

end