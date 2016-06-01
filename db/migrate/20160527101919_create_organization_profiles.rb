class CreateOrganizationProfiles < ActiveRecord::Migration
  def change
    create_table :organization_profiles do |t|
      t.string :inn
      t.string :address_value
      t.string :kpp
      t.string :management_name #ФИО руководителя
      t.string :management_post #Должность руководителя
      t.string :name_full_with_opf #Полное наименование с ОПФ
      t.string :name_short_with_opf #Краткое наименование с ОПФ
      t.string :name_latin #Наименование на латинице
      t.string :name_full #Полное наименование
      t.string :name_short #Краткое наименование
      t.string :ogrn #ОГРН
      t.string :okved #Код ОКВЭД
      t.string :opf_code #Код ОКОПФ
      t.string :opf_full #Полное название ОПФ
      t.string :opf_short # Краткое название ОПФ
      t.datetime :state_actuality_date #Дата актуальности сведений
      t.datetime :state_registration_date #Дата регистрации
      t.datetime :state_liquidation_date #Дата ликвидации
      t.string :state_status # Статус организации ACTIVE — действующая; LIQUIDATING — ликвидируется; LIQUIDATED — ликвидирована.
      t.string :org_type #Тип организации LEGAL — юридическое лицо; INDIVIDUAL — индивидуальный предприниматель.

      t.belongs_to :organization_account, index: true
      t.timestamps null: false
    end
  end
end
