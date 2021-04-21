# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    login_as_alice
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: '世界のカレー'
    fill_in 'メモ', with: 'ナイスです。'
    fill_in '著者', with: '夏目漱石'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text '世界のカレー'
    assert_text 'ナイスです。'
    assert_text '夏目漱石'
  end

  test 'updating a Book' do
    visit books_url
    all('tbody tr')[0].click_on '編集'

    fill_in 'タイトル', with: '3分クッキング'
    fill_in 'メモ', with: '美味しい！'
    fill_in '著者', with: 'NHK出版'
    click_on '更新する'

    assert_text 'が更新されました。'
    assert_text '3分クッキング'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text '走れメロス'
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text '走れメロス'
  end

  test 'add comment to Book' do
    visit book_url(books(:one))
    assert_text '（コメントがありません）'
    fill_in 'comment_content', with: 'goodです'
    click_button 'コメントする'
    assert_text 'goodです'
    assert_no_text '（コメントがありません）'

    fill_in 'comment_content', with: 'excellentです'
    click_button 'コメントする'
    assert_text 'excellentです'
  end
end
