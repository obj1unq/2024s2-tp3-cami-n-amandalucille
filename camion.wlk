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
		cosas.remove(unaCosa)
	}
	method todoPesoPar(){
		return cosas.all{cosa => (cosa.peso() % 2) == 0}
	}
	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}	
	method elDeNivel(nivel){
		return cosas.find{ cosa => cosa.nivelPeligrosidad() == nivel}
	}
	method pesoTotal(){
		return cosas.sum{cosa => cosa.peso()} + tara
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
		return (not self.excedidoDePeso()) && cosas.all({cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad })
		//(cosas.none({ cosa => self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).contains(cosa)})) // #reutilizando. si alguna de las cosas del conjunto esta contenida en el conjunto que devuelve el metdo "objetosQueSuperanPeligrosidad"
	}	

	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({ cosa => cosa.peso() >= min &&  cosa.peso() <= max})
	}

	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso() })
	}

	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}
	method totalBultos(){
		return cosas.sum({cosa=> cosa.bultoQueGenera() })
	} 

	method transportar(destino,camino){
		self.validarSipuedeTransportar(destino,camino)
		self.vaciarContenidoEnDestino(destino)		
	}
	method validarSipuedeTransportar(destino,camino){
		if (not self.puedeTransportar(destino,camino)){
			self.error("el camión no puede transportar")
		}
	}
	method puedeTransportar(destino,camino){
		return not (self.excedidoDePeso())
			&& not (destino.cantidadDeBultosMaximosExcedida()) 
			&& self.puedeCircularEnRuta(camino.nivelPeligrosidad())
			&& self.pesoTotal() <= camino.pesoMaximo()
	}
	method vaciarContenidoEnDestino(destino){
		destino.integrarCosasAContenido()
		cosas.clear()	
	}
}

object almacen{
	const property contenido = #{}
	const property bultosMaximos = 3
	
	method integrarCosasAContenido(){
		contenido.addAll(camion.cosas())
	}
	method cantidadDeBultosMaximosExcedida(){
		return camion.totalBultos() > bultosMaximos 
	}
}

object ruta9{
	var property pesoMaximo = 100

	method nivelPeligrosidad(){
		return 11
	}
}

object caminoVecinal {
	var property pesoMaximo = 10

		method nivelPeligrosidad(){
		return 0
	}
}