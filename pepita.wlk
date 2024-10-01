import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
		} 
		else if (self.esAtrapada() or self.estaCansada()){
			"pepita-gris.png"
		}
		else {
			"pepita.png"
		}
	}

	method esAtrapada() = self.position() == silvestre.position()

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
		
	}


	method vola(kms) {
		energia = energia - kms * 9
	}

	//El método between verifica si el valor de X está dentro del rango especificado. 
	//En este caso, comprueba si la coordenada X de nuevaPosicion está entre 0 
	//(el borde izquierdo del área de juego) y game.width() - 1 (el borde derecho).
	//lo mismo para Y

	method irA(nuevaPosicion) {
		if(nuevaPosicion.x().between(0, game.width() - 1) && nuevaPosicion.y().between(0, game.height() - 1)) {
			if (self.estaCansada() or self.esAtrapada()) {
				game.schedule(0000, { game.stop() })
		    }
			else {
		        self.vola(position.distance(nuevaPosicion))
		        position = nuevaPosicion
		}	}    
	}


	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method perderAltura() {
      position = position.down(1)
      self.corregirPosicion()
    }

    method corregirPosicion() {
      position = game.at(position.x().max(0).min(game.width()), position.y().max(0).min(game.height()))
    }


}

