class ChangeDataTypeOfVisits < ActiveRecord::Migration[5.2]
  def change
    change_column :visits, :url_id, 'integer USING CAST(url_id AS integer)' 
  end
end
