class CreateFees < ActiveRecord::Migration[7.1]
  def change
    create_table :fees do |t|

      t.timestamps
    end
  end
end
