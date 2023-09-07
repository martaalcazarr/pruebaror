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

  #materiales
  materials = ['Turbinas', 'Sistemas de ignición', 'Sistemas de combustible']
  materials.each do |material_name|
    Material.find_or_create_by(name: material_name)
  end 
  
# Crear 10 motores de tipo "Motor a reacción" con el user admin
10.times do |n|
  name = "REAC-#{n + 1}"
  description = "Descripción del Motor a reacción ##{n + 1}"
  photo = "/uploads/REAC-#{n + 1}.jpg" # Genera la URL de la imagen
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
  photo = "/uploads/TURBO-#{n + 1}.jpg" # Genera la URL de la imagen
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

motores_reac = Motor.where(equipment_type_id: EquipmentType.find_by(name: 'Motor a reacción').id, user_id: 1)

motores_turbo = Motor.where(equipment_type_id: EquipmentType.find_by(name: 'Motor turbohélice').id, user_id: 1)

# Crear 50 mantenimientos para los motores "Motor a reacción" (REAC)
50.times do |n|
  motor_reac = motores_reac.sample 
  maintenance_type = MaintenanceType.all.sample 
  city = City.all.sample 
  date = Faker::Date.between(from: 1.year.ago, to: Date.today) 
  email = Faker::Internet.email 

  maintenance = Maintenance.create(
    motor_name: motor_reac.name,
    date: date,
    email: email,
    motor: motor_reac,
    maintenance_type: maintenance_type,
    city: city
  )

  materials = Material.all.sample(rand(1..3)) 
end

# Crear 50 mantenimientos para los motores "Motor turbohélice" (TURBO)
50.times do |n|
  motor_turbo = motores_turbo.sample 
  maintenance_type = MaintenanceType.all.sample 
  city = City.all.sample 
  date = Faker::Date.between(from: 1.year.ago, to: Date.today) 
  email = Faker::Internet.email 

  maintenance = Maintenance.create(
    motor_name: motor_turbo.name,
    date: date,
    email: email,
    motor: motor_turbo,
    maintenance_type: maintenance_type,
    city: city
  )


  materials = Material.all.sample(rand(1..3)) 
  maintenance.materials << materials
end