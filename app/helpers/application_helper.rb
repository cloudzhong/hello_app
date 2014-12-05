module ApplicationHelper
  
   # according to the page , return the corresponding title.
  def full_title(page_title = '')
    base_title = "Cloud is doing this sample"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
end
