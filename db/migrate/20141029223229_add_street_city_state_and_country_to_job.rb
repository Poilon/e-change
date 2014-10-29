class AddStreetCityStateAndCountryToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :city, :string
    add_column :jobs, :state, :string
    add_column :jobs, :street, :string
    add_column :jobs, :country, :string
  end
end
