FactoryBot.define do
  factory :objective do
    declaration           {"目標"}
    reason                 {"理由"}
    reward              {"達成報酬"}
    set_flag             {"true"}
    association :user 
  end
end
