class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.float :amount
      t.float :received
      t.string :status
      t.timestamps
    end
  end
end
