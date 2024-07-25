# Lyta
![alt text](https://github.com/Nondescrypt/lyta/main/test.ppm?raw=true)
## About
Lyta will be a simple raytracer. 
The design will loosely follow _The Raytracer Challenge_ book [1]. 

:warning: Don't take this code seriously. This a warmup exercise, following someone else's "narrative" in a stepwise fashion and not a coherent vision of my own.
My Julia code is not idiomatic, not optimal, and in many cases not even correct. It is intended to be thrown away.  

## License
Lyta is provided under a BSD 3-clause license. See LICENSE file.

## Development
Lyta is not a registered Julia package[2] -- yet!

```
> git clone https://github.com/Nondescrypt/lyta.git
> julia                 # smash ] to open the Julia pkg manager
pkg> activate ./lyta    
pkg> build
pkg> test
# backspace to return to the julia prompt
julia> import Lyta
julia> Lyta.greet()     # should output the greeting text
```
## References
1 _The Raytracer Challenge_ by J. Buck, Pragmatic Press, 2019.  
2 https://pkgdocs.julialang.org/v1/creating-packages



