# frozen_string_literal: true

class AddNotNullConstraintToComments < ActiveRecord::Migration[6.1]
  def change
    change_column_null :comments, :body, false
  end
end
