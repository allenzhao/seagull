class CreateErrorLogs < ActiveRecord::Migration
  def change
    create_table :error_logs do |t|
      t.references :student
      t.string :ip
      t.integer :status
      t.string :detail
      t.timestamps null: false
    end
  end
end
