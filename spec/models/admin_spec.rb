require 'spec_helper'

describe Admin do
  let!(:admin){ Admin.new email: "test@e.mail", password: "password",
                          password_confirmation: "password" }
  subject{ admin }
  
  it { should respond_to :email }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }    
  it { should be_valid }       
  
  describe "remember token should not be blank" do
    before { admin.save }
    its(:remember_token){ should_not be_blank }
  end
  
  describe "when email is not present" do
    before { admin.email = "" }
    it { should_not be_valid }
  end
  
  describe "when email is not valid" do
    before { admin.email = "wrong.email.com" }
    it { should_not be_valid }
  end                   
  
  describe "when password is not present" do
    before { admin.password = admin.password_confirmation = "" }
    it { should_not be_valid }
  end
  
  describe "when password is too short" do
    before do
      admin.password = "short" 
      admin.password_confirmation = "short" 
    end
    it { should_not be_valid }
  end
  
  describe "when password confirmation is not present" do
    before { admin.password_confirmation = "" }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { admin.password_confirmation = "wrong!" }
    it { should_not be_valid }
  end
  
  describe "password digest should not be blank" do
    before { admin.save }
    its(:password_digest){ should_not be_blank }
  end
  
end
