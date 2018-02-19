class AddCountryCodeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :country_code, :string, default: '1'
  end
end
