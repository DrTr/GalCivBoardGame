require 'spec_helper'

describe Comment do
  let!(:comment){ FactoryGirl.create(:comment, user_id: 1, 
                                      message_id: 1, created_at: 1.day.ago) }
                                  
  subject { comment }
  
  it { should respond_to :user }
  it { should respond_to :content }
  it { should respond_to :message }
  it { should be_valid }
  
  describe "with empty author" do
    before { comment.user = nil }
    it { should_not be_valid }
  end
  
    
  describe "with empty message" do
    before { comment.message = nil }
    it { should_not be_valid }
  end
   
  describe "with empty content" do
    before { comment.content = "" }
    it { should_not be_valid }
  end
    
  describe "with too long content" do
    before { comment.content = "a" * 300 }
    it { should_not be_valid }
  end  
  
  describe "should be in right order" do
    before { @new_comment = FactoryGirl.create(:comment, user_id: 1, 
                                       message_id: 1, created_at: 1.hour.ago) }
    Message.first.should == @new_comment                
  end

end