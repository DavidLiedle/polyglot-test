# Polyglot (many languages) Test
A script I use on my server to test ALL the things.

## Languages
 * C (using both clang and gcc)
 * Clojure
 * CoffeeScript
 * D
 * Dart
 * Erlang
 * Go
 * Hack
 * Haskell
 * Haxe
 * Icon
 * Io
 * Java
 * JavaScript
 * Lua
 * OCaml
 * Perl
 * PHP
 * Python
 * Ruby
 * Rust
 * Scala

By virtue of the fact that the test script is in BASH, that's being automatically tested as well.

## Usage
Well... *I* use the script by executing `/root/sandbox/lang/test-all.sh`, but that only works
because that BASH script is specifically written for my specific environment.

## Environment
I'm running all of this on a $10/month [DigitalOcean](https://www.digitalocean.com/?refcode=b691120bf5f9) Droplet
with Ubuntu 15.04. A lot of these are either languages that I installed with apt-get or they existed on the droplet
already. Some were custom installed, and a couple (Haxe, Scala) were simply `tar xvf`'d right into
the directory in which I'm running the test.

## Future
I'm planning to change the paths to be variables, making it a bit more portable. I may do something
with Chef to spread the love, and a Docker image would make a lot of sense. If you're interested in
getting all of these languages working together on your system as I have on mine, feel free to reach
out to me at [DavidCanHelp.me](http://davidcanhelp.me/)

I also plan to flesh out the tests from bare-bones hello-worlds to idiomatic stubs that actually
flex the muscles of each language just a wee bit more.

## Why?
Because it's there.

## Really, why?
I was tired of testing each environment with spot checks. Heck, I was tired of trying to remember
where everything was. By putting a simple hello-world test into play for each language, I not only
see whether everything is still working, but also have a quick reminder of how to jump back into
that language/environment and get things going quickly when I need to use one. Mostly it's just a
lot of fun, and relieves stress. If you've ever seen crap-tons of stuff flying past on my second
monitor, that's probably been me monitoring the compilation of one of these languages while I get
my work done. It's a good feeling to have them all working in a single box, and it builds confidence
to know that I can reach for any one of these platforms and instantly get results without having
to go through any configuration or remembering of first steps. Also, it demonstrates that I actually
can get each one working smoothly and consistently over time on my own, so each language I've listed
on my résumé (no, I don't have all of these listed -- just the ones I actually do know how to use in
real-world situations for work) is backed up by proof you can touch with your own two hands. :D
