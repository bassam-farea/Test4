require 'spec_helper'

describe "Blog pages" do
  
  subject { page }

  describe "Home page" do
    before { visit root_path }

    
    it { should have_title(full_title('')) }
    it { should have_selector('h1', text: 'Hello, world!') }
    
  end
  
  describe "About page" do
    before { visit about_path }

    
    it { should have_title(full_title('About Us')) }
    it { should have_selector('h1', text: 'About Us') }
    
  end
  
  
end