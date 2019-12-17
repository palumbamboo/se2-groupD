require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

  def test_pretty_expiry_date
    assignment = Assignment.new(:name => "Assignment", :expiry_date => Date.today + 2.days)
    assert_equal((Date.today + 2.days).to_date.strftime("%d/%m/%Y"), assignment.pretty_expiry_date)
  end

end