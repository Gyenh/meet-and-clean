require 'test_helper'

class EventTest < ActiveSupport::TestCase
	test 'valid event' do
	    admin = Event.new(name: 'ramassage', 
	    	place: 'Paris',
	    	description: 'description example', 
	    	date: '10/10/2000')
	    assert event.valid?
	end
end
