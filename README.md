### Motivation

- This work was completed as the final project for the AE280 course.
- This project implements a drawing machine inspired by the principles explained in the [3Blue1Brown YouTube](https://www.youtube.com/watch?v=r6sGWTCMz2k)

### Structure of Code

- `main.m`
The main file of the project.
When you want to run the code, open this file and run it.

(1) Upload the image

(2) Make the set of all black points by `make_Black_Point.m`

(3) Connect each points by `make_Path.m`

(4) Generates the coefficient matrix *coeff* by `coeff_cal.m`

(5) Plot the Fourier Transform Drawing

- `make_Black_Point.m`

Find the whole 'black point', which should be contained our final path. 
The criteria for regarding some points as 'black' is '#000000' only, to make our final path clearer.

- `make Path.m`

Connect the given whole black points with respect to the distance.

- `coeff cal.m`

Calculate the each coefficients Using trapezoidal numerical integration.

- `draw_obj.m`

Convert the path of black points with order to the complex function with respect to time.

- `F_matrix.m`

Find the position of each epicycles and line, we calculate the summation of $c_n exp{2πint}$, where $0 \leq n \leq N$.