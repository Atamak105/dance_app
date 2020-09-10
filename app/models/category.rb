class Category < ActiveHash::Base

  self.data = [
    {id: 1, name: "---"},
    {id: 2, name: "music"},
    {id: 3, name: "movie"},
    {id: 4, name: "event"},
    {id: 5, name: "skill"},
    {id: 6, name: "business"},
    {id: 7, name: "community"},
    {id: 8, name: "other"},
  ]

  include ActiveHash::Associations
  has_many :topics
  
end
