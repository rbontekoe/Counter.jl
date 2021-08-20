module Domain #1

using Dates #2

export Item

struct Item #7
  created::DateTime
  name::String
  nbr::Int64
  #constructors
  Item(name, nbr) = new(now(), name, nbr)
end # Item

end