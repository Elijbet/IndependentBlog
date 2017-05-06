class AddFirstNameToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :first_name, :string
  end
end
