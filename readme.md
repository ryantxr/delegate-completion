# delegate-completion
This is a sample XCode project to demonstrate wrapping a delegate style class in a completion block class.

I was using a library which used a delegate callback function and I wanted to use it
with a completion block. I did not want to create delegate protocols and I wanted 
to use completion blocks which are the more modern approach.

I came up with this solution which creates a wrapper class and converts
the interface to a completion block. 

Feel free to use as you see fit.  If you have questions or suggestions, I am all ears.
