if ENV["RAILS_ENV"] == "development"
STATUSES = ["draft", "sent", "paid"]
USERS = [
  {
    full_name: "Earl A. Gott",
    address: "1923 Stiles Street, Pittsburgh, PA 15226",
    email: "earlagott@rhyta.com",
    phone: "412-571-8270"
  },
  {
    full_name: "Rachelle S. Vargas",
    address: "974 Haymond Rocks Road, Scottsburg, OR 97473",
    email: "rachellesvargas@dayrep.com",
    phone: "541-587-6332"
  },
  {
    full_name: "Gladys H. Sheffield",
    address: "1626 Hidden Meadow Drive, Des Lacs, ND 58733",
    email: "gladyshsheffield@rhyta.com",
    phone: "701-725-9343"
  },
  {
    full_name: "Effie L. Goode",
    address: "3889 Dogwood Lane, Tucson, AZ 85710",
    email: "effielgoode@rhyta.com",
    phone: "520-731-5031"
  },
  {
    full_name: "Monique D. Estep",
    address: "957 Hamill Avenue, San Diego, CA 92103",
    email: "moniquedestep@dayrep.com",
    phone: "858-360-1802"
  },
  {
    full_name: "Timothy I. Atwood",
    address: "3402 Raver Croft Drive, Chattanooga, TN 37421",
    email: "timothyiatwood@teleworm.us",
    phone: "423-645-9346"
  },
  {
    full_name: "Sherry F. Maldonado",
    address: "3058 Freedom Lane, Stockton, CA 95202",
    email: "sherryfmaldonado@armyspy.com",
    phone: "209-461-8106"
  },
  {
    full_name: "Wendy A. Collins",
    address: "2824 Broadway Street, Charleston, SC 29405",
    email: "wendyacollins@teleworm.us",
    phone: "843-744-5410"
  },
  {
    full_name: "Michelle J. Horton",
    address: "2125 Green Hill Road, Springdale, AR 72764",
    email: "michellejhorton@rhyta.com",
    phone: "479-361-1375"
  },
  {
    full_name: "Marc S. Irizarry",
    address: "4514 Big Elm, Richmond, MO 64085",
    email: "marcsirizarry@jourrapide.com",
    phone: "816-776-0200"
  }
]

PRODUCTS = [
  {
    name: "Nestea - Ice Tea, Diet",
    price: 50.7,
    qty: 8,
    description: "Team-oriented logistical policy"
  },
  {
    name: "Pork - Hock And Feet Attached",
    price: 39.17,
    qty: 10,
    description: "Programmable contextually-based local area network"
  },
  {
    name: "Squash - Acorn",
    price: 35.54,
    qty: 1,
    description: "Down-sized zero administration productivity"
  },
  {
    name: "Carbonated Water - Cherry",
    price: 34.83,
    qty: 10,
    description: "Seamless transitional installation"
  },
  {
    name: "Tea - Lemon Green Tea",
    price: 22.13,
    qty: 7,
    description: "Advanced background emulation"
  },
  {
    name: "Bread - Pita",
    price: 34.94,
    qty: 2,
    description: "Automated tangible system engine"
  },
  {
    name: "Soup - Knorr, Classic Can. Chili",
    price: 9.9,
    qty: 9,
    description: "Enhanced scalable conglomeration"
  },
  {
    name: "Pork - Ham, Virginia",
    price: 74.52,
    qty: 7,
    description: "Automated optimizing policy"
  },
  {
    name: "Capers - Ox Eye Daisy",
    price: 8.79,
    qty: 2,
    description: "Integrated asynchronous local area network"
  },
  {
    name: "Tomatoes",
    price: 88.7,
    qty: 5,
    description: "Expanded upward-trending paradigm"
  },
  {
    name: "Sword Pick Asst",
    price: 21.87,
    qty: 5,
    description: "Switchable logistical protocol"
  },
  {
    name: "Beans - Black Bean, Canned",
    price: 71.19,
    qty: 5,
    description: "Cross-group static challenge"
  },
  {
    name: "Oil - Truffle, Black",
    price: 75.6,
    qty: 1,
    description: "Robust contextually-based Graphical User Interface"
  },
  {
    name: "Breadfruit",
    price: 66.78,
    qty: 8,
    description: "Inverse mission-critical circuit"
  },
  {
    name: "Soupcontfoam16oz 116con",
    price: 22.27,
    qty: 5,
    description: "Customer-focused bandwidth-monitored architecture"
  },
  {
    name: "Vodka - Smirnoff",
    price: 13.77,
    qty: 7,
    description: "Object-based demand-driven conglomeration"
  },
  {
    name: "Beans - Kidney White",
    price: 48.64,
    qty: 2,
    description: "Customizable background product"
  },
  {
    name: "Filter - Coffee",
    price: 33.75,
    qty: 2,
    description: "Up-sized actuating moratorium"
  },
  {
    name: "Ice Cream - Life Savers",
    price: 71.39,
    qty: 1,
    description: "Cloned optimal benchmark"
  },
  {
    name: "Cheese - Gorgonzola",
    price: 23.66,
    qty: 6,
    description: "Stand-alone reciprocal architecture"
  }
]

#Invoice.all.destroy_all
User.all.destroy_all
Pass.all.destroy_all
Bilding.all.destroy_all
Profile.all.destroy_all

3.times do
    from = USERS[rand(0..9)]
    to = USERS[rand(0..9)]

    invoice = Invoice.create(
      status: STATUSES[rand(0..2)],
      from_full_name: from[:full_name],
      from_address: from[:address],
      from_email: from[:email],
      from_phone: from[:phone],
      to_full_name: to[:full_name],
      to_address: to[:address],
      to_email: to[:email],
      to_phone: to[:phone],
      discount: rand(0.0..20).round(2),
      vat: [5, 10, 15, 20][rand(0..3)]
    )

    (rand(1..5)).times do
      product = PRODUCTS[rand(0..19)]
      #invoice_item = InvoiceItem.create(
      #  name: product[:name],
      #  description: product[:description],
      #  price: product[:price],
      #  qty: product[:qty],
      #  invoice: invoice
      #)
    end

end


#STATUSES = ["draft", "sent", "paid"]
BILDS = ["37","41","42","43"," "]
COMPANY_ORG = ["ООО","ЗАО","ПАО","ИП" ,"ОАО","Фонд","НКО"]
COMPANY_NAME = ["Ромашка","Лопух" ,"Полковник" , "Родекс" ,"Экспедиция" ,"ВинБиЭй","Связнь" ,"Элемент","Артикул","Буква","Дело","Легион"]
COMPANY_NAME_END = ["подшипник","винт" ,"мираж" , "групп" , "небо" , "лоция","золото","нефть","Электрон","орбис","знание","пирс",""]
PERSONA_N = ["Владимира","Валерия","Семена","Антона","Магомеда","Сергея","Эльвиры","Анны","Елены","Остапа","Лена","Bасилий","Татьяна"]
PERSONA_F = ["Иванова","Петрова","Сидорова","Дрозд","Еремина","Путух","Вишни","Мороз","Цоя","Ынь","Ан","Оглы","Де Роз"]
PERSONA_CITY = ["Москва","Тула","Рязань","Владимир","Сараторв","Нальчик","Ленинград","Владивасток","Находка","Омск","Тверь","Полярный","Грозный"]
PERSONA_STR = ["Ленининский прт"," Парковая ","Владимирская" ,"Проездная","Железнодорожная","Путевая","Обьездная","Мичурина","Школьная","Победы","Тупик","Ленина","Южная"]
BANK_NAME =  ["ПАО Сбербанк","ПАО Альфа-Банк", "Открытие" , "Рокет-Банк","Tinkoff - Финанс","Дело-Банк"]

_company = 10 
emails = []

BILDS.each do |bild|

   Bilding.create(name: bild) unless bild == " "
end
User.create(email: 'admin@mpmz.ru' , 
            password: "password1", 
            password_confirmation: "password1",
            password_name: "password1",
            admin: true)

