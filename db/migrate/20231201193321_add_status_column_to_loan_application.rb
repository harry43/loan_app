class AddStatusColumnToLoanApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :loan_applications, :status, :string
  end
end
