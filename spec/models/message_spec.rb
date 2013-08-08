require 'spec_helper'

describe Message do
  before { @message = Message.new url_title: "my-url", title: "My title",
                                  content: "My text", created_at: 1.day.ago }
                                  
  subject { @message }
  
  it { should respond_to :url_title }
  it { should respond_to :title }
  it { should respond_to :content }
  it { should be_valid }
  
  describe "with empty url title" do
    before { @message.url_title = "" }
    it { should_not be_valid }
  end
  
  describe "with wrong url title" do
    before { @message.url_title = "my url" }
    it { should_not be_valid }
  end    
  
  describe "with empty  title" do
    before { @message.title = "" }
    it { should_not be_valid }
  end
  
  describe "with empty content" do
    before { @message.content = "" }
    it { should_not be_valid }
  end
  
  describe "should be in right order" do
    before do
      @new_message = Message.create url_title: "new-url", title: "New title",
                                    content: "New text", created_at: 1.hour.ago
      @message.save
    end
    
    Message.first.should == @new_message                
  end

end
