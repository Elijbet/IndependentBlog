class CreateTips < ActiveRecord::Migration[5.0]
  def change
    create_table :tips do |t|
      t.string :headline
      t.text :tip
      t.integer :user_id

      t.timestamps
    end
  end
end
