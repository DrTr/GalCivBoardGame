require 'spec_helper'
include ApplicationHelper 

describe "News page" do
  before(:all) do
    TOTAL_LENGTH = 600
    VISIBLE_LENGTH = 500
  end 
    
  let!(:message) { FactoryGirl.create(:message, content: 'a' * TOTAL_LENGTH ) }
  let!(:user) { FactoryGirl.create(:user) }
  
  subject { page } 
  
  describe "index page" do
    before { visit root_path } 
    
    it { should have_title full_title("Новости") }
    it { should have_content( message.title ) }
   
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
    
    it "should have linked title" do
      click_link message.title
      current_path.should == message_path(message)    
    end
  end
  
  describe "full page" do
    let!(:comment){ FactoryGirl.create(:comment, user: user, message: message) } 
    before { visit message_path(message) }
    
    it { current_path.should == "/messages/#{message.url_title}" }    
    it { should have_title full_title(message.title) }
    it { should have_content(message.content) }
    
    describe "should have comment" do
      it { should have_content(comment.user.name) }
      it { should have_content(comment.content) }    
    end
   
    describe "non-authorized user" do
      it { should have_content "Войдите что бы оставлять комментарии" }
      it { should_not have_content "Текст комментария" }
    end
    
    describe "authorized user" do
      before do
        page.set_rack_session(user_id:  user.id)
        visit message_path(message)
      end         
      it { should_not have_content "Войдите что бы оставлять комментарии" }
      it { should have_content "Текст комментария" }
      it "can create comment" do
        expect do
          fill_in "Текст комментария", with: "Cooooment"
          click_button "Отправить"
        end.to change(user.comments, :count).by(1)
      end
    end
  end
end
