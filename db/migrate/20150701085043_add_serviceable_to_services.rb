class AddServiceableToServices < ActiveRecord::Migration
  def change
    add_column :services, :serviceable_id, :integer
    add_column :services, :serviceable_type, :string
  end
end
