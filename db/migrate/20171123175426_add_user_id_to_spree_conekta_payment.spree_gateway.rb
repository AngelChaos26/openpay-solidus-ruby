# This migration comes from spree_gateway (originally 20140509151116)
class AddUserIdToSpreeConektaPayment < ActiveRecord::Migration
  def change
    add_column :spree_conekta_payments, :user_id, :integer
    add_index :spree_conekta_payments, :user_id
  end
end
