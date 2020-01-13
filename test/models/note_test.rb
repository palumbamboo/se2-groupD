require 'test_helper'

class NoteTest < ActiveSupport::TestCase

    def test_note_stored
        n = Note.new(:date => Date.today, :description => "Description", :subject => "Math")
        assert_equal(n.date, Date.today)
        assert_equal(n.subject, "Math")
        assert_equal(n.description, "Description")
    end
end