class RenameBook < ActiveRecord::Migration
  def change
  	rename_column :books, :location, :author
  end
end
