cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "8375402a9f9de99bcb6d4df6daea03c6aa2a9786284c7e98836787eaa55aabf4#5" \
  --tx-out "addr_test1vzpjhv74y9sfykqtkkttdlf446z9ccadankd09vyvmkr3fg5a5acz"+"150000000" \
  --tx-out "addr_test1vzpjhv74y9sfykqtkkttdlf446z9ccadankd09vyvmkr3fg5a5acz"+"150000000" \
  --tx-out "addr_test1vzpjhv74y9sfykqtkkttdlf446z9ccadankd09vyvmkr3fg5a5acz"+"150000000" \
  --tx-out "addr_test1vzpjhv74y9sfykqtkkttdlf446z9ccadankd09vyvmkr3fg5a5acz"+"150000000" \
  --tx-out "addr_test1vzpjhv74y9sfykqtkkttdlf446z9ccadankd09vyvmkr3fg5a5acz"+"150000000" \
  --change-address "addr_test1qra8rx05s9dv4690meheacnnjhs6uj49x24jmtp76e9c2ylede7uzn8enzys93d8735fa93ltmnpnp578vkhkf37a7eqwqcecv" \
  --protocol-params-file protocol.params \
  --out-file payment.unsigned

cardano-cli transaction sign \
  --tx-body-file payment.unsigned \
  --signing-key-file ../WalletMine/batch107.skey \
  --testnet-magic 2 \
  --out-file payment.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file payment.signed