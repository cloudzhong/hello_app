module ApplicationHelper
  
   # according to the page , return the corresponding title.
  def full_title(page_title = '')
    base_title = "Cloud Personal Posts"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
end
