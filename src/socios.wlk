import example.*

class Socio{
	const property actividades=[]
	const property maximoActividades = 0
	var property edad = 0
	const property idiomas = #{}
	
	method esAdoradorDelSol(){
		return actividades.all({act=>act.sirveParaBroncearse()})
	}
	method actividadesEsforzadas(){
		return actividades.filter({act=>act.implicaEsfuerzo()})
	}
	method realizarActividad(unaActividad){
		if (actividades.size() ==unaActividad ){
			self.error("maximo de acts alcanzado")
		}
		actividades.add(unaActividad)
		
	}
	method leAtrae(unaActividad)
	method realizoActividad(unaActividad) = actividades.contains(unaActividad)
}

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActividad) = unaActividad.cuantosDias() >= 4
		
}
class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad){
		return if (self.esAdoradorDelSol())unaActividad.sirveParaBroncearse() else unaActividad.implicaEsfuerzo()
	}
}

class SocioRelajado inherits Socio{
	override method leAtrae(unaActividad) = not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}

