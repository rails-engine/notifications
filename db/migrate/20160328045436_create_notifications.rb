# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.bigint :user_id, null: false
      t.bigint :actor_id
      t.string :notify_type, null: false
      t.string :target_type
      t.bigint :target_id
      t.string :second_target_type
      t.bigint :second_target_id
      t.string :third_target_type
      t.bigint :third_target_id
      t.datetime :read_at

      t.timestamps null: false
    end

    add_index :notifications, %i[user_id notify_type]
    add_index :notifications, [:user_id]
  end
end
