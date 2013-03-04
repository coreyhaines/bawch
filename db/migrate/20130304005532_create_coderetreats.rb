class CreateCoderetreats < ActiveRecord::Migration
  def change
    create_table :coderetreats do |t|
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
