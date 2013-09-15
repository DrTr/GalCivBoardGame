require 'spec_helper'

describe User do
  let!(:user){ FactoryGirl.create(:user) } 
  subject { user }
  it { should respond_to :name }
  it { should respond_to :link }
  it { should respond_to :image_link }
  it { should respond_to :provider }
  it { should respond_to :uid }
  it { should respond_to :comments }
  it { should respond_to :feedbacks }
  it { should respond_to :access }
  its(:access){ should_not be_blank }
  its(:access){ should == "user"}
  it { should be_valid }
  
  
  describe "with empty name" do
    before { user.name = "" }
    it { should_not be_valid }
  end
  
  describe "with empty uid" do
    before { user.uid = "" }
    it { should_not be_valid }
  end
  
  describe "with empty provider" do
    before { user.provider = "" }
    it { should_not be_valid }
  end
  
  describe "with provider not from list" do
    before { user.provider = "yandex" }
    it { should_not be_valid }
  end
  
  describe "with empty link" do
    before { user.link = "" }
    it { should be_valid }
  end
  
  describe "with incorrect link" do
    before { user.link = "i am awesome" }
    it { should_not be_valid }
  end
  
  describe "with empty image_link" do
    before { user.image_link = "" }
    it { should be_valid }
  end
  
  describe "with incorrect image_link" do
    before { user.image_link = "photo.png" }
    it { should_not be_valid }
  end

  describe "can create comments" do
    before { @message = FactoryGirl.create(:message) }
    it "should increment comments count" do
      expect do
        FactoryGirl.create(:comment, message: @message, user: user)  
      end.to change(user.comments, :count).by(1)
    end
  end
  
  describe "can create feedbacks" do
    it "should increment feedbacks count" do
      expect do
        FactoryGirl.create(:feedback, user: user)
      end.to change(user.feedbacks, :count).by(1)
    end
  end
end
