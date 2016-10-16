class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.float :percentage
      t.string :country
      t.string :style
      t.float :sscore
      t.float :oscore

      t.timestamps
    end
  end
end
