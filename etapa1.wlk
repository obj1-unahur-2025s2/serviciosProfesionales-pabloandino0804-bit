import etapa2.*
class Universidad {
  const provincia
  const honorario
  method provincia() = provincia
  method honorario() = honorario
}
class Profesional {
  const universidad

  method universidad() = universidad

  method honorario()

  method provincias()

  method trabajaEn(unaProvincia) {
    return self.provincias().contains(unaProvincia)
  }
}

class ProfVinculado inherits Profesional {
  const provincias = [universidad.provincia()] //String

  override method honorario() = universidad.honorario()
  
  override method provincias() = provincias
}

class ProfLitoral inherits Profesional {
  const provincias = ["Entre Rios", "Santa Fe", "Corrientes"]

  override method honorario() = 3000

  override method provincias() = provincias
}

class ProfLibre inherits Profesional {
  const honorarios // Numero
  const provincias // Lista

  override method honorario() = honorarios
  
  override method provincias() = provincias
}

class EmpresaServicios {
  const profesionales = []
  const honorarioReferencia

  method profesionales() = profesionales
  method honorarioReferencia() = honorarioReferencia

  method contratar(unEmpleado){
    profesionales.add(unEmpleado)
  }

  method profesionalesQueEstudian(unaUniversidad) {
    return profesionales.count({prof => prof.universidad() == unaUniversidad})
  }

  method profesionalesCaros() = profesionales.filter({prof => prof.honorario() > honorarioReferencia})

  method universidadesFormadoras() {
    const universidades = #{}
    profesionales.forEach({prof => universidades.add(prof.universidad())})
    return universidades
  }

  method profesionalMasBarato() = profesionales.min({prof => prof.honorario()})

  method esDeGenteAcotada() = profesionales.all({prof => prof.provincias().size() <= 3})

  method puedeSatisfacer(solicitante) = profesionales.any({prof => solicitante.PuedeSerAtendido(prof)})
}