PRC_GEM
=======

Practica Realizada por Merquis Jesus Cruz Veloz y Sergio Martín Santana.

En esta práctica se nos pide realizar la implementación de una Gema Ruby, para trabajar con Matrices densas y Dispersas.

1º Matrices Dispersas.

Para esta clase reutilizaremos código de Practicas anteriores.

2º Matrices Densas.

OPCION A

En este caso usaremos una nueva clase Matrix_d, la cual heredará metodos de la clase madre (Matrix)
y construiremos la nueva variable invalidadndo algunos metodos como el initialize, donde para conseguir las 
especificaciones de este tipo de matrices, cogeremos dos valores:

  - pos = [[1,3],[3,1]]
  - valor = [5,4]

tambien podriamos incluir variables de clase para contabilizar el número de elementos como n_zero

Con esto conseguiremos que guardabdo dos vectores, trabajemos como una matriz, la estructura creada quedaría así.

    ( 0 0 5 )
    ( 0 0 0 )
    ( 4 0 0 )

---------------------------------------------

PRC_GEM
Este repositorio contiene la implementación de una gema ruby para el trabajo de las matrices dispersas y densas.
