require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end
  describe "メニュー新規登録" do
    context "登録できるとき" do
      it "week_id,todo,time,effectがある時登録できる" do
        expect(@menu).to be_valid
      end
      it "timeが空でも登録できる" do
        @menu.time = ""
        expect(@menu).to be_valid
      end
      it "effectが空でも登録できる" do
        @menu.effect = ""
        expect(@menu).to be_valid
      end
      it "objectiveと紐づいてなくてもと登録できる" do
        @menu.objective = nil
        expect(@menu).to be_valid
      end
    end
    context "登録できないとき" do
      it "week_idが空だと登録できない" do
        @menu.week_id = ""
        @menu.valid?
        expect(@menu.errors.full_messages).to include("Weekを入力してください")
      end
      it "todoが空だと登録できない" do
        @menu.todo = ""
        @menu.valid?
        expect(@menu.errors.full_messages).to include("メニューを入力してください")
      end
    end
  end
end
