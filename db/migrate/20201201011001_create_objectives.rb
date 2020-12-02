class CreateObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :objectives do |t|
      t.string      :declaration,   null: false
      t.text        :reason,        null: false
      t.text        :reward,        null: false
      t.boolean     :set_flag,      default: false
      t.timestamps
    end
  end
end
