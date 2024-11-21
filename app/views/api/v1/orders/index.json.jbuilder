
json.data do
  json.orders @orders
end

json.partial! 'shared/pagination'
json.status_code RESPONSE_STATUS_CODES[:ok]
json.message "Successfully fetch Records"
