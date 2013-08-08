require 'spec_helper'
include ApplicationHelper

describe "News page" do
  before(:all) do
    TOTAL_LENGTH = 600
    VISIBLE_LENGTH = 500
  end 
    
  let!(:message) { Message.create( url_title: "my-url", 
                  title: "My title", content: 'a' * TOTAL_LENGTH ) }
  
  subject { page } 
  
  describe "index page" do
    before { visit root_path }  
    
    it { should have_title full_title("Новости") }
    it { should have_content("My title") }
   
    describe "with big text" do
      it { should have_content('a' * VISIBLE_LENGTH) }
      it { should_not have_content(message.content) }   
    end
  
    describe "with little text" do
      before do
        message.update content: 'b' * VISIBLE_LENGTH 
        visit root_path
      end
      it { should have_content(message.content) }
      it { should_not have_content("...") }   
    end
    
    it "should have link to full page" do
      click_link "Подробнее"
      current_path.should == message_path(message)    
    end
  end
  
  describe "full page" do
    before { visit message_path(message) }
    
    it { current_path.should == "/messages/#{message.url_title}" }    
    it { should have_title full_title(message.title) }
    it { should have_content(message.content) }    
  end
end
