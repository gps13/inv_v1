require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before {visit static_pages_home_path}

    it "should have the content 'Sample App'" do
      # visit static_pages_home_path # ==> it used teh before #'/static_pages/home'
      page.should have_content('Sample App')
    end
    
    # it "should have the h1 'Inventory Sample App'" do # ==> it {should ....}
    it { should have_selector('h1', text: 'Inventory Sample App') }
      # visit static_pages_home_path # ==> it used teh before #'/static_pages/home'
      # page.should have_selector('h1', :text => 'Inventory Sample App') # ==> it {should ....}
    # end

    # it "should have the base title" do # ==> it {should ....}
    # it { should have_selector 'title', text: "Ruby on Rails Tutorial Sample App" }
    it { should have_selector('title', text: full_title('')) }
      # visit static_pages_home_path # ==> it used teh before #'/static_pages/home'
      # page.should have_selector('title', 
                        # :text => "Ruby on Rails Tutorial Sample App") # ==> it {should ....}
    # end

    # it "should not have a custom page title" do
    it { should_not have_selector 'title', text: '| Home' } # ==> it {should ....}
      # visit static_pages_home_path # ==> it used teh before
      # page.should_not have_selector('title', text: '| Home')
    # end
  end

  describe "Help page" do
    before {visit help_path}

    # it "should have the h1 'Help'" do
    it { should have_selector('h1', text: 'Help') }
      # visit static_pages_help_path #'/static_pages/help'
      # page.should have_selector('h1', :text => 'Help')
    # end

    # it "should have the title 'Help'" do
    it { should have_selector('title', text: full_title('Help')) }
      # visit static_pages_help_path #'/static_pages/help'
      # page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
    # end

    it "should have the content 'Help'" do
      # visit static_pages_help_path #'/static_pages/help'
      page.should have_content('Help')
    end
  end

  describe "About page" do
    before {visit about_path}

    # it "should have the h1 'About Us'" do
    it { should have_selector('h1', text: 'About Us') }
      # visit static_pages_about_path #'/static_pages/about'
      # page.should have_selector('h1', :text => 'About Us')
    # end

    # it "should have the title 'About Us'" do
    it { should have_selector('title', text: full_title('About Us')) }
      # visit static_pages_about_path #'/static_pages/about'
      # page.should have_selector('title',:text => "Ruby on Rails Tutorial Sample App | About Us")
    # end
  end

  describe "Contact page" do
    before {visit contact_path}

    # it "should have the h1 'Contact'" do
    it { should have_selector('h1', text: 'Contact') }
      # visit static_pages_contact_path #'/static_pages/contact'
      # page.should have_selector('h1', text: 'Contact')
    # end

    # it "should have the title 'Contact'" do
    it { should have_selector('title', text: full_title('Contact')) }
      # visit static_pages_contact_path #'/static_pages/contact'
      # page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")
    # end
  end
it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Inventory sample app"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "Inventory sample app"
    page.should have_selector 'title', text: full_title('')
  end
  
end