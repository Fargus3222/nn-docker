#!/bin/sh

(cd ./network-api/clients/cli && cargo run --release --bin prover -- beta.orchestrator.nexus.xyz)