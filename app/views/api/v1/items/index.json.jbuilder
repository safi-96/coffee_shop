
json.data do
  json.items @items
end
json.partial! 'shared/pagination'
