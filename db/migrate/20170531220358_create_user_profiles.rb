class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
    	t.references :user
    	t.string :name, default: ""
    	t.text :description, default: ""
      t.string :location, default: ""
      t.integer :air, default: 0
      t.integer :earth, default: 0
      t.integer :water, default: 0
      t.integer :solar, default: 0

      t.timestamps
    end
  end
end
