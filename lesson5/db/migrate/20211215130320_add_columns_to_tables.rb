class AddColumnsToTables < ActiveRecord::Migration[6.1]
  def change
    change_table :patients do |t|
      t.rename :name, :first_name
      t.column :last_name, :string
      t.column :age, :integer
      t.column :email, :string
    end

    change_table :physicians do |t|
      t.rename :name, :first_name
      t.column :last_name, :string
      t.column :phone_number, :string
      t.column :level, :string
    end

    create_table :diagnosis_items do |t|
      t.text :content
      t.timestamps
    end
  end
end
