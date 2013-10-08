class FixYearBuiltColumn < ActiveRecord::Migration
  def up
    change_column :properties, :year_built, :integer
  end

  def down
    change_column :properties, :year_built, :date
  end
end
