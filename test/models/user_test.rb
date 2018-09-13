require 'test_helper'

class UserTest < ActiveSupport::TestCase

  	test 'valid user' do
	    user = User.new(first_name: 'Kwevan', 
		    last_name: 'Gouacide', 
		    email: 'Gouacide@example.com',
		    password: 'Bonjour123')
	    assert user.valid?
  	end

end
