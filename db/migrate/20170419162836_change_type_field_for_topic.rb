class ChangeTypeFieldForTopic < ActiveRecord::Migration[5.0]
  def change
    rename_column :topics, :type, :topic_type
  end
end
