# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should get name or email' do
    alice = users(:alice)
    assert_equal 'alice@example.com', alice.name_or_email
    alice.name = 'alice'
    assert_equal 'alice', alice.name_or_email
  end

  test 'should follow and unfollow' do
    alice = users(:alice)
    bob = users(:bob)

    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
    alice.follow(bob)
    assert alice.following?(bob)
    assert bob.followed_by?(alice)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
    assert_not bob.followed_by?(alice)
  end
end
