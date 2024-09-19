object knightRider {
	method peso()
	 	{ return 500 }

	method nivelPeligrosidad() 
		{ return 10 }
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
}

object arenaAGranel{
	var property peso = 0

	method nivelPeligrosidad(){
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
} 
object paqueteDeMisilesLleno{
	method nivelPeligrosidad(){
		return 100
	}
	method peso(){
		return 0
	}
}

object paqueteDeMisilesVacio{
	method nivelPeligrosidad(){
		return 0
	}
	method peso(){
		return 100
	}
}
