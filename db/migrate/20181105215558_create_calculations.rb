class CreateCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :calculations do |t|
      t.integer :operation
      t.json :values
      t.float :result

      t.timestamps
    end
  end
end
