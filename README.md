🎮 TheGame – Smart Contract en Solidity

TheGame es un smart contract sencillo desarrollado en Solidity que implementa un juego de adivinanza. Los jugadores intentan adivinar un número secreto y el primero en acertar gana el juego.

📜 Descripción

El contrato define un número secreto al momento de su despliegue.

Los jugadores pueden llamar a la función guess() para intentar adivinarlo.

El juego termina cuando un jugador acierta el número.

Se registra:

El ganador

El total de intentos

Los intentos por dirección

Se emiten eventos para facilitar el seguimiento del juego desde el frontend o herramientas externas.

⚙️ Especificaciones Técnicas

Lenguaje: Solidity

Versión: 0.8.24

Licencia: LGPL-3.0-only

🧱 Estructura del Contrato
Variables de Estado
Variable	Tipo	Descripción
secretNumber	uint8 (privado)	Número que los jugadores deben adivinar
gameFinished	bool	Indica si el juego ha terminado
winner	address	Dirección del jugador ganador
totalAttempts	uint8	Número total de intentos realizados
attempts	mapping(address => uint8)	Cantidad de intentos por jugador
📢 Eventos
event GuessMade(address player, uint8 number);
event GameWon(address winner);


GuessMade: Se emite cada vez que un jugador hace un intento.

GameWon: Se emite cuando un jugador adivina correctamente el número.

🛠️ Constructor
constructor(uint8 _secretNumber)


Inicializa el contrato con un número secreto.

El juego comienza en estado activo (gameFinished = false).

🎯 Función Principal
guess(uint8 _number)

Permite a un jugador intentar adivinar el número secreto.

Comportamiento:

Rechaza llamadas si el juego ya terminó.

Incrementa los contadores de intentos.

Emite el evento GuessMade.

Si el número es correcto:

Finaliza el juego

Registra al ganador

Emite el evento GameWon

🚀 Ejemplo de Uso

Desplegar el contrato pasando el número secreto al constructor.

Los jugadores llaman a guess(uint8) desde sus wallets.

El primer jugador que acierta gana.

El estado del contrato refleja automáticamente el resultado.

🔒 Consideraciones de Seguridad

El número secreto es privado, pero no es realmente secreto en blockchain (puede inferirse off-chain).

Este contrato es educativo y no debe usarse con fondos reales.

No hay límites de intentos por jugador.

Añadir recompensas en ETH o tokens

Permitir reiniciar el juego
