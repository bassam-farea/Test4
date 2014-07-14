class BlogsController < ApplicationController
  def home
    if signed_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page:10)
    end
  end

  def about
    
  end
  
  def contact
    
  end
  
  def send_email
   
   redirect_to root_url :notice => "Email sent with subject #{params['subject']} and body #{params['body']}}"
  end
end
