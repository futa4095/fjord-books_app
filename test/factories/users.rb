# frozen_string_literal: true

FactoryBot.define do
  factory :alice, class: User do
    email { 'alice@example.com' }
    password { 'password' }
  end

  factory :bob, class: User do
    email { 'bob@example.com' }
    password { 'password' }
  end
end
