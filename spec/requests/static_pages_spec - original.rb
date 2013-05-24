require 'spec_helper'

describe "Static pages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before {visit static_pages_home_path}

    # it { should have_selector('h1', text: 'Inventory Sample App') }
    let (:heading) {'Inventory Sample App'}

    # it { should have_selector('title', text: full_title('')) }
    let (:page_title) {''}

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' } 
  end

  describe "Help page" do
    before {visit help_path}

    # it { should have_selector('h1', text: 'Help') }
    let (:heading) {'Help'}

    # it { should have_selector('title', text: full_title('Help')) }
    let (:page_title) {'Help'}

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before {visit about_path}

    # it { should have_selector('h1', text: 'About Us') }
    let (:heading) {'About Us'}

    # it { should have_selector('title', text: full_title('About Us')) }
    let (:page_title) {'About Us'}

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before {visit contact_path}

    # it { should have_selector('h1', text: 'Contact') }
    let (:heading) {'Contact'}

    # it { should have_selector('title', text: full_title('Contact')) }
    let (:page_title) {'Contact'}

    
    it_should_behave_like "all static pages"
    
  end

  
end