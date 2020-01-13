require 'test_helper'

class CommunicationTest < ActiveSupport::TestCase

  def test_communication_stored
    comm = Communication.create(:title => "Title", :description => "Description", :start_date => Date.today, :expiry_date => Date.tomorrow)
    assert_equal(comm.title, "Title")
    assert_equal(comm.description, "Description")
    assert_equal(comm.start_date, Date.today)
    assert_equal(comm.expiry_date, Date.tomorrow)
  end

end