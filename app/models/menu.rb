class Menu < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :week_id, presence: true
  validates :todo, presence: true
  validates :time, presence: false
  validates :effect, presence: false
  
  belongs_to  :objective, optional: true
  belongs_to  :week
end
