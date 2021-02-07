require 'rails_helper'

RSpec.describe "メニューの追加", type: :system do
  before do
    @menu = FactoryBot.create(:menu)
  end

  context "メニューの追加ができるとき" do
    it "ログインしているユーザーは自分のメニューを追加できる" do 
      # ログインする
      visit root_path
      visit new_user_session_path
      fill_in 'Eメール', with: @menu.objective.user.email
      fill_in 'パスワード', with: @menu.objective.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページに移動
      expect(page).to have_link 'マイページ', href: user_path(@menu.objective.user.id)
      visit user_path(@menu.objective.user.id)
      expect(page).to have_content(@menu.objective.declaration)
      # 目標の詳細画面へ移動
      visit objective_path(@menu.objective.id)
      # メニュー追加画面に移動
      expect(page).to have_button 'メニュー追加'
      click_button 'メニュー追加'
      expect(page).to have_content('メニュー追加画面')
      # メニューが登録されていることを確認
      tds = page.all('td')
      expect(
        tds[@menu.week_id]
      ).to have_content @menu.todo
      #メニュー追加を1週間分追加
      fill_in '回数', with: @menu.time
      fill_in 'メニューの効果', with: @menu.effect
      options = page.all('option')
      options.each_with_index do |option, i|
        if option.value =~ /^[0-6]+$/
          option.select_option
          fill_in 'メニュー', with: "#{@menu.todo}#{i}"
          find('button[id="add-btn"]').click
        end
      end
      # 一週間の表にメニューが追加されていることを確認
      tds = page.all('td')
      tds.each.with_index(1)do |td, i|
        expect(td).to have_content("メニュー#{i}")
      end
      expect{
        find('input[name="commit"]').click
      }.to change{ Menu.count }.by(7)
      # 目標詳細画面へ移動したことを確認
      expect(current_path).to eq objective_path(@menu.objective.id)
      # 一週間の表にメニューが表示されていることを確認
      tds = page.all('td')
      tds.each.with_index(1)do |td, i|
        expect(td).to have_content("メニュー#{i}")
      end
    end
  end
  context "メニューの編集ができないとき" do
    it "ログインしていない状態では登録したメニューを削除できない" do
      # トップページにマイページに遷移するボタンがないことを確認
      visit root_path
      expect(page).to have_no_link 'マイページ', href: user_path(@menu.objective.user.id)
    end
  end
end
RSpec.describe "メニューの削除", type: :system do
  before do
    @objective = FactoryBot.create(:objective)
    @menus = FactoryBot.create_list(:menu, 7, objective: @objective)
  end

  context "メニューの削除ができるとき" do
    it "ログインしているユーザーは自分のメニューを削除できる" do 
      # ログインする
      visit root_path
      visit new_user_session_path
      fill_in 'Eメール', with: @objective.user.email
      fill_in 'パスワード', with: @objective.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページに移動
      expect(page).to have_link 'マイページ', href: user_path(@objective.user.id)
      visit user_path(@objective.user.id)
      expect(page).to have_content(@objective.declaration)
      # 目標の詳細画面へ移動
      visit objective_path(@objective.id)
      # メニュー削除画面に移動
      expect(page).to have_button 'メニュー削除'
      click_button 'メニュー削除'
      expect(page).to have_content('メニュー削除画面')
      # 登録されているメニューをすべて削除する
      find_all('input[value="削除"]').count.times do
        expect{
          first('input[value="削除"]').click
        }.to change{ Menu.count }.by(-1)
      end
      find(".end-action-btn").click
      expect(current_path).to eq objective_path(@objective.id)
      # メニューが表示されていないことを確認
      tds = all("td")
      @menus.each do |menu|
        tds.each do |td|
          expect(td).to have_no_content(menu.todo)
        end
      end
    end
  end
  context "メニューの編集ができないとき" do
    it "ログインしていない状態では登録したメニューを削除できない" do
      # トップページにマイページに遷移するボタンがないことを確認
      visit root_path
      expect(page).to have_no_link 'マイページ', href: user_path(@objective.user.id)
    end
  end
end