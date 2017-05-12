# Delegate Completion
This is a sample XCode project to demonstrate wrapping a delegate style class in a completion block class.

I was using a library which used a delegate callback function and I wanted to use it
with a completion block. I did not want to create delegate protocols and I wanted 
to use completion blocks which are the more modern approach.

I came up with this solution which creates a wrapper class and converts
the interface to a completion block. 

Feel free to use as you see fit.  If you have questions or suggestions, I am all ears.

# Code
This app gets some text from lipsum.com and displays the result on the screen.

## class Lipsum
This class actually talks to lipsum.com to get the text. When it gets the text
it responds by calling a delegate callback function which the caller must 
implement.

You should pretend that some company gave you this code and that you cannot change it.

## protocol LipsumDelegate
Class Lipsum expects callers will implement this protocol so that they properly implement 
the callback function.

## class LipsumWrapper
This is your wrapper class. It takes the Lipsum class and wraps it. Code that wants
to get lipsum text would now call this class instead of calling Lipsum directly.
The code using LipsumWrapper will be implemented using a completion block.

LipsumWrapper calls Lipsum using a delegate then it calls the completion block.

