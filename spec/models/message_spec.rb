require 'spec_helper'

describe Message do
  let!(:message){ FactoryGirl.create(:message, created_at: 1.day.ago) }
                                  
  subject { message }
  
  it { should respond_to :url_title }
  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :comments }
  it { should be_valid }
  
  describe "with empty url title" do
    before { message.url_title = "" }
    it { should_not be_valid }
  end
  
  describe "with wrong url title" do
    before { message.url_title = "my url" }
    it { should_not be_valid }
  end    
  
  describe "with empty  title" do
    before { message.title = "" }
    it { should_not be_valid }
  end
  
  describe "with empty content" do
    before { message.content = "" }
    it { should_not be_valid }
  end
  
  describe "should be in right order" do
    before { @new_message = FactoryGirl.create(:message, created_at: 1.hour.ago) }
    Message.first.should == @new_message                
  end
  
  it "should have comments" do
    expect do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:comment, user: user, message: message)
    end.to change(message.comments, :count).by(1)                                           
  end

end
