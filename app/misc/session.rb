class Session
  extend ActiveModel::Naming
  attr_accessor :student_id_number
  
  def to_key
    nil
  end
  
end