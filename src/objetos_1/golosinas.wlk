object bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method gusto() { return "frutilla" }
	method libreGluten() { return true }
}

object alfajor {
	var peso = 300
	
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.4 }
	method gusto() { return "chocolate" }
	method libreGluten() { return false }
}

object caramelo {
	var peso = 5
	
	method precio() { return 1 }
	method peso() { return peso }
	method mordisco() { peso = peso - 1 }
	method gusto() { return "frutilla" }
	method libreGluten() { return true }
}

object chupetin {
	var peso = 7
	
	method precio() { return 2 }
	method peso() { return peso }
	method mordisco() {
		if (self.peso() > 2) {
			peso = peso - (peso * 10 / 100)
		}
	}
	method gusto() { return "naranja" }
	method libreGluten() { return true }
}

object oblea {
	var peso = 250
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { if (peso > 70) peso = peso - (peso * 50 / 100)  else peso = peso - (peso * 25 / 100) }
	method gusto() { return "vainilla" }
	method libreGluten() { return true }
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual

	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	method precio() { return pesoInicial * 0.5 }
	method peso() { return pesoActual }
	method mordisco() { pesoActual = pesoActual - 2 }
	method gusto() { return "chocolate" }
	method libreGluten() { return false }
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() = golosinaInterior.precio() + 2
	method peso() = golosinaInterior.peso() + pesoBanio
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
		//if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { return golosinaInterior.gusto() }
	method libreGluten() = golosinaInterior.libreGluten()
}

object tuttifrutti {
	var peso = 5
	var tieneGluten = false
	var sabores = ["frutilla","chocolate","naranja"]
	var gustoActual
	
	method precio() = if (tieneGluten) 7 else 10
	method peso() { return peso }
	method mordisco() { 
		gustoActual = sabores.first()
		sabores = sabores.drop(1)
		sabores.add(gustoActual)
	}
	method gusto() = gustoActual
	method libreGluten() = tieneGluten
	method asignarGluten(bool) { tieneGluten = bool }
}

