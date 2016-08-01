class ChangeBeerTypeToBeerStyle < ActiveRecord::Migration
  def change
    change_column :beers, :type, :style
  end
end
