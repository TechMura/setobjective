class Objective < ApplicationRecord

  validates :declaration, presence: true
  validates :reason, presence: true
  validates :reward, presence: false
  # validates :set_flag, presence: false

  belongs_to :user
  has_many  :menus
end
