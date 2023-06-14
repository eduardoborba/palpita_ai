# frozen_string_literal: true

class AddConfirmableToDevise < ActiveRecord::Migration[6.1]
  def self.up
    add_column :players, :confirmation_token, :string
    add_column :players, :confirmed_at, :datetime
    add_column :players, :confirmation_sent_at, :datetime
    add_column :players, :unconfirmed_email, :string

    add_index  :players, :confirmation_token, unique: true
  end

  def self.down
    remove_index  :players, :confirmation_token

    remove_column :players, :unconfirmed_email
    remove_column :players, :confirmation_sent_at
    remove_column :players, :confirmed_at
    remove_column :players, :confirmation_token
  end
end
