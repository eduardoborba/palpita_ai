# frozen_string_literal: true

class AddLockableToDevise < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :players, :locked_at, :datetime

    # Add these only if unlock strategy is :email or :both
    add_column :players, :unlock_token, :string
    add_index :players, :unlock_token, unique: true
  end
end
