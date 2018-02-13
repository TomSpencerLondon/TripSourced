class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.string :place
      t.string :author

      t.timestamps
    end
  end
end
