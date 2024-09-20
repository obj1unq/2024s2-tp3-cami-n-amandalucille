import cosas.*

object camion {
	const     pesoMaximo = 2500
	const           tara = 1000 
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.sufrirConsecuencia()
	}
	method descargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method todoPesoPar(){
		return cosas.all({cosa => (cosa.peso() % 2) == 0})
	}
	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}	
	method elDeNivel(nivel){
		return cosas.find({ cosa => cosa.nivelPeligrosidad() == nivel })
	}
	method pesoTotal(){
		return cosas.peso() + tara
	}
	method excedidoDePeso(){
		return self.pesoTotal() > pesoMaximo
	}
	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}
	method objetosMasPeligrososQue(elemento){
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > elemento.nivelPeligrosidad() })
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return (not self.excedidoDePeso()) && cosas.all({cosa => cosa.nivelDePeligrosidad() < nivelMaximoPeligrosidad })
		//(cosas.none({ cosa => self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).contains(cosa)})) // #reutilizando. si alguna de las cosas del conjunto esta contenida en el conjunto que devuelve el metdo "objetosQueSuperanPeligrosidad"
	}	

	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({ cosa => cosa.peso() >= min &&  cosa.peso() <= max})
	}

	method cosaMasPesada(){
		return cosas.find({cosa => cosa.peso() == self.pesoDelMasPesado() })
	}
	method pesoDelMasPesado(){
		return cosas.max({cosa => cosa.peso()})
	}
	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
	method totalBultos(){
		return cosas.sum({cosa=> cosa.bultoQueGenera() })
	} 

	method transportar(destino,camino){

	}
}

object almacen{
	const property contenido = #{}
	const property bultosMaximos = 3
	

}

object ruta9{

	method nivelPeligrosidad(){
		return 11
	}
}

object caminoVecinal {
	var property pesoMaximo = 0

}





