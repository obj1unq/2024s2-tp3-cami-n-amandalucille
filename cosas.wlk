object knightRider {
	method peso()
	 	{ return 500 }

	method nivelPeligrosidad() 
		{ return 10 }

	method bultoQueGenera(){
		return 1
	}		
}

object bumblebee {
	var estado =  auto
	
	method estado(){
		return estado
	} 

	method peso()
	 	{ return 800 }

	method nivelPeligrosidad() 
		{ 
			return estado.nivelPeligrosidad()  //aca uso el getter estado
		}
	method convertirEnAuto(){  
		estado = auto
	}
	method convertirEnRobot(){
		estado = robot 
	}
	method bultoQueGenera(){
		return 2
	}
}

object auto {
	method nivelPeligrosidad(){
		return 15
	}
}
object robot {
	method nivelPeligrosidad(){
		return 30
	}
}

object paqueteDeLadrillos{
	var property cantDeLadrillos = 0
	
	method peso(){
		return cantDeLadrillos * 2 
	}  
	method nivelPeligrosidad(){
		return 2
	}
	method bultoQueGenera() {
    if (cantDeLadrillos <= 100) {
        return 1
    } else{
		if(cantDeLadrillos <= 300) {
        	return 2
    	} else {return 3}	
	  }
	}
}

object arenaAGranel{
	var property peso = 0

	method nivelPeligrosidad(){
		return 1
	}
	method bultoQueGenera(){
		return 1
	}
}


object bateriaAntiaerea{
	var property estado = paqueteDeMisilesVacio  

	method peso(){
		return 200 + estado.peso()
	}
	method nivelPeligrosidad(){
		return estado.nivelPeligrosidad()
	}
	method bultoQueGenera(){
		return estado.bultoQueGenera()
	}
} 
object paqueteDeMisilesLleno{
	method nivelPeligrosidad(){
		return 100
	}
	method peso(){
		return 0
	}
	method bultoQueGenera(){
		return 2
	}
}

object paqueteDeMisilesVacio{
	method nivelPeligrosidad(){
		return 0
	}
	method peso(){
		return 100
	}
	method bultoQueGenera(){
		return 1
	}
}
object contenedorPortuario{
	const property contenido = #{}

	method cargar(unElemento) {
		contenido.add(unElemento)
	}
	method nivelPeligrosidad() {
   	return contenido.fold(0, { max, elemento => max.max(elemento.nivelPeligrosidad()) })
	}
	method peso(){
		return (contenido.sum({elemento => elemento.peso()})) + 100
	}
	method bultoQueGenera(){
		return 1 + (contenido.sum({elemento => elemento.bultoQueGenera()}))
	}
}
object residuosRadiactivos{
	var property peso = 0

	method nivelPeligrosidad(){
		return 200
	}
	method bultoQueGenera(){
		return 1
	}
}

object embalajeDeSeguridad{
	var property cosaQueEnvuelve = knightRider

	method peso(){
		return cosaQueEnvuelve.peso() 
	} 

	method nivelPeligrosidad(){
		return cosaQueEnvuelve.nivelPeligrosidad() / 2 
	}
	method bultoQueGenera(){
		return 2
	}
} 

