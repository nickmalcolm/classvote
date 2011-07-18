class Vote < ActiveRecord::Base
  
  belongs_to :choice, :counter_cache => true
  
  validates_presence_of :student_id_number
  validates_presence_of :choice_id
  
  validate :three_vote_limit
  
  #Turns 1234567890 into "xxxxxxx890"
  def mask
    sid = student_id_number.to_s
    
    len = sid.length - 3
    exes = ""
    len.times {exes << "x"}
      
    sid.gsub /\A.{#{len}}/, exes
  end
  
  private
  def three_vote_limit
    count = Vote.where("student_id_number = ?", self.student_id_number).count
    
    if count >= 3
      self.errors.add :student_id_number, " has already voted 3 times"
    end
  end 
  
end
