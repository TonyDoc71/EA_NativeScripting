```bash

cardano-cli address key-gen \
--verification-key-file payment3.vkey \
--signing-key-file payment3.skey


cardano-cli stake-address key-gen \
--verification-key-file stake3.vkey \
--signing-key-file stake3.skey

cardano-cli address build \
--payment-verification-key-file payment3.vkey \
--stake-verification-key-file stake3.vkey \
--out-file stake3.addr \
--testnet-magic 2

