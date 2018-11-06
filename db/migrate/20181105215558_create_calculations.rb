class CreateCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :calculations do |t|
      t.integer :first_value
      t.integer :second_value
      t.float :result
      t.integer :operation
      t.integer :count

      t.timestamps
    end
  end
end
