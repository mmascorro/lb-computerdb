class AddComputerLocationAssociation < ActiveRecord::Migration
  def change

	change_table :computers do |t|
	    t.belongs_to :location
	 end


  end
end
