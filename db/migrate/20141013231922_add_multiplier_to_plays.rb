class AddMultiplierToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :multiplier, :string
  end
end
