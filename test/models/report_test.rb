# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'should edit only posted user' do
    report = create(:report)
    alice = report.user
    assert report.editable?(alice)

    bob = create(:bob)
    assert_not report.editable?(bob)
  end

  test 'should get created date' do
    report = create(:report)
    assert_equal Date.new(2021, 4, 1), report.created_on
  end
end
