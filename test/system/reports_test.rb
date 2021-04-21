# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    login_as_alice
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Railsでテストする'
    fill_in '内容', with: 'モデルテストとシステムテストを書きました。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'Railsでテストする'
    assert_text 'モデルテストとシステムテストを書きました。'
  end

  test 'updating a Report' do
    visit reports_url
    all('tbody tr')[0].click_link '編集'

    fill_in 'タイトル', with: '更新後のタイトル'
    fill_in '内容', with: '更新後の内容'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '更新後のタイトル'
    assert_text '更新後の内容'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end

  test 'add comment to Report' do
    visit report_url(reports(:one))
    assert_text '（コメントがありません）'
    fill_in 'comment_content', with: '今日は良い天気ですね'
    click_button 'コメントする'
    assert_text '今日は良い天気ですね'
    assert_no_text '（コメントがありません）'
  end
end
