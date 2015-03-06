class AddPublicToTopics < ActiveRecord::Migration
  def change
    change_column :topics, :public, :boolean, default: true
  end
end
