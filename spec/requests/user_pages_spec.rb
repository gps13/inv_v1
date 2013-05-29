require 'spec_helper'

describe "UserPages" do
	subject { page }

  describe "signup page" do
  	before {visit signup_path}

  	it { should have_selector('h1', text: 'Sign up') }
  	it { should have_selector('title', text: full_title('Sign up')) }
  end


it "should have the right links on the layout" do
	visit static_pages_home_path
	click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
end  	

  
end
