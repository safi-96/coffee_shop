class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      # customer_name and customer_email directly included for rapid 
      # development and performance optimization, as there are no specific 
      # requirements to separate customer data, avoiding the 
      # trade-offs of additional complexity and potential performance overhead.

      t.string :customer_name
      t.string :customer_email
      t.decimal :total_price
      t.integer :status, default: 0, null: false # Enum

      t.timestamps
    end
  end
end
