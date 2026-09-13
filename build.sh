#!/usr/bin/env sh

set -e

cd /workspaces/zmk/app

build() {
    west build -p always -b nice_nano//zmk -- -DSHIELD="$1" -DZMK_CONFIG="/workspaces/zmk-config/config"
    mv ./build/zephyr/zmk.uf2 "/workspaces/zmk-config/fw/${1}.uf2"
}

build "${1}_left"

build "${1}_right"
