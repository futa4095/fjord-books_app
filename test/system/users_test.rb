# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    login_as_alice
    visit users_url
    assert_selector 'h1', text: 'ユーザ'
  end

  test 'show a User' do
    login_as_alice
    visit users_url
    click_on '詳細', match: :first
    assert_text 'bob@example.com'
  end

  test 'follow a User' do
    login_as_alice
    visit user_url(users(:bob))
    assert_text '0 フォロワー'
    click_on 'フォローする'
    assert_text '1 フォロワー'
    click_on '1 フォロワー'
    assert_text 'alice@example.com'
    click_on '詳細'
    assert_text '1 フォロー'
  end

  test 'edit a User' do
    login_as_alice
    click_on 'アカウント編集'
    fill_in '氏名', with: 'アリス'
    click_on '更新'
    assert_text 'アリス'
    assert_text 'アカウント情報を変更しました。'
  end

  test 'destroying a User' do
    login_as_alice
    click_on 'アカウント編集'
    page.accept_confirm do
      click_on 'アカウント削除'
    end
    assert_text 'アカウントを削除しました。'
  end

  test 'login with github' do
    visit root_url
    click_on 'GitHubでログイン'
    assert_text 'GitHub アカウントによる認証に成功しました。'
  end
end
