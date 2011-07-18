class Choice < ActiveRecord::Base
  
  has_many :votes
  
  validates_presence_of :title, :allow_blank => false
  
  attr_accessible :title, :description, :url, :votes_count
  
end
