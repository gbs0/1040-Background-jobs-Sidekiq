class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :subject
      t.string :content
      t.string :recipient

      t.timestamps
    end
  end
end
