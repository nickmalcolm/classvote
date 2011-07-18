module ChoicesHelper
  
  def can_vote_on(choice)
    unless @current_student.nil?
      current_vote_count < 3
    end
  end
  
end
