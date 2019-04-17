class SearchSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :walkers, :cyclists, :property_val, :population
end
