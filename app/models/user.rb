class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  
  #before_validation do
   # if self.name.blank?
    #  self.name = "RandName"
    #end
  #end
  
  
  validates :name, presence: true, length: {maximum: 40}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email , presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 8}
  
  def self.name_longer_than_eight
    
    x = User.all;
    y = []
    
    (0..x.length-1).each do |i|
      if x[i].name.length > 8
        y.push(x[i])
      end
    end
    
    return y
  end
  
  
end
