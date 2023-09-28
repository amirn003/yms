class CreateJoinTableUsersCrews < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :crews do |t|
      # t.index [:user_id, :crew_id]
      # t.index [:crew_id, :user_id]
    end
  end
end
