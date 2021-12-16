class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.string :client_name
      t.string :client_address
      t.integer :service_fee
      t.string :pdfmonkey_id

      t.timestamps
    end
  end
end
