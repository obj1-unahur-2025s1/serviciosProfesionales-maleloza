class ProfesionalDeUniversidad {
  var property universidad
  method honorarios() = universidad.honorariosRecomendados()
  method provinciasEnLasQuePuedeTrabajar() = #{universidad.provincia()}
  method cobrar(monto) = universidad.recibirDonacion(monto / 2)
}

class ProfesionalDelLitoral {
  var property universidad
  method honorarios() = 3000
  method provinciasEnLasQuePuedeTrabajar() = #{entreRios, santaFe, corrientes}
  method cobrar(monto) = asocioacionDeProfesionalesDelLitoral.recibirDonacion(monto)
}

class ProfesionalLibre {
  var property universidad
  var property honorarios
  var property provincias
  var dinero = 0
  method sumarProvincia(unaProvincia) = provincias.add(unaProvincia)
  method cobrar(monto) = dinero += monto
  method pasarDinero(monto, profesional) {
    dinero -= monto
    profesional.cobrar(monto)
  } 
}

class Universidad {
  var property provincia
  var property honorariosRecomendados
  var donaciones = 0
  method recibirDonacion(monto){
    donaciones += monto
  }
}

class Empresa {
  const trabajadores = #{}
  var property honorarioDeReferencia
  const clientes = #{}
  method cuantosEstudiaronEn(universidad) = trabajadores.filter({t => t.universidad() == universidad})
  method profesionalesCaros() = trabajadores.filter({t => t.honorarios()>honorarioDeReferencia})
  method universidadesFormadoras() = trabajadores.map({e => e.universidad()}).asSet()
  method profesionalMasBarato() = trabajadores.min({t => t.honorarios()})
  method genteAcotada() = trabajadores.any({t => t.provinciasEnLasQuePuedeTrabajar().size() <= 3})
  method añadirTrabajador(trabajador) = trabajadores.add(trabajador)
  method puedeSatisfacerA(unSolicitante) = unSolicitante.puedeSeratendidoPor(trabajadores.any())
  method darServicio(unSolicitante) {
    if (self.puedeSatisfacerA(unSolicitante)) {
      const unProfesional = trabajadores.find({t => unSolicitante.puedeSerAtendidoPor(t)})
      unProfesional.cobrar(unProfesional.honorarios())
      clientes.add(unSolicitante)
    }
  }
  method cantidadDeClientes() = clientes.size()
  method esCliente(unCliente) = clientes.contains(unCliente)
  method esProfesionalPocoAtractivo(unProfesional) {
    const provinciasDelProfesional = unProfesional.provincias()
    return unProfesional.provinciasEnLasQuePuedeTrabajar().all({prov => self.hayOtroTrabajadorMasBaratoQueCubra(prov, unProfesional)})
  }
  method hayTrabajadorMasBaratoQueCubra(provincia, unProfesional) {
    return trabajadores.any({t =< t.provinciasEnLasQuePuedeTrabajar().contains(provincia) && t.honorarios() < unProfesional.honorarios()})
  }
}

object asocioacionDeProfesionalesDelLitoral {
  var donaciones = 0
  method recibirDonacion(monto){
    donaciones += monto
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

class Persona {
  var property provincia
  method puedeSerAtendidoPor(unProfesional) = unProfesional.provinciasEnLasQuePuedeTrabajar().contains(provincia) 
}

class Institucion {
  var property universidadesQueReconoce
  method puedeSerAtendidoPor(unProfesional) = unProfesional.universidad()
}

class Club {
  var property provincias
  method puedeSerAtendidoPor(unProfesional) = !provincias.intersection(unProfesional.provinciasEnLasQuePuedeTrabajar().isEmpty())
}