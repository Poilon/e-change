class AddAddressToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :address, :string
  end
end
