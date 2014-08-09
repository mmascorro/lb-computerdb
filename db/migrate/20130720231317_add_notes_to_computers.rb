class AddNotesToComputers < ActiveRecord::Migration
  def change
  		add_column :computers, :notes, :string
  end
end
