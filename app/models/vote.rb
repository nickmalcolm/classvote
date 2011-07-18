class Vote < ActiveRecord::Base
  
  validates_presence_of :student_id_number
  
end
