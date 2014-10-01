class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name
      t.string :adress
      t.string :tel
      t.references :user, index: true

      t.timestamps
    end
    #add_index :user_infos, [:user_id]
  end
end
