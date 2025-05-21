class ProfesionalDeUniversidad {
  var universidad
  method universidad() = universidad
  method honorarios() = universidad.honorariosRecomendados()
  method provinciasEnLasQuePuedeTrabajar() = #{universidad.provincia()}
}

class ProfesionalDelLitoral {
  var universidad
  method universidad() = universidad
  method honorarios() = 3000
  method provinciasEnLasQuePuedeTrabajar() = #{entreRios, santaFe, corrientes}
}

class ProfesionalLibre {
  var universidad
  var honorarios
  var provincias
  method universidad() = universidad
  method honorarios() = honorarios
  method provinciasEnLasQuePuedeTrabajar() = provincias
}

class Universidad {
  var provincia
  var honorariosRecomendados

  method honorariosRecomendados() = honorariosRecomendados
  method provincia() = provincia
}

class Empresa {
  var trabajadores 
  var honorarioDeReferencia
  const universidadesFormadoras = #{}
  method cuantosEstudiaronEn(universidad) = trabajadores.filter({t => t.universidad() == universidad})
  method profesionalesCaros() = trabajadores.filter({t => t.honorarios()>honorarioDeReferencia})
  method universidadesFormadoras() = universidadesFormadoras.add(trabajadores.forEach({t => t.universidad()}))
  method profesionalMasBarato() = trabajadores.min({t => t.honorarios()})
  method genteAcotada() = trabajadores.any({t => t.provinciasEnLasQuePuedeTrabajar().size() <= 3})
}

////////////////////////////////////////////////////////////

object entreRios {
  
}

object santaFe {
  
}

object corrientes {
  
}

////////////////////////////////////////////////////////////
