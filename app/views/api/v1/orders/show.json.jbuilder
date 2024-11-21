
json.data do 
  json.order @order
end

json.status_code RESPONSE_STATUS_CODES[:ok]
json.message I18n.t('controllers.fetched.success')
