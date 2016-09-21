FactoryGirl.define do
  sequence :inn do |n|
    "#{Faker::Company.swedish_organisation_number}#{n}"
  end

  sequence :kpp do |n|
    "#{n}#{Faker::Company.swedish_organisation_number}"
  end

  factory :organization_profile do
    inn { generate(:inn) }
    address_value "Test address_value"
    kpp { generate(:kpp) }
    management_name "Test management_name"
    management_post "Test management_post"
    name_full_with_opf "test name_full_with_opf" #Полное наименование с ОПФ
    name_short_with_opf "test name_short_with_opf" #Краткое наименование с ОПФ
    name_latin "test name_latin" #Наименование на латинице
    name_full "test name_full" #Полное наименование
    name_short "test name short"#Краткое наименование
    ogrn "test ogrn"#ОГРН
    okved "test okved" #Код ОКВЭД
    opf_code "test opf_code"#Код ОКОПФ
    opf_full "test opf_full"#Полное название ОПФ
    opf_short "test opf_short"# Краткое название ОПФ
    state_actuality_date Time.now #Дата актуальности сведений
    state_registration_date 3.years.ago #Дата регистрации
    state_liquidation_date  "Invalid date" #Дата ликвидации
    state_status "ACTIVE" # Статус организации ACTIVE — действующая; LIQUIDATING — ликвидируется; LIQUIDATED — ликвидирована.
    # org_type "LEGAL"#Тип орг
    organization_account
  end
end
