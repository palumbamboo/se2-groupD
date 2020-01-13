require 'test_helper'

class ParentTest < ActiveSupport::TestCase

    def test_to_s
        p = Parent.new(:name => "prova", :surname => "parent")
        assert_equal(p.to_s, "Prova Parent")
    end
end