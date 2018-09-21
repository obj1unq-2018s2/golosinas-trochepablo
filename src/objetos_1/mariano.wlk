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
	method preciosCuidados() = golosinasCompradas.all{p => p.precio() <= 10} 
	method golosinaDeSabor(unSabor) = golosinasCompradas.find{p => p.gusto() == unSabor}
	method golosinasDeSabor(unSabor) = golosinasCompradas.filter{p => p.gusto() == unSabor}
	method sabores(){
		return golosinasCompradas.map{ g => g.gusto()}.withoutDuplicates()
	}
	method golosinaMasCara() = golosinasCompradas.max{p => p.precio()}
	method pesoGolosinas() = golosinasCompradas.sum{p => p.peso()}
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.difference(golosinasCompradas)
	method gustosFaltantes(gustosDeseados) = gustosDeseados.difference(self.sabores())
}

