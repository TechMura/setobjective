class Menu < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to  :objective, optional: true
  belongs_to  :week
end
