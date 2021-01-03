class Objective < ApplicationRecord

  validates :declaration, presence: true
  validates :reason, presence: true
  validates :reward, presence: false
  validates :set_flag, inclusion: {in: [true, false]}

  belongs_to :user
  has_many  :menus, dependent: :destroy
end
