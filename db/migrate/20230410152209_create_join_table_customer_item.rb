class CreateJoinTableCustomerItem < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :items do |t|

      t.timestamps
      t.index [:customer_id, :item_id]
      t.index [:item_id, :customer_id]
    end
  end
end
