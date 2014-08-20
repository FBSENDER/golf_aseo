module ApplicationHelper
  def isactiveclass(name)
    output = ""
    output = "class = active" if controller_name == name 
    output
  end
  def title(page_title = "")
    content_for :title, page_title
  end
  def keywords(page_keywords = "")
    content_for :keywords, page_keywords
  end
  def head_desc(page_head_desc)
    content_for :head_desc, page_head_desc
  end 
end
