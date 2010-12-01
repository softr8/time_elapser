require 'helper'

class TestTimeElapser < Test::Unit::TestCase
  def test_should_return_current_date_if_no_params
    Time.stub(:now).returns(Time.at(946757701))
    assert_equal 946757701, TimeElapser.sanitize.to_i
  end

  def test_should_return_second_cero_when_second_four
    Time.stub(:now).returns(Time.at(946757704))
    assert_equal 946757700, TimeElapser.sanitize(5).to_i
  end
end
