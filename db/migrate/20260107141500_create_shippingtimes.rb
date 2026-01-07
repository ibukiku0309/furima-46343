class CreateShippingtimes < ActiveRecord::Migration[7.1]
  def change
    create_table :shippingtimes do |t|

      t.timestamps
    end
  end
end
