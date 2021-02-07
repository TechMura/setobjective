require 'rails_helper'

RSpec.describe "目標の編集", type: :system do
  before do
    @objective = FactoryBot.create(:objective)
  end
  context "目標を編集できるとき" do
    it "ログインしたユーザーは自分の目標を編集することができる" do
      #ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @objective.user.email
      fill_in 'パスワード', with: @objective.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページに移動
      expect(page).to have_link 'マイページ', href: user_path(@objective.user.id)
      visit user_path(@objective.user.id)
      expect(page).to have_content(@objective.declaration)
      # 目標詳細ページへ移動
      visit objective_path(@objective.id)
      # 目標の編集ボタンをクリックして目標編集画面に移動
      expect(page).to have_button '目標の編集'
      click_button '目標の編集'
      # 入力フォームに登録されている内容が入力されていることを確認
      expect(current_path).to eq edit_objective_path(@objective.id)
      expect(
        find("#objective_declaration").value
      ).to eq @objective.declaration
      expect(
        find("#objective_reason").value
      ).to eq @objective.reason
      expect(
        find("#objective_reward").value
      ).to eq @objective.reward
      expect(
        ActiveRecord::Type::Boolean.new.cast(find("#objective_set_flag").value)
      ).to eq @objective.set_flag
      # 目標を編集する
      fill_in '目標', with: "#{@objective.declaration}+編集した目標"
      fill_in '目標設定理由',with: "#{@objective.reason}+編集した目標設定理由"
      fill_in '達成報酬',with: "#{@objective.reward}+編集した達成報酬"
      find('input[type="checkbox"]').click
      expect{
        find('input[name="commit"]').click
      }.to change { Objective.count }.by(0)
      # 目標詳細画面に移動していることを確認
      expect(current_path).to eq objective_path(@objective.id)
      # 目標が更新されていることを確認
      expect(page).to have_content("#{@objective.declaration}+編集した目標")
      expect(page).to have_content("#{@objective.reason}+編集した目標")
      expect(page).to have_content("#{@objective.reward}+編集した達成報酬")
    end
  end
  context "目標を編集できないとき" do
    it "ログインしていないとマイページに移動できず、目標編集画面にいけない" do
      # トップページにマイページに遷移するボタンがないことを確認
      visit root_path
      expect(page).to have_no_link 'マイページ', href: user_path(@objective.user.id)
    end
  end
end
RSpec.describe "目標の削除", type: :system do
  before do
    @objective = FactoryBot.create(:objective)
  end
  context "目標を削除できるとき" do
    it "ログインしたユーザーは自分が登録した目標を削除できる" do
      #ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @objective.user.email
      fill_in 'パスワード', with: @objective.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページに移動
      expect(page).to have_link 'マイページ', href: user_path(@objective.user.id)
      visit user_path(@objective.user.id)
      expect(page).to have_content(@objective.declaration)
      # 目標詳細ページへ移動
      visit objective_path(@objective.id)
      # 目標の編集ボタンをクリックして目標編集画面に移動
      expect(page).to have_button '目標の削除'
      # ダイアログでOKを選択する
      expect{
        click_button '目標の削除'
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
        page.driver.browser.switch_to.alert.accept
        find ".add-objective-link"
      }.to change{ Objective.count }.by(-1)
      # マイページに遷移していることを確認
      expect(current_path).to eq user_path(@objective.user.id)
      # 削除した目標がさくじょされていることを確認する
      expect(page).to have_no_content(@objective.declaration)
    end
  end
  context "目標を削除できないとき" do
    it "ログインしていない状態では登録した目標を削除できない" do
      # トップページにマイページに遷移するボタンがないことを確認
      visit root_path
      expect(page).to have_no_link 'マイページ', href: user_path(@objective.user.id)
    end
  end
end