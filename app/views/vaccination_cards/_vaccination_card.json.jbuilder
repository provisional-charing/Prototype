json.extract! vaccination_card, :id, :vaccination_id, :user_id, :get_date, :injection_type, :dosis_e, :dosis_ml, :typ, :charge_number, :doctor, :test, :reaktion, :created_at, :updated_at
json.url vaccination_card_url(vaccination_card, format: :json)
