import etapa1.*

class Persona {
    const provinciaQueVive

    method provinciaQueVive() = provinciaQueVive

    method puedeSerAtendido(unProfesional) = unProfesional.provincias().contains(provinciaQueVive)
}

class Institución {
    const universidades

    method universidades() = universidades

    method puedeSerAtendido(unProfesional) = universidades.contains(unProfesional.universidad())
}

class Club {
    const provincias

    method provincias() = provincias

    method puedeSerAtendido(unProfesional) = provincias.any({provincia => unProfesional.trabajaEn(unaProvincia)})
}