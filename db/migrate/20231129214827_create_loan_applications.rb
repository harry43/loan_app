class CreateLoanApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_applications do |t|
      t.string :business_name
      t.string :established_year
      t.string :account_provider
      t.float :amount

      t.timestamps
    end
  end
end
