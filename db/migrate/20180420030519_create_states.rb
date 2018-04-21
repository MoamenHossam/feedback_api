class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :device
      t.string :os
      t.float :memory
      t.float :storage

      t.timestamps
    end
  end
end
