class Vote < ActiveRecord::Base
  
  validates_presence_of :student_id_number
  
  validate :three_vote_limit
  
  private
  def three_vote_limit
    count = Vote.where("student_id_number = ?", self.student_id_number).count
    
    if count >= 3
      self.errors.add :student_id_number, " has already voted 3 times"
    end
  end 
  
end
