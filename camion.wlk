import cosas.*

object camion {
	const     pesoMaximo = 2500
	const           tara = 1000 

	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
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
		return cosas.find({ cosas => cosa.nivelPeligrosidad() == nivel })
	}
	method pesoTotal(){
		return cosa.peso() + tara
	}
	method excedidoDePeso(){
		return self.pesoTotal > pesoMaximo
	}
	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({ cosas => cosa.nivelPeligrosidad() > nivel })
	}
}
