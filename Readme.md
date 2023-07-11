# Müller method

Uso del método de Müller para obtener la raíz de una función dados 3 valores iniciales.

Tomando una función de tipo: 

$ax^n+bx^{n-1}+...+yx+z$

donde:
- $a$, $b$, ..., $z$ son coeficientes de la función
- $x$ son 3 valores iniciales ($x_0$, $x_1$, $x_2$)

## Pasos
La función se evalúa usando la ecuación

$f(x_i) = ax_i ^n + bx_i ^{n-1} + ... zx_i$

Datos que son necesarios para obtener los valores de $\delta$:

$\Large {\delta_i = {{ f(x_2) - f(x_0) } \over { f(x_1) - f(x_0) }}}$

para obtener los valores de **a**, **b** y **c** se necesita la diferrencia de los valores de $x_0$, $x_1$ y $x_2$:

$\Delta x_0 = x_1 - x_0$
$\Delta x_1 = x_2 - x_1$

$\Large {a = {{δ_1 - δ_0} \over {\Delta x_0 + \Delta x_1}}}$

$\Large{b = {{a \Delta x_1} \over \delta_1}}$

$\Large{c=f(2)}$


Con los valores anteriormente obtenidos se puede obtener la raíz de la función:

$\Large{x_3 = x_2 + {{-2c}\over{b\pm \sqrt{b^2-4ac}}}}$

Estos pasos se repetirán hasta que la diferencia entre los valores de $x_3$ y $x_2$ / $x_3$ sea mínimo.

Si esta diferencia no es mínima, se intercambian los valores de $x_0$, $x_1$ y $x_2$.

### Ejemplo de uso
```Scilab
	Metodo de müller
f(x) = --> x^3-9x^2+x+(90/%pi)

Valores iniciales: --> 1, 2, 2.2

...

f(x) = (1)x^3 + (-9)x^2 + (1)x + (28.64789)
x0 = (-1.5976471, -1.5976471, -1.5977441)
```
