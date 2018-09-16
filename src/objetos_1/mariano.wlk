import golosinas.*

object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinasCompradas = []
	method comprar(golosina) { golosinasCompradas.add(golosina) }
	method golosinas() = golosinasCompradas
	method desechar(golosina) = golosinasCompradas.remove(golosina)
	method probarGolosinas() = golosinasCompradas.forEach{m => m.mordisco()} 
	method hayGolosinaSinTACC() = golosinasCompradas.any{g => g.libreGluten()} 
	method preciosCuidados() = golosinasCompradas.all{p => p.precio() > 10} 
	method golosinaDeSabor(unSabor) = golosinasCompradas.find{p => p.gusto() == unSabor}
	method golosinasDeSabor(unSabor) = golosinasCompradas.filter{p => p.gusto() == unSabor}
	method sabores(){
		var naranja = golosinasCompradas.filter{p => p.gusto() == "naranja"}.gusto()
		var chocolate = golosinasCompradas.filter{p => p.gusto() == "chocolate"}.gusto()
		var frutilla = golosinasCompradas.filter{p => p.gusto() == "frutilla"}.gusto()
		return naranja.union(chocolate).union(frutilla)
	}
	method golosinaMasCara() = golosinasCompradas.max{p => p.precio()}
	method pesoGolosinas() = golosinasCompradas.sum{p => p.peso()}
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.difference(golosinasCompradas)
	method gustosFaltantes(gustosDeseados) {
		return gustosDeseados.union(self.sabores())
	}
}

