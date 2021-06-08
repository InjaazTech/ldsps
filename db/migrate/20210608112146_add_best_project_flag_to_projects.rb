class AddBestProjectFlagToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_best, :boolean, default: false
  end
end
