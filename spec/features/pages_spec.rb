require 'spec_helper'
include ApplicationHelper

describe "Pages" do
  subject { page }
  
  describe "should have correct titles" do 
    
    describe "Description page" do
      before { visit description_path}
      
      it { should have_title full_title("Описание") }
    end
  
    describe "Rules page" do
      before { visit rules_path}
      
      it { should have_title full_title("Правила") }
    end
    
    describe "Map page" do
      before { visit map_path}
      
      it { should have_title full_title("Карта") }
    end
    
    describe "Policy page" do
      before { visit policy_path}
      
      it { should have_title full_title("Политика и этика") }
    end
    
    describe "Technologies page" do
      before { visit technologies_path}
      
      it { should have_title full_title("Технологии") }
    end
    
    describe "Planets page" do
      before { visit planets_path}
      
      it { should have_title full_title("Планеты и сооружения") }
    end
    
    describe "Spaceships page" do
      before { visit spaceships_path}
      
      it { should have_title full_title("Корабли и снаряжение") }
    end
    
    describe "Downloads page" do
      before { visit downloads_path}
      
      it { should have_title full_title("Скачивание материалов") }
    end
    
    describe "Feedback page" do
      before { visit feedback_path}
      
      it { should have_title full_title("Отзывы") }
    end
    
    describe "Contacts page" do
      before { visit contacts_path}
      
      it { should have_title full_title("Контакты") }
    end
  end
  
  describe "should have correct links" do
    before  { visit root_path }
        
    it "Description page" do
      page.find(:css, ".desc").click
      current_path.should == description_path    
    end
    
    it "News page" do
      page.find(:css, ".news").click
      current_path.should == root_path    
    end
    
    it "Rules page" do
      page.find(:css, ".rules").click
      current_path.should == rules_path    
    end
    
    it "Map page" do
      page.find(:css, ".map").click
      current_path.should == map_path    
    end
    
    it "Policy page" do
      page.find(:css, ".policy").click
      current_path.should == policy_path    
    end
    
    it "Technologies page" do
      page.find(:css, ".tech").click
      current_path.should == technologies_path    
    end
    
    it "Planets page" do
      page.find(:css, ".planets").click
      current_path.should == planets_path    
    end
    
    it "Spaceships page" do
      page.find(:css, ".ships").click
      current_path.should == spaceships_path    
    end
    
    it "Downloads page" do
      page.find(:css, ".files").click
      current_path.should == downloads_path    
    end
    
    it "Feedback page" do
      page.find(:css, ".fb").click
      current_path.should == feedback_path    
    end
    
    it "Contacts page" do
      click_link "Контакты"
      current_path.should == contacts_path    
    end
  end
end
