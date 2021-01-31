FactoryBot.define do
  factory :menu do
    week_id       {rand(0..6)}
    todo          {"メニュー"}
    time          {"回数"}
    effect        {"メニューの効果"}

    association :objective
  end
end
