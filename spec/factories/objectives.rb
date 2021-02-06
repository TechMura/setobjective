FactoryBot.define do
  factory :objective do
    declaration           {"達成する目標"}
    reason                 {"目標をせっていする理由"}
    reward              {"達成したときのご褒美"}
    set_flag             {"true"}
    association :user 
  end
end
