require 'spec_helper'

describe User do
  before do
    @user = User.new(name:"Bassam",email:"bassam.farea@gmail.com",password:"helloworld",password_confirmation:"helloworld")
  end
  subject {@user}
  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  
  it {should be_valid}
  
  describe "when name is not present" do
    before {@user.name = ""}
    it {should_not be_valid}
  end
  
  describe "when name is too long" do
    before {@user.name = "a" * 41}
    it {should_not be_valid}
  end
  
  describe "when email is not present" do
    before {@user.email = " "}
    it {should_not be_valid}
  end
  
  describe "when email format is invalid" do
   it "should be invalid" do
    addr = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
    addr.each do |invalid_addr|
      @user.email = invalid_addr
      expect(@user).not_to be_valid
    end
   end
  end
  
  describe "when email format is valid" do 
    it "should be valid" do
      addr = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addr.each do |valid_addr|
        @user.email = valid_addr
        expect(@user).to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do 
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it {should_not be_valid}
  end
  
  describe "email address with mixed case" do
    let(:mixed_case_email) {"BassAm@ExAMPle.CoM"}
    it "should be saved as all lower case" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq  mixed_case_email.downcase
    end
  end
  describe "when password is not present" do
    before do 
      @user = User.new(name:"Bassam Fare'a", email:"bassam.farea@gmail.com",password:" ",password_confirmation:" ")
    end
    it {should_not be_valid}
  end
  
  describe "when password doesn't match confirmation" do
    before {@user.password_confirmation = "mismatch"}
    it {should_not be_valid}
  end
  
  describe "with a password that is too short < 8 chars" do
    before {@user.password = @user.password_confirmation = "a" * 7}
    it {should_not be_valid}
  end
  
end
