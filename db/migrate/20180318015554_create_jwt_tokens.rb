class CreateJwtTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :jwt_tokens, id: :uuid do |t|
      t.string    :token
      t.datetime  :expiration

      t.timestamps
    end
  end
end
