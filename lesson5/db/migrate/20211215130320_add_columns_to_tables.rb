class AddColumnsToTables < ActiveRecord::Migration[6.1]
  def change
    change_table :patients do |t|
      t.rename :name, :first_name
      t.string :last_name, null: false, default: "Last Name"
      t.integer :age, null: false, default: 18
      t.string :email, null: false, default: "email@gmail.com"
    end

    change_table :physicians do |t|
      t.rename :name, :first_name
      t.string :last_name, null: false, default: "Last Name"
      t.string :phone_number, null: false, default: "+380987654321"
      t.string :level, null: false, default: "junior"
    end

    create_table :diagnosis_items do |t|
      t.text :content, null: false, default: "Healthy"
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end

    change_column_null :patients, :first_name, false
    change_column_default :patients, :first_name, from: nil, to: "Name"

    change_column_null :physicians, :first_name, false
    change_column_default :physicians, :first_name, from: nil, to: "Name"   
  end
end
