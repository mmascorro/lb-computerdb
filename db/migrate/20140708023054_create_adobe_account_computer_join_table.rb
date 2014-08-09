class CreateAdobeAccountComputerJoinTable < ActiveRecord::Migration
  def change
    create_join_table :computers, :adobe_accounts do |t|
      # t.index [:computer_id, :adobe_account_id]
      # t.index [:adobe_account_id, :computer_id]
    end
  end
end
