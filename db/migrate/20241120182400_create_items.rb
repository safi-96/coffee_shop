class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.decimal :tax_rate
      t.string :category
      t.decimal :discount

      t.timestamps
    end
  end
end
