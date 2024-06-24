class Viajes{
	const property idiomas = #{}
	method  implicaEsfuerzo()
	method sirveParaBroncearse()
	method cuantosDias()
	method esInteresante() = idiomas.size() >1
	method esInteresantePara(unSocio) = self.esInteresante() and unSocio.leAtrae(self)and not unSocio.realizoActividad(self)
}

class ViajesDePlaya inherits Viajes{
	var property largo = 0
	
	override method cuantosDias()=
		 largo/500
	
	override method implicaEsfuerzo()=
		 largo > 1200
	
	override method sirveParaBroncearse()= true
	
}

class ExcursionACiudad inherits Viajes{
	var property cantidadDeAtracciones = 0
	
	override method cuantosDias() =
		 cantidadDeAtracciones / 2
	
	override method implicaEsfuerzo()=
		 cantidadDeAtracciones.between(5,8)
	
	override method esInteresante() =
		 super() or cantidadDeAtracciones == 5
	
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method cuantosDias()=
		super() + 1
	
	override method sirveParaBroncearse() {
		return true
	}
}

class SalidaTrekking inherits Viajes{
	var property kilometrosPorSendero = 0
	var property diasConSol = 0
	
	override method cuantosDias(){
		return kilometrosPorSendero / 2
	}
	override method sirveParaBroncearse() {
		return (diasConSol > 200) or (diasConSol.between(100,200) and kilometrosPorSendero > 120)
	}
	override method esInteresante()=
		 super() and diasConSol > 140
	
	override method implicaEsfuerzo() = kilometrosPorSendero > 80
	
}

class ClaseDeGimnasia inherits Viajes{
	override method idiomas() = "español"
	override method cuantosDias()= 1
	override method implicaEsfuerzo() = true
	override method esInteresantePara(unSocio) = unSocio.edad().between(20,30)
	override method sirveParaBroncearse() = false
}

