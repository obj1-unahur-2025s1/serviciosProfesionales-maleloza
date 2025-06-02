import solicitantes.*
import profesionales.*
import universidad.*



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
  method hayTrabajadorMasBaratoQueCubra(provincia, unProfesional) {
    return trabajadores.any({t => t.provinciasEnLasQuePuedeTrabajar().contains(provincia) && t.honorarios() < unProfesional.honorarios()})
  }
  method esProfesionalPocoAtractivo(unProfesional) {
    const provinciasDelProfesional = unProfesional.provincias()
    return unProfesional.provinciasEnLasQuePuedeTrabajar().all({p => self.hayTrabajadorMasBaratoQueCubra(p, unProfesional)})
  }
}