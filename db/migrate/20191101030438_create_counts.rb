class CreateCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :counts do |t|
      t.integer :total_logins

      t.timestamps
    end
  end
end
