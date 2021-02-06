require 'rails_helper'
require 'date'

RSpec.describe "目標、メニュー新規登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @objective = FactoryBot.build(:objective)
    @menu = FactoryBot.build(:menu)
    @today = Date.today
  end
  context "目標、メニュー新規登録できるとき" do
    it "ログインしたユーザーは目標、メニュー新規登録できる" do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページへ移動
      visit user_path(@user.id)
      expect(page).to have_content('＋新しい目標を追加')
      #目標追加画面へ移動
      visit new_objective_path
      # 目標を入力
      fill_in '目標', with: @objective.declaration
      fill_in '目標設定理由', with: @objective.reason
      fill_in '達成報酬', with: @objective.reward
      find('input[type="checkbox"]').click
      find('input[name="commit"]').click
      #メニュー追加を1週間分追加
      expect(page).to have_content('メニュー登録画面')
      fill_in '回数', with: @menu.time
      fill_in 'メニューの効果', with: @menu.effect
      options = page.all('option')
      options.each_with_index do |option, i|
        if option.value =~ /^[0-9]+$/
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
      }.to change{ Objective.count }.by(1).and change{ Menu.count }.by(7)
      #トップページに遷移して、その日のメニューが表示されていることを確認
      expect(current_path).to eq root_path
      expect(page).to have_content("達成する目標")
      expect(page).to have_content("#{@menu.todo}#{@today.wday + 1}")
    end

    it "メニューを追加していなくても登録できる" do
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページへ移動
      visit user_path(@user.id)
      expect(page).to have_content('＋新しい目標を追加')
      #目標追加画面へ移動
      visit new_objective_path
      # 目標を入力
      fill_in '目標', with: @objective.declaration
      fill_in '目標設定理由', with: @objective.reason
      fill_in '達成報酬', with: @objective.reward
      find('input[type="checkbox"]').click
      find('input[name="commit"]').click
      # 保存されることを確認
      expect{
        find('input[name="commit"]').click
      }.to change{ Objective.count }.by(1).and change{ Menu.count }.by(0)
      #トップページに遷移して、その日のメニューが表示されていることを確認
      expect(current_path).to eq root_path
      expect(page).to have_content("達成する目標")
    end
  end
  context "目標、メニュー新規登録できないとき" do
    it "ログインしていないユーザーは目標、メニュー新規登録できない" do
      # トップページに移動
      visit root_path
      # マイページへのリンクがない
      expect(page).to have_no_content("マイページ")
    end
    it "目標メニューが入力されていないとメニュー追記画面に戦記できない" do
      # ログインす
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページへ移動
      visit user_path(@user.id)
      expect(page).to have_content('＋新しい目標を追加')
      #目標追加画面へ移動
      visit new_objective_path
      # 目標を入力
      fill_in '目標', with: ""
      fill_in '目標設定理由', with: ""
      fill_in '達成報酬', with: ""
      find('input[type="checkbox"]').click
      find('input[name="commit"]').click
      # 目標入力画面が表示されていることを確認
      expect(current_path).to eq "/objectives"
      #エラーメッセージが表示されていることを確認する
      expect(page).to have_content("目標を入力してください")
      expect(page).to have_content("目標設定理由を入力してください")
    end
    it "メニューが入力されていなければ追加できない" do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # マイページへ移動
      visit user_path(@user.id)
      expect(page).to have_content('＋新しい目標を追加')
      #目標追加画面へ移動
      visit new_objective_path
      # 目標を入力
      fill_in '目標', with: @objective.declaration
      fill_in '目標設定理由', with: @objective.reason
      fill_in '達成報酬', with: @objective.reward
      find('input[type="checkbox"]').click
      find('input[name="commit"]').click
      # メニューを入力
      expect(page).to have_content('メニュー登録画面')
      fill_in '回数', with: ""
      fill_in 'メニューの効果', with: ""
      find('button[id="add-btn"]').click
      expect(page).to have_content("曜日を選択してください")
      expect(page).to have_content("メニューを入力してください")
    end
  end
end
