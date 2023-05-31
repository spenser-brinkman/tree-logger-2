class ReplaceTimestamps < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :created_at, :datetime
    add_column :surveys, :updated_at, :datetime
    add_column :inspections, :created_at, :datetime
    add_column :inspections, :updated_at, :datetime
    add_column :properties, :created_at, :datetime
    add_column :properties, :updated_at, :datetime
    add_column :species, :created_at, :datetime
    add_column :species, :updated_at, :datetime
    add_column :trees, :created_at, :datetime
    add_column :trees, :updated_at, :datetime
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
  end
end
