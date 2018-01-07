class RenamePasswordToPasswordDigest < ActiveRecord::Migration[5.0]
  def change
  	rename_column :admins, :password, :password_digest
  end
end
