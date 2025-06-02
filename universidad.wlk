class Universidad {
  var property provincia
  var property honorariosRecomendados
  var donaciones = 0
  method recibirDonacion(monto){
    donaciones += monto
  }
}

object asocioacionDeProfesionalesDelLitoral {
  var donaciones = 0
  method recibirDonacion(monto){
    donaciones += monto
  }
}