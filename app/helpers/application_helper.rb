module ApplicationHelper
  
  def current_vote_count
    Vote.where("student_id_number = ?", @current_student).count
  end
  
  def votes_left
    3 - current_vote_count
  end
  
  def valid_tags
    %w(a p strong em b ul ol li)
  end
  
  def super_sanitize(dirty)
    sanitize(dirty, :tags => valid_tags, :attributes=>"href")
  end
  
end
