class AddEmailToTips < ActiveRecord::Migration[5.0]
  def change
    add_column :tips, :email, :string
  end
end
