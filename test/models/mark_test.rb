require 'test_helper'

class MarkTest < ActiveSupport::TestCase

    def test_mark_stored
        m = Mark.new(:mark => 6.0, :subject => "Math", :date => Date.today, :notes => "Good")
        assert_equal(m.mark, 6.0)
        assert_equal(m.subject, "Math")
        assert_equal(m.date, Date.today)
        assert_equal(m.notes, "Good")
    end
end