### Motivation

[3Blue1Brown YouTube](https://www.youtube.com/watch?v=r6sGWTCMz2k)

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