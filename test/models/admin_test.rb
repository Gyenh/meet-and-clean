require 'test_helper'

class AdminTest < ActiveSupport::TestCase


	def setup 
		@admin = Admin.new(first_name: 'Kwevan', 
	    	last_name: 'Gouacide',
	    	email: 'Gouacide@example.com',
	    	phone: '0978767655',  
	    	password: 'Bonjour123')
	end

	test 'should be valid' do
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

	test 'phone should be present' do 
		@admin.phone = ""
		assert_not @admin.valid?
	end	


end
