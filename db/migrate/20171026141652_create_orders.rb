class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.bigint 'first_id'
      t.bigint 'main_id'
      t.bigint 'drink_id'
      t.timestamps
    end

    add_reference :orders, :user, index: true
  end
end
