module Domain

using Dates

export Item

struct Item
  created::DateTime
  name::String
  nbr::Int64
  #constructors
  Item(name, nbr) = new(now(), name, nbr)
end # Item

end