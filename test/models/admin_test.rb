require 'test_helper'

class AdminTest < ActiveSupport::TestCase


	def setup 
		@admin = Admin.new(first_name: 'Kwevan', 
	    	last_name: 'Gouacide',
	    	email: 'Gouacide@example.com',  
	    	password: 'Bonjour123')
	end

	test 'admin should be valid' do
	    assert @admin.valid?
  	end

	test 'first_name should be present' do 
		@admin.first_name = ""
		assert_not @admin.valid?
	end	

	test 'last_name should be present' do 
		@admin.last_name = ""
		assert_not @admin.valid?
	end	

	

end
