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

  method puedeTrabajar()
}

class ProfesionalUniversidad inherits Profesional {
  const provincia //String

 method provincia() = provincia

  override method honorario() = universidad.honorario()

  override method puedeTrabajar() = self.provincia() == universidad.provincia()
}

class ProfesionalLitoral inherits Profesional {
  const provincias = ["Entre Rios", "Santa Fe", "Corrientes"]
  
  method provincias() = provincias

  override method honorario() = 3000

  override method puedeTrabajar() = provincias.contains(universidad.provincia())
}

class ProfesionalLibre inherits Profesional {
  const provincias // Lista
  const honorarios

  method provincias() = provincias
  override method honorario() = honorarios
}

class EmpresaServicios {
  const property profesionales

  method profesionalesQueEstudian(unaUniversidad) {
    return profesionales.count({prof => prof.universidad() == unaUniversidad})
  }

  method profsConPrecioMasAltos(unHonorario) {
    profesionales.filter({prof => prof.honorario() > unHonorario})
  }

  method universidadesFormadoras() = profesionales.map({prof => prof.universidad()}).asSet()

  method profesionalMasBarato() = profesionales.min({prof => prof.honorario()})
}