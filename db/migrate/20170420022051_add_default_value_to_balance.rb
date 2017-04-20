class AddDefaultValueToBalance < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :members, :balance, false
  	change_column_default :members, :balance, 100.00
  end
end
