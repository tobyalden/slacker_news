class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.column :name, :string
      t.column :url, :string

      t.timestamps
    end
  end
end
