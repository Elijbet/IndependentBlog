class AddLastNameToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :last_name, :string
  end
end
