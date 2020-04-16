class CreateBildings < ActiveRecord::Migration[5.2]
  def change
    create_table :bildings do |t|
      t.boolean :active,default: true
      t.string :name
      t.string :printer_ip
      t.string :printer_uid
      t.string :printer_name 

      t.datetime :check_time
      t.text :pages_css
      t.bollean :pages_critical
      t.integer :pages_percent
      t.integer :pages_print


      t.text :comment
      t.text :percent_spool
      t.text :error_spool
      t.integer :summa , default: 0
      t.string :telefon , default: '79266074939'
      t.timestamps
    end
  end
end
