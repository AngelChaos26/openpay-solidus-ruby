# This migration comes from spree_gateway (originally 20140509145837)
class AddPaymentMethodIdToSpreeConektaPayment < ActiveRecord::Migration
  def change
    add_column :spree_conekta_payments, :payment_method_id, :integer
    add_index :spree_conekta_payments, :payment_method_id
  end
end
