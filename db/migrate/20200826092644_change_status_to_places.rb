class ChangeStatusToPlaces < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :status, :string
  end
end
