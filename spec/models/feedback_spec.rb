require 'spec_helper'

describe Feedback do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:feedback){ FactoryGirl.create(:feedback, user: user) }
  subject { feedback }
  it{ should respond_to :email }
  it{ should respond_to :content }
  it{ should respond_to :mark }
  it{ should respond_to :user }
  it{ should be_valid }

  describe "without user" do
    before { feedback.user = nil }
    it { should_not be_valid }
  end
  
  describe "without email" do
    before { feedback.email = "" }
    it { should be_valid }
  end
  
  describe "with incorrect" do
    before { feedback.email = "mail.ru" }
    it { should_not be_valid }
  end
  
  describe "without mark" do
    before { feedback.mark = nil }
    it { should be_valid }
  end
  
  describe "without content" do
    before { feedback.content = "" }
    it { should_not be_valid }
  end
  
  describe "with too long content" do
    before { feedback.content = "a" * 300 }
    it { should_not be_valid }
  end
  
end
