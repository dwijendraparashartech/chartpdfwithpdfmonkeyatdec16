class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :pdfmonkey_id, :string
  end
end
