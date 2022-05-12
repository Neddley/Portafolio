import random
import math


def jugar():
    print("¡Bienvenido a Piedra, Papel o Tijera!")
    r = int(input("Dime, al mejor de cuantas rondas quieres jugar (minimo 3)\n"))
    
    puntaje_cpu = 0
    puntaje_jugador = 0
    rondas = math.ceil(r/2)
    
    while puntaje_jugador != rondas and puntaje_cpu != rondas:
        
        usuario = input("Escoge una opción: '1' para piedra, '2' para papel, '3' para tijera.\n").lower()
        computadora = random.choice(['1', '2', '3'])
        opciones = {"1" : "Piedra", "2" : "Papel", "3" : "Tijera"}
        
        if usuario == computadora:
            print(f"Tu y yo hemos escogido {opciones[computadora]}")
            print("¡EMPATE!")
            print(f"Tu llevas {puntaje_jugador} y yo llevo {puntaje_cpu}\n")
            
        elif player_win(usuario, computadora):
            puntaje_jugador += 1
            print(f"Yo he escogido {opciones[computadora]} y tu {opciones[usuario]}")
            print("¡GANASTE!")
            print(f"Tu llevas {puntaje_jugador} y yo llevo {puntaje_cpu}\n")
            
        else:
            print(f"Yo he escogido {opciones[computadora]} y tu {opciones[usuario]}")
            puntaje_cpu += 1
            print("¡PERDISTE!")
            print(f"Tu llevas {puntaje_jugador} y yo llevo {puntaje_cpu}\n")
    
    if puntaje_jugador == rondas:
        print("¡¡Felicidades, has ganado!!")
    else:
        print("Lamentablemente esta vez he ganado yo")
                
   

def player_win(jugador, oponente):
    # Retornar True (verdadero) si gana el jugador.
    if ((jugador == '1' and oponente == '3')
        or (jugador == '3' and oponente == '2')
        or (jugador == '2' and oponente == '1')):
        return True
    return False


print(jugar())