require 'spec_helper'


describe "Static pages" do
let(:base_title) {"Flitter |"}
  
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end
  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', :text => 'Flitter') }
    it { should have_selector('title', :text => "Flitter") }
    it { should_not have_selector('title', :text => '| Home') }

    it "should have the right links" do
      click_link "About"
      page.should have_selector('title', :text => "#{base_title} About")
        click_link "Help"
      page.should have_selector('title', :text => "#{base_title} Help")
      click_link "Contact"
      page.should have_selector('title', :text => "#{base_title} Contact")
      click_link "Home"
      click_link "Sign up now!"
      page.should have_selector('title', :text => "#{base_title} Sign up")
      click_link "sample app"
      page.should have_selector('title', :text => "Flitter")    
    end
  end

  describe "Help page" do
    before {visit help_path}

    it { should have_selector('h1', :text => 'Help')}
    it { should have_selector('title', :text => "#{base_title} Help")}
  end

  describe "About page" do
    before { visit about_path }
    
    it {should have_selector('h1', :text => 'About Us')}
    it {should have_selector('title', :text => "#{base_title} About Us")}
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: "#{base_title} Contact") }
  end
end

