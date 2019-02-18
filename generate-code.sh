#!/bin/bash

API_DIR="$(dirname "$0")"
GIT_DIR="$API_DIR"/..
FE_DIR="$GIT_DIR/mjolnir-db/src/gen"
BE_DIR="$GIT_DIR/eitri-server"

cd "$API_DIR"

rm -rf "$FE_DIR"
openapi-generator generate -i "$API_DIR/eitri-api.yml" -g typescript-fetch -o "$FE_DIR"

rm -rf "$BE_DIR/src/gen"
openapi-generator generate -i "$API_DIR/eitri-api.yml" -g jaxrs-spec -o "$BE_DIR" -c server-config.json
