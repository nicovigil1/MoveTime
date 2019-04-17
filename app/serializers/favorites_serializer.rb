class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city_id, :walkers, :cyclists, :property_val, :population
end
