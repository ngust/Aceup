class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :jobs, :funtions, :functions
  end
end
