class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :place
      t.string :reason
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
