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

set -e

# Root directory containing the language subdirectories. Can be overridden by
# setting LANG_ROOT before invoking this script.
ROOT_DIR="${LANG_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"

# Compiler/interpreter commands. Each can be overridden via environment
# variables. Defaults assume a typical Linux installation with the tools
# available on the PATH.
: "${C_GCC:=gcc}"
: "${C_CLANG:=clang}"
: "${CLOJURE:=clojure}"
: "${COFFEE:=coffee}"
: "${NODE:=node}"
: "${DMD:=dmd}"
: "${DART:=dart}"
: "${DART2JS:=dart2js}"
: "${ERLC:=erlc}"
: "${ERL:=erl}"
: "${GO:=go}"
: "${HHVM:=hhvm}"
: "${GHC:=ghc}"
: "${HAXE:=haxe}"
: "${ICONT:=icont}"
: "${ICONX:=iconx}"
: "${IO:=io}"
: "${JAVAC:=javac}"
: "${JAVA:=java}"
: "${LUA:=lua}"
: "${LUAC:=luac}"
: "${OCAMLC:=ocamlc}"
: "${OCAML:=ocaml}"
: "${PERL:=perl}"
: "${PHP:=php}"
: "${PYTHON:=python}"
: "${PYTHON3:=python3}"
: "${RUBY:=ruby}"
: "${RUSTC:=rustc}"
: "${SCALAC:=scalac}"
: "${SCALA:=scala}"

echo "--> Testing C with gcc..."
$C_GCC "$ROOT_DIR/c/test.c" -o "$ROOT_DIR/c/gcc-test"
"$ROOT_DIR/c/gcc-test"
echo "--> Testing C with clang..."
$C_CLANG "$ROOT_DIR/c/test.c" -o "$ROOT_DIR/c/clang-test"
"$ROOT_DIR/c/clang-test"

echo "--> Testing Clojure..."
$CLOJURE "$ROOT_DIR/clojure/test.clj"

echo "--> Testing Coffee-Script..."
echo "-> Compiling to JS..."
$COFFEE --compile "$ROOT_DIR/coffeescript/test.coffee"
$NODE "$ROOT_DIR/coffeescript/test.js"
echo "-> Running interpreted..."
$COFFEE "$ROOT_DIR/coffeescript/test.coffee"

echo "--> Testing D with dmd..."
cd "$ROOT_DIR/d/"
$DMD "$ROOT_DIR/d/test.d"
"$ROOT_DIR/d/test"
cd "$ROOT_DIR"

echo "--> Testing Dart interpreted..."
$DART "$ROOT_DIR/dart/test.dart"
echo "--> Testing Dart2JS with node..."
$DART2JS --out="$ROOT_DIR/dart/test.js" "$ROOT_DIR/dart/test.dart"
$NODE "$ROOT_DIR/dart/test.js"

echo "--> Testing Erlang..."
$ERLC -o "$ROOT_DIR/erlang/" "$ROOT_DIR/erlang/test.erl"
cd "$ROOT_DIR/erlang/"
$ERL -noshell -s test start -s init stop
cd "$ROOT_DIR"

echo "--> Testing Go..."
echo "-> interpreted..."
$GO run "$ROOT_DIR/go/test.go"
echo "-> compiled..."
cd "$ROOT_DIR/go/"
$GO build "$ROOT_DIR/go/test.go"
"$ROOT_DIR/go/test"
cd "$ROOT_DIR"

echo "--> Testing Hack with HHVM..."
# if -f .hhconfig in its directory, OK
$HHVM "$ROOT_DIR/hack/test.hh"

echo "--> Testing Haskell with ghc..."
$GHC -w -O2 "$ROOT_DIR/haskell/Test.hs"
"$ROOT_DIR/haskell/Test"

echo "--> Testing Haxe..."
#echo "HAXE NEEDS MORE WORK"
# http://im.discoveringhaxe.com/discovery/discovering-how-to-install-haxe-on-ubuntu-14-04/
# http://old.haxe.org/doc/build/haxe_ubuntu_build
cd "$ROOT_DIR/haxe/"
$HAXE "$ROOT_DIR/haxe/compile.hxml"
cd "$ROOT_DIR"

echo "--> Testing Icon with icont..."
cd "$ROOT_DIR/icon/"
$ICONT -s test
"$ROOT_DIR/icon/test"
cd "$ROOT_DIR"

echo "--> Testing Icon with iconx..."
cd "$ROOT_DIR/icon/"
$ICONX test
cd "$ROOT_DIR"

echo "--> Testing Io..."
$IO "$ROOT_DIR/io/test.io"

echo "--> Testing Java..."
cd "$ROOT_DIR/java/"
$JAVAC "$ROOT_DIR/java/Test.java"
$JAVA Test
cd "$ROOT_DIR"

echo "--> Testing JavaScript with node.js..."
$NODE "$ROOT_DIR/javascript/test.js"

echo "--> Testing Lua with lau..."
$LUA "$ROOT_DIR/lua/test.lua"
echo "--> Testing Lua with luac..."
$LUAC -o "$ROOT_DIR/lua/test.luac" "$ROOT_DIR/lua/test.lua"
$LUA "$ROOT_DIR/lua/test.luac"

echo "--> Testing OCaml with ocamlc..."
$OCAMLC -o "$ROOT_DIR/ocaml/test" "$ROOT_DIR/ocaml/test.ml"
"$ROOT_DIR/ocaml/test"

echo "-> with ocaml..."
$OCAML "$ROOT_DIR/ocaml/test.ml"

echo "--> Testing Perl..."
$PERL "$ROOT_DIR/perl/test.pl"

echo "--> Testing PHP with PHP 5.6.4..."
$PHP "$ROOT_DIR/php/test.php"
echo "--> Testing PHP with HHVM..."
$HHVM "$ROOT_DIR/php/test.php"

echo "--> Testing Python 2.7.9..."
$PYTHON "$ROOT_DIR/python/test.py"

echo "--> Testing Python 3.4.3..."
$PYTHON3 "$ROOT_DIR/python/test.py"

echo "--> Testing Ruby 2.2.3..."
$RUBY "$ROOT_DIR/ruby/test.rb"

echo "--> Testing Rust with rustc..."
cd "$ROOT_DIR/rust/"
$RUSTC "$ROOT_DIR/rust/test.rs"
"$ROOT_DIR/rust/test"
cd "$ROOT_DIR"

echo "--> Testing Scala..."
cd "$ROOT_DIR/scala/"
$SCALAC Test.scala
$SCALA Test


echo "DONE!"
exit 0

