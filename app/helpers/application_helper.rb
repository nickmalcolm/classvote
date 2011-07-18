module ApplicationHelper
  
  def valid_tags
    %w(a p strong em b ul ol li)
  end
  
  def super_sanitize(dirty)
    sanitize(dirty, :tags => valid_tags, :attributes=>"href")
  end
  
end
