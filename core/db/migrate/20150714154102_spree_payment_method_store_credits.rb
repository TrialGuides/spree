class SpreePaymentMethodStoreCredits < ActiveRecord::Migration
  def up
    return if Spree::PaymentMethod.find_by_type("Spree::PaymentMethod::StoreCredit")

    # Reload to pick up new position column for acts_as_list
    Spree::PaymentMethod.reset_column_information
    Spree::PaymentMethod::StoreCredit.create(name: "Store Credit", description: "Store credit.", active: true)
  end

  def down
    Spree::PaymentMethod.find_by(type: "Spree::PaymentMethod::StoreCredit", name: "Store Credit").try(&:destroy)
  end
end
