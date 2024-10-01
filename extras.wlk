import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"

	method position() = game.at(self.restriccion(),0)

	method restriccion() = pepita.position().x().max(3)

	method teEncontro(ave) {
		game.say(ave, "PERDISTE! BOOO")
		game.schedule(2000, { game.stop() })
	}

}
