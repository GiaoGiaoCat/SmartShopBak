json.id @prototype.id
json.name @prototype.name
json.option_types @prototype.option_types do |option_type|
  json.id option_type.id
  json.name option_type.name
  json.presentation option_type.presentation
  json.option_values option_type.option_values do |option_value|
    json.extract! option_value, :id, :name, :presentation
  end
end
