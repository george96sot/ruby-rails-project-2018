class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |f|
      f.column :user_id, :integer
      f.column :image_id, :integer
      f.column :comment, :string
    end
  end
end
