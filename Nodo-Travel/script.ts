document.addEventListener('DOMContentLoaded', function () {
    var catalogo = document.getElementById('catalogo');
    var mostrarSiguienteBtn = document.getElementById('mostrarSiguiente');
    var fotografiaActual = document.getElementById('fotografiaActual');
  
    var fotos = [
      'foto1.jpg',
      'foto2.jpg',
      'foto3.jpg',
      'foto4.jpg',
      // Agrega más nombres de archivos según sea necesario
    ];
  
    var indiceFotoActual = 0;
  
    mostrarSiguienteBtn.addEventListener('click', function () {
      if (indiceFotoActual < fotos.length) {
        var foto = fotos[indiceFotoActual];
        fotografiaActual.innerHTML = '<img src="' + foto + '" alt="Fotografía">';
        indiceFotoActual++;
      } else {
        fotografiaActual.innerHTML = 'No hay más fotografías disponibles.';
      }
    });
  });
  