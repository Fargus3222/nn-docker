#!/bin/sh

rustc --version || curl https://sh.rustup.rs -sSf | sh
NEXUS_HOME=$HOME./nexus

git clone https://github.com/nexus-xyz/network-api