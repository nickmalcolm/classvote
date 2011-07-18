class Choice < ActiveRecord::Base
  
  has_many :votes
  
  validates_presence_of :title, :allow_blank => false
  
end
