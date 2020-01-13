require 'test_helper'

class PrincipalTest < ActiveSupport::TestCase

    def test_to_s
        p = Principal.new(:name => "prova", :surname => "principal")
        assert_equal(p.to_s, "Prova Principal")
    end
end