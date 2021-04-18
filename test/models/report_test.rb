# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable' do
    report = reports(:one)
    alice = users(:alice)
    assert report.editable?(alice)
    bob = users(:bob)
    assert_not report.editable?(bob)
  end

  test 'created_on' do
    report = reports(:one)
    assert_equal Date.new(2021, 4, 1), report.created_on
  end
end
