class AddOrganizationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :organization, :string
  end
end
