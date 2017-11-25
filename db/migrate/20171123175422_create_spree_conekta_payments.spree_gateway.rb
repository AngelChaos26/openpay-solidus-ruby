# This migration comes from spree_gateway (originally 20130904161251)
class CreateSpreeConektaPayments < ActiveRecord::Migration
  def change
    create_table :spree_conekta_payments do |t|
      t.string :type

      t.timestamps
    end
  end
end
