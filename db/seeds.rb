#users
User.find_or_create_by(email: 'admin@example.com') do |user|
    user.password = '123456'
    user.role = 'administrador'
  end
  
  User.find_or_create_by(email: 'op@example.com') do |user|
    user.password = '123456'
    user.role = 'operador'
  end
  
  # # Tipos de equipo
  EquipmentType.find_or_create_by(name: 'Motor a reacción')
  EquipmentType.find_or_create_by(name: 'Motor turbohélice')
  
  # Tipos de mantenimiento
  MaintenanceType.find_or_create_by(name: 'Preventivo')
  MaintenanceType.find_or_create_by(name: 'Correctivo')
  
  # Ciudades
  cities = ['Valparaíso', 'Santiago de Chile', 'Concepción', 'Antofagasta', 'Temuco']
  cities.each do |city_name|
    City.find_or_create_by(name: city_name)
  end
# Crear 10 motores de tipo "Motor a reacción" con el user admin
10.times do |n|
  name = "REAC-#{n + 1}"
  description = "Descripción del Motor a reacción ##{n + 1}"
  photo = 'foto'
  user_id = 1
  equipment_type = EquipmentType.find_by(name: 'Motor a reacción')

  Motor.find_or_create_by(
    name: name,
    description: description,
    photo: photo,
    user_id: user_id,
    equipment_type: equipment_type
  )
end

# Crear 10 motores de tipo "Motor turbohélice" con el user admin
10.times do |n|
  name = "TURBO-#{n + 1}"
  description = "Descripción del Motor turbohélice ##{n + 1}"
  photo = 'foto'
  user_id = 1
  equipment_type = EquipmentType.find_by(name: 'Motor turbohélice')

  Motor.find_or_create_by(
    name: name,
    description: description,
    photo: photo,
    user_id: user_id,
    equipment_type: equipment_type
  )
end
