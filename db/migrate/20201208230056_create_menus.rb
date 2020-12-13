class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string      :todo,          null: false
      t.integer     :time,          null: true
      t.text        :effect,        null: false
      t.integer     :week_id,   null: false
      # t.references  :objective,     null: false  ,foreign_key: true 
      t.timestamps
    end
  end
end
