import profesionales.*

class Persona {
  var property provincia
  method puedeSerAtendidoPor(unProfesional) = unProfesional.provinciasEnLasQuePuedeTrabajar().contains(provincia) 
}

class Institucion {
  var property universidadesQueReconoce
  method puedeSerAtendidoPor(unProfesional) = universidadesQueReconoce.contains(unProfesional.universidad())
}

class Club {
  var property provincias
  method puedeSerAtendidoPor(unProfesional) = !provincias.intersection(unProfesional.provinciasEnLasQuePuedeTrabajar().isEmpty())
}