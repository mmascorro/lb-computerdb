class RemoveComputerFromAdobeAccount < ActiveRecord::Migration
  def change
    remove_reference :adobe_accounts, :computer, index: true
  end
end
