#!/usr/bin/env bash
################################################################################
# Test all the things!
#
# I've created this script to run through all of the compilers and interpreters
# that I use on my system. There are so many that it is more practical to cycle
# through them all using this script than to spot check everything. While the
# actual code I run is stored in other directories, these small hello-world
# scripts at least serve to show that the compiler and/or interpreter is up
# and ready to execute.
#
# Obviously, your system won't be set up just like mine, so you can't just run
# this as-is and get the same results I do. I'm more than happy to chat about
# my setup and help you get yours working if you're interested. You can reach
# me at http://davidcanhelp.me/
#
# See https://github.com/macdaddy/polyglot-test
#

echo "--> Testing C with gcc..."
/usr/bin/gcc /root/sandbox/lang/c/test.c -o /root/sandbox/lang/c/gcc-test
/root/sandbox/lang/c/gcc-test
echo "--> Testing C with clang..."
/usr/bin/clang /root/sandbox/lang/c/test.c -o /root/sandbox/lang/c/clang-test
/root/sandbox/lang/c/clang-test

echo "--> Testing Clojure..."
/usr/bin/clojure /root/sandbox/lang/clojure/test.clj

echo "--> Testing Coffee-Script..."
echo "-> Compiling to JS..."
/root/.nvm/versions/node/v0.12.7/bin/coffee --compile /root/sandbox/lang/coffeescript/test.coffee
/root/.nvm/versions/node/v0.12.7/bin/node /root/sandbox/lang/coffeescript/test.js
echo "-> Running interpreted..."
/root/.nvm/versions/node/v0.12.7/bin/coffee /root/sandbox/lang/coffeescript/test.coffee

echo "--> Testing D with dmd..."
cd /root/sandbox/lang/d/
/usr/bin/dmd /root/sandbox/lang/d/test.d
/root/sandbox/lang/d/test
cd /root/sandbox/lang/

echo "--> Testing Dart interpreted..."
/usr/bin/dart /root/sandbox/lang/dart/test.dart
echo "--> Testing Dart2JS with node..."
/usr/lib/dart/bin/dart2js --out=/root/sandbox/lang/dart/test.js /root/sandbox/lang/dart/test.dart
/root/.nvm/versions/node/v0.12.7/bin/node /root/sandbox/lang/dart/test.js

echo "--> Testing Erlang..."
/usr/bin/erlc -o /root/sandbox/lang/erlang/ /root/sandbox/lang/erlang/test.erl
cd /root/sandbox/lang/erlang/
/usr/bin/erl -noshell -s test start -s init stop
cd /root/sandbox/lang/

echo "--> Testing Go..."
echo "-> interpreted..."
/usr/local/go/bin/go run /root/sandbox/lang/go/test.go
echo "-> compiled..."
cd /root/sandbox/lang/go/
/usr/local/go/bin/go build /root/sandbox/lang/go/test.go
/root/sandbox/lang/go/test
cd /root/sandbox/lang/

echo "--> Testing Hack with HHVM..."
# if -f .hhconfig in its directory, OK
/usr/bin/hhvm /root/sandbox/lang/hack/test.hh

echo "--> Testing Haskell with ghc..."
/usr/bin/ghc -w -O2 /root/sandbox/lang/haskell/Test.hs
/root/sandbox/lang/haskell/Test

echo "--> Testing Haxe..."
#echo "HAXE NEEDS MORE WORK"
# http://im.discoveringhaxe.com/discovery/discovering-how-to-install-haxe-on-ubuntu-14-04/
# http://old.haxe.org/doc/build/haxe_ubuntu_build
cd /root/sandbox/lang/haxe/
/root/sandbox/lang/haxe/haxe-3.2.0/haxe /root/sandbox/lang/haxe/compile.hxml
cd /root/sandbox/lang/

echo "--> Testing Icon with icont..."
cd /root/sandbox/lang/icon/
/usr/bin/icont -s test
/root/sandbox/lang/icon/test
cd /root/sandbox/lang/

echo "--> Testing Icon with iconx..."
cd /root/sandbox/lang/icon/
/usr/bin/iconx test
cd /root/sandbox/lang/

echo "--> Testing Io..."
/usr/local/bin/io /root/sandbox/lang/io/test.io

echo "--> Testing Java..."
cd /root/sandbox/lang/java/
/usr/bin/javac /root/sandbox/lang/java/Test.java
/usr/bin/java Test
cd /root/sandbox/lang/

echo "--> Testing JavaScript with node.js..."
/root/.nvm/versions/node/v0.12.7/bin/node /root/sandbox/lang/javascript/test.js

echo "--> Testing Lua with lau..."
/usr/bin/lua /root/sandbox/lang/lua/test.lua
echo "--> Testing Lua with luac..."
/usr/bin/luac -o /root/sandbox/lang/lua/test.luac /root/sandbox/lang/lua/test.lua
/usr/bin/lua /root/sandbox/lang/lua/test.luac

echo "--> Testing OCaml with ocamlc..."
/usr/bin/ocamlc -o /root/sandbox/lang/ocaml/test /root/sandbox/lang/ocaml/test.ml
/root/sandbox/lang/ocaml/test

echo "-> with ocaml..."
/usr/bin/ocaml /root/sandbox/lang/ocaml/test.ml

echo "--> Testing Perl..."
/usr/bin/perl /root/sandbox/lang/perl/test.pl

echo "--> Testing PHP with PHP 5.6.4..."
/usr/bin/php /root/sandbox/lang/php/test.php
echo "--> Testing PHP with HHVM..."
/usr/bin/hhvm /root/sandbox/lang/php/test.php

echo "--> Testing Python 2.7.9..."
/usr/bin/python /root/sandbox/lang/python/test.py

echo "--> Testing Python 3.4.3..."
/usr/bin/python3 /root/sandbox/lang/python/test.py

echo "--> Testing Ruby 2.2.3..."
/usr/bin/ruby /root/sandbox/lang/ruby/test.rb

echo "--> Testing Rust with rustc..."
cd /root/sandbox/lang/rust/
/usr/local/bin/rustc /root/sandbox/lang/rust/test.rs
/root/sandbox/lang/rust/test
cd /root/sandbox/lang/

echo "--> Testing Scala..."
cd /root/sandbox/lang/scala/
/root/sandbox/lang/scala/scala-2.11.7/bin/scalac Test.scala
/root/sandbox/lang/scala/scala-2.11.7/bin/scala Test


echo "DONE!"
exit 0

