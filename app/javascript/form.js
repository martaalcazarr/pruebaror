document.addEventListener('DOMContentLoaded', function() {
    const equipmentTypeSelect = document.getElementById('equipment-type-select');
    const maintenanceTypeSelect = document.getElementById('maintenance-type-select');
    const nextButton = document.getElementById('next-button');
    const part1 = document.getElementById('part1');
    const part2 = document.getElementById('part2');
  
    nextButton.addEventListener('click', function() {
      // Validar que se haya seleccionado un tipo de motor y mantenimiento
      if (equipmentTypeSelect.value && maintenanceTypeSelect.value) {
        // Ocultar la primera parte y mostrar la segunda parte
        part1.style.display = 'none';
        part2.style.display = 'block';
      } else {
        alert('Por favor, seleccione un tipo de motor y un tipo de mantenimiento.'); 
      }
    });
  });