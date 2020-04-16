class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :company_name
      t.string :email
      #t.integer :profile_id
      t.text :company_address
      t.text :description
      t.boolean :company_active ,default: :false
      t.string  :company_kpp 
      t.string  :bild
      #t.belongs_to :user
	   t.string  :telefon_mobile 
	   t.string  :contact_name 
     t.text :company_description
	   t.text :print_header 
	   t.text  :print_cellar
	   t.string  :company_inn 
	   t.text  :company_org_address 
	   t.text  :company_bank 
     t.integer :pass_id
     t.integer :user_id
     t.string  :agreement
	   t.string  :company_email 


      t.timestamps
    end

    #add_index :profiles, :email,                unique: true
    #add_index :profiles, :profile_id,                unique: true
  end
end
