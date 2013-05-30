class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true
  	# add_index(table_name, column_name, options = {}) public
	# Adds a new index to the table. column_name can be a single Symbol,
	# or an Array of Symbols.
	# The index will be named after the table and the column name(s), unless
	# you pass :name as an option.
  end
end
