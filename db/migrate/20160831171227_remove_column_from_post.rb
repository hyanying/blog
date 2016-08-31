class RemoveColumnFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :dateedited, :datetime
  end
end