User.create(email: 'info@gmail.com' , 
            password: "password1", 
            password_confirmation: "password1",
            password_name: "password1",
            admin: "true")
_company.times do 
      email = Faker::Internet.email
      emails.append(email)
       User.create(email: email ,
                   password: "password1",
                   password_confirmation: "password1", 
                   password_name: "password1")
end
def create_profile(_email,_company_email,_id,_company)
  (rand(1..2)).times do

    b1 = BILDS[rand(0..5)]
    b2 = BILDS[rand(0..6)]

    if b1 == b2
       bild = " #{b1}" 
    else 
       bild = "#{b1} #{b2}"
    end
    p "Строение #{bild}"



	address  = "109202 г.Москва 2-я Звенигородская дом: #{bild[0]} строеие: #{rand(1..8)} офис: #{rand(10..320)}"
	names = " #{COMPANY_ORG[rand(0..6)]} #{COMPANY_NAME[rand(0..12)]} #{COMPANY_NAME_END[rand(0..12)]}"

  telefon_mobile = "+7(#{rand(100..999)}) #{rand(100..999)}-#{rand(1000..9999)}"
  company_inn = "71#{rand(13456789012..99999999999)}"
  company_kpp = "70#{rand(12345678901200..99999999999900)}"
  company_bank = "Банк #{BANK_NAME[rand(0..6)]} г. #{PERSONA_CITY[rand(0..12)]}"

  Profile.create(company_name: names,
                            company_address: address,
                            company_email: _company_email,
                            email: _email,
                            description: "",
                            user_id: _id,
               #             profile_id: profile_id,
                            company_active: true,
                            bild: bild,
                            telefon_mobile: telefon_mobile,
                            contact_name: PERSONA_N[rand(0..9)],
                            company_inn: company_inn,
                            company_kpp: company_kpp,
                            company_bank: company_bank,
                            company_org_address: address)
	 
end
end
def create_pass(user_id,profile_id,bild,profile)
    p bild 
    p user_id
    p profile

	 (rand(10..50)).times do  
		description_name = "Выписать пропуск на #{PERSONA_N[rand(0..12)]} #{PERSONA_F[rand(0..12)]}"       
		description_passpot = "Паспорт: серия #{rand(10..99)}-#{rand(101030..999999)} выдан #{rand(1960..2000)}г.
	                           	Зарегестрирована г. #{PERSONA_CITY[rand(0..12)]} улица #{PERSONA_STR[rand(0..12)]} дом #{rand(1..30)}" 
    date =   Time.new(2019,rand(10..12),rand(1..30))
    p Pass.create(name: description_name,
             description: description_passpot,
             date: date,
             bild: bild, 
             profile_id: profile_id,
             user_id: user_id)
       end
end
User.all.each do |u|
  bilds = []

  company_email = Faker::Internet.email
  create_profile(u.email,company_email,u.id,_company)
  Profile.where(user_id: u.id).each do |profile|
    profile_id =  profile.id 
    bilds =  profile.bild.split(" ").uniq
    if bilds.length == 1 
       bild = bilds[0]
    else 
       bild =  bilds[rand(0..bilds.length-1)]
    end
        create_pass(u.id,profile_id,bild,profile)
        
  end
end
elsif ENV["RAILS_ENV"] == "production"
User.all.destroy_all
Pass.all.destroy_all
Bilding.all.destroy_all
Profile.all.destroy_all

BILDS = ["37","41","42","43"," "]
BILDS.each do |bild|

   Bilding.create(name: bild) unless bild == " "
end
User.create(email: 'a234234v@mpmz.ru' , 
            password: "password1", 
            password_confirmation: "password1",
            password_name: "password1",
            admin: true)

User.create(email: 'poplav@center.ru' , 
            password: "password1", 
            password_confirmation: "password1",
            password_name: "password1",
            admin: "true")

User.create(email: 'info@gmail.com' , 
            password: "password1", 
            password_confirmation: "password1",
            password_name: "password1",
            admin: "true")
end
