require 'test_helper'

class OfficerTest < ActiveSupport::TestCase

    def test_to_s
        o = Officer.new(:name => "prova", :surname => "officer")
        assert_equal(o.to_s, "Prova Officer")
    end
end