class BlogsController < ApplicationController
  def home
  end

  def about
    
  end
  
  def contact
    
  end
  
  def send_email
   
   redirect_to root_url :notice => "Email sent with subject #{params['subject']} and body #{params['body']}}"
  end
end
