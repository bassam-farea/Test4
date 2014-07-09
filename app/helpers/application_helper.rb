module ApplicationHelper
  
   def full_title(page_title)
  base_title = "Demo"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
 end
 
 
 def name_longer_than_eight
    
    
    User.all.each do |user|
      
      if user.name == "Bassam"
        Users.push(user)
      end
      
    end
    
    Users
  end
 
end
