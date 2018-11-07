class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.string :url_id, null: false
      t.timestamps
    end

    add_index :visits, [:visitor_id, :url_id]
  end
end
