class CreateAdobeAccounts < ActiveRecord::Migration
  def change
    create_table :adobe_accounts do |t|
      t.string :email
      t.references :computer, index: true

      t.timestamps
    end
  end
end
