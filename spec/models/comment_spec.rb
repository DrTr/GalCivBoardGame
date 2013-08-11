require 'spec_helper'

describe Comment do
  let!(:comment){ Comment.create author: "some user", message_id: 1,
                                 content: "some text", created_at: 1.day.ago }
                                  
  subject { comment }
  
  it { should respond_to :author }
  it { should respond_to :content }
  it { should respond_to :message_id }
  it { should be_valid }
  
  describe "with empty author" do
    before { comment.author = "" }
    it { should_not be_valid }
  end
   
  describe "with empty content" do
    before { comment.content = "" }
    it { should_not be_valid }
  end
  
  describe "should be in right order" do
    let(:new_comment){ Comment.create author: "new user",
                                      content: "new text", created_at: 1.hour.ago }
    Message.first.should == @new_comment                
  end

end