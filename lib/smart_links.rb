module SmartLinks
  LINK_ = /(?!<a href=")(https?:\/\/)([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?($| )(?!(jpeg|jpg|gif|png))/i
  IMAGE_REGEXP = /https?.*(jpeg|jpg|gif|png)/i
  def self.included(base)
    base.before_save :add_tags
  end
  
  def add_tags
    content.gsub!(IMAGE_REGEXP){ |image| image.replace("<img src=\"#{image}\">")}
#    content.gsub!(LINK_REGEXP){ |link| link.replace("<a href=\"#{link}\">#{link}</a>")}
  end  
end
