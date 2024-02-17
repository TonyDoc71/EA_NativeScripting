cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "4e6e048d8a80650c7d0d525b691ac5980e21f647582bae2fb6002cff48f9c457#0" \
  --change-address "addr_test1qra8rx05s9dv4690meheacnnjhs6uj49x24jmtp76e9c2ylede7uzn8enzys93d8735fa93ltmnpnp578vkhkf37a7eqwqcecv" \
  --metadata-json-file myData.json \
  --protocol-params-file protocol.params \
  --out-file metadataTx.unsigned

cardano-cli transaction sign \
  --tx-body-file metadataTx.unsigned \
  --signing-key-file ../WalletMine/batch107.skey \
  --testnet-magic 2 \
  --out-file metadataTx.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file metadataTx.signed