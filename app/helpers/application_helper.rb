module ApplicationHelper
  BGCOUNT = 5
  
  def full_title(page_title)
    title = "Галактическая Федерация. Настольная игра"
    title + ( page_title.empty? ? "" : " | #{page_title}")
  end
  
  def random_bg
    "/assets/backgrounds/bg#{rand(5)}.jpg"
  end
end
