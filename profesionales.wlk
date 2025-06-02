import universidad.*

class ProfesionalDeUniversidad {
  var property universidad
  method honorarios() = universidad.honorariosRecomendados()
  method provinciasEnLasQuePuedeTrabajar() = #{universidad.provincia()}
  method cobrar(monto) { universidad.recibirDonacion(monto / 2) }
}

class ProfesionalDelLitoral {
  var property universidad
  method honorarios() = 3000
  method provinciasEnLasQuePuedeTrabajar() = #{entreRios, santaFe, corrientes}
  method cobrar(monto) { asocioacionDeProfesionalesDelLitoral.recibirDonacion(monto) }
}

class ProfesionalLibre {
  var property universidad
  var property honorarios
  var property provincias
  var dinero = 0
  method sumarProvincia(unaProvincia) = provincias.add(unaProvincia)
  method cobrar(monto) { dinero += monto }
  method pasarDinero(monto, profesional) {
    dinero -= monto
    profesional.cobrar(monto)
  } 
}


////////////////////////////////////////////////////////////

object cordoba {

}

object entreRios {
  
}

object santaFe {
  
}
object buenosAires {

}

object corrientes {

}

object misiones {

}

////////////////////////////////////////////////////////////

