# frozen_string_literal: true

class AddUserType < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :user_type, :integer
  end
end
