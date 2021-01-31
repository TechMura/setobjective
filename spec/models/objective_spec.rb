require 'rails_helper'

RSpec.describe Objective, type: :model do
  before do
    @objective = FactoryBot.build(:objective)
  end
  describe "目標新規登録" do
    context "目標登録できるとき" do
      it "declaration,reason,reward,set_flagが存在すれば登録できる" do
        expect(@objective).to be_valid
      end
      it "rewardが空でも登録できる" do 
        @objective.reward = ""
        expect(@objective).to be_valid
      end
      it "set_flagがfalseでも登録できる" do
        @objective.set_flag = "false"
        expect(@objective).to be_valid
      end
    end
    context "目標登録ができないとき" do 
      it "declarationが空だと登録できない" do
        @objective.declaration = ""
        @objective.valid?
        expect(@objective.errors.full_messages).to include("目標を入力してください")
      end
      it "reasonが空だと登録できない" do
        @objective.reason = ""
        @objective.valid?
        expect(@objective.errors.full_messages).to include("目標設定理由を入力してください")
      end
      it "ユーザーが紐づいていないと登録できない" do
        @objective.user = nil
        @objective.valid?
        expect(@objective.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
