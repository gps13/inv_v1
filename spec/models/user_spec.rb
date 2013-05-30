# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", email: "user@example.com", 
                    password: "foobar", password_confirmation: "foobar") }
# The before block, which we saw in Listing 5.27), runs the code inside the block before each
#  example—in this case, creating a new @user instance variable using User.new and a
# valid initialization hash.
  subject { @user }
 #makes @user the default subject of the test example

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
 # The two examples in Listing 6.8 test for the existence of name and email attributes:
###################
# The tests themselves rely on the boolean convention used by RSpec: the code
# 
#  @user.respond_to?(:name)
#  								can be tested using the RSpec code
#  @user.should respond_to(:name)
#  					Because of subject { @user }, we can leave off @user in the test, yielding
#  it { should respond_to(:name) }

	it { should be_valid }
# sanity check, verifying that the @user object is initially valid:
# This is another example of the RSpec boolean convention we saw in Section 6.2.1:
# whenever an object responds to a boolean method foo?, there is a corresponding test
# method called be_foo. In this case, we can test the result of calling
# @user.valid?
# 					with
# @user.should be_valid


	describe "when name is not present" do
	    before { @user.name = " " }
	    it { should_not be_valid }
	end

	describe "when email is not present" do
	    before { @user.email = " " }
	    it { should_not be_valid }
	end

	describe "when name is too long" do
    	before { @user.name = "a" * 51 }
    	it { should_not be_valid }
  	end

############# email validation###########

	describe "when email format is invalid" do
	    it "should be invalid" do
	      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
	                     foo@bar_baz.com foo@bar+baz.com]
	      addresses.each do |invalid_address|
	        @user.email = invalid_address
	        @user.should_not be_valid
	      end      
	    end
	  end


	describe "when email format is valid" do
	    it "should be valid" do
	      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	      addresses.each do |valid_address|
	        @user.email = valid_address
	        @user.should be_valid
	      end      
	    end
	  end
##########################
# Uniqueness validation - duplicate email addresses, insensitive to case
	describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
###########################
# password validation
	describe "when password is not present" do
	  before { @user.password = @user.password_confirmation = " " }
	  it { should_not be_valid }
	end
	describe "when password confirmation is nil" do
	  before { @user.password_confirmation = nil }
	  it { should_not be_valid }
	end

end
