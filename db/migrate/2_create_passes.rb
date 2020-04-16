class CreatePasses < ActiveRecord::Migration[5.2]
  def change
    create_table :passes do |t|
      t.text :name
      t.text :description
      t.date :date
      t.boolean :print_pass, default: false
      #t.belongs_to :profile
      t.string :bild ,default: nil
      t.integer :user_id
      t.integer :profile_id
      t.timestamps
      t.string :report_sms 
      t.string :report_print
      t.string :report_time

     t.references :profile, foreing_key: true
    end

  end
end
