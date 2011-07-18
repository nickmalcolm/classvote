module ChoicesHelper
  
  def can_vote_on(choice)
    unless @current_student.nil?
      Vote.where("student_id_number = ?", @current_student).count < 3
    end
  end
  
end
