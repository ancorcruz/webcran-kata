class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.text :data
      t.string :name
      t.string :version
      t.string :title
      t.text :description
      t.string :authors
      t.string :maintainers

      t.timestamps
    end
  end
end
