# This migration comes from spree_gateway (originally 20140220160614)
class AddInstallmentsToSpreeCreditCard < ActiveRecord::Migration
  def change
    add_column :spree_credit_cards, :installments_number, :integer
  end
end
