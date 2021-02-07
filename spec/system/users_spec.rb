require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  it "ユーザー新規登録ができるとき" do
    visit root_path
    expect(page).to have_content('新規登録')
    visit new_user_registration_path
    fill_in 'ニックネーム', with: @user.nickname
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    fill_in 'パスワード（確認用）', with: @user.password_confirmation
    expect{
      find('input[name="commit"]').click
    }.to change{ User.count }.by(1)
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
  end

  it "ユーザー新規登録ができないとき" do
    visit root_path
    expect(page).to have_content('新規登録')
    visit new_user_registration_path
    fill_in 'ニックネーム', with: ""
    fill_in 'Eメール', with: ""
    fill_in 'パスワード', with: ""
    fill_in 'パスワード（確認用）', with: ""
    expect{
      find('input[name="commit"]').click
    }.to change{ User.count }.by(0)
    expect(current_path).to eq "/users"
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'Eメール', with: ""
      fill_in 'パスワード', with: ""
      find('input[name="commit"]').click
      expect(current_path).to eq new_user_session_path
    end
  end
end