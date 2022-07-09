# Müller method

Uso del método de Müller para obtener la raíz de una función dados 3 valores iniciales.

Tomando una función de tipo: 

```ax^n+bx^(n-1)+...+yx+z```

donde:
- a, b, ..., z son coeficientes de la función
- x son 3 valores iniciales (x_0, x_1, x_2)

## Pasos
La función se evalúa como:
```python
for i in range(3):
    f[i] = a*x[i]^n + b*x[i]^(n-1) + ... + z*x[i]
``` 
Datos que son necesarios para obtener los valores de δ:

    δ_i = ( f[2] - f[0] ) / ( f[1] - f[0] )

para obtener los valores de **a**, **b** y **c** se necesita la diferrencia de los valores de x_0, x_1 y x_2:

    Δx_0 = x_1 - x_0
    Δx_1 = x_2 - x_1

    a = (δ_1 - δ_0) / (Δx_0 + Δx_1)
    b = a * Δx_1 / δ_1
    c = f[2]

Con los valores anteriormente obtenidos se puede obtener la raíz de la función:

``` x_3 = x_2 + (-2c)/ (b +/- sqrt(b^2-4ac)) ```

Estos pasos se repetirán hasta que la diferencia entre los valores de x_3 y x_2 / x_3 sea mínimo.

Si esta diferencia no es mínima, se intercambian los valores de x_0, x_1 y x_2:

```
x_0 = x_1
x_1 = x_2
x_2 = x_3
```

### [Polinomios de grado 3](x^3.sce)
```
Factor 1, para x^3: 1 
 
Factor 2, para x^2: 0 
 
Factor 3, para x^1: -13 
 
Factor 4, para x^0: -12 
 
Valor inicial x1: 4.5 
 
Valor inicial x2: 5.5 
 
Valor inicial x3: 5 
 

1x^3 - 13x^1 - 12x^0

Iteraciones:    4
x_r:            4.000000
```
