module SmartLinks
  LINK_REGEXP = /(\A|\s)(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?(\s|\z)/i
  IMAGE_REGEXP = /(\A|\s)https?.*\/[\da-z%-]+\.(jpeg|jpg|gif|png)(\s|\z)/i
  def self.included(base)
    base.before_save :add_tags
  end
  
  def add_tags
    content.gsub!(IMAGE_REGEXP){ |image| image.replace("<img src=\"#{image}\">")}
    content.gsub!(LINK_REGEXP){ |link| link.replace("<a href=\"#{link}\">#{link}</a>")}
  end  
end
