# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    user factory: :alice
    title { 'タイトル' }
    content { '内容' }
    created_at { Time.zone.local(2021, 4, 1, 10, 20, 33) }
  end
end
