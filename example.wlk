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
}

class ProfesionalUniversidad inherits Profesional {
  const provincias = [universidad.provincia()] //String
  
  method provincias() = provincias

  override method honorario() = universidad.honorario()

}

class ProfesionalLitoral inherits Profesional {
  const provincias = ["Entre Rios", "Santa Fe", "Corrientes"]
  
  method provincias() = provincias

  override method honorario() = 3000
}

class ProfesionalLibre inherits Profesional {
  const provincias // Lista
  const honorarios

  method provincias() = provincias
  override method honorario() = honorarios
}

class EmpresaServicios {
  const property profesionales = []

  method profesionalesQueEstudian(unaUniversidad) {
    return profesionales.count({prof => prof.universidad() == unaUniversidad})
  }

  method profsConPrecioMasAltos(unHonorario) {
    profesionales.filter({prof => prof.honorario() > unHonorario})
  }

  method conjuntoDeUniversidades() {
    const universidades = #{}
    profesionales.forEach({prof => universidades.add(prof.universidad())})
    return universidades
  }

  method profesionalMasBarato() = profesionales.min({prof => prof.honorario()})

  method esDeGenteAcotada() = profesionales.all({prof => prof.provincias().size() <= 3})
}