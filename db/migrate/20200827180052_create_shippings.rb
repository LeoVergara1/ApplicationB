class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :name
      t.string :status
      t.string :delivery

      t.timestamps
    end
  end
end
