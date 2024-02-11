cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "27930198400ce9027245f4bab187ed6350afd3e8b8e018c27334d42d760f24cb#5" \
  --tx-out "addr_test1qq2e5wr44m7p92p9ts8cl642hra66rayfz9rp5jx0ycanfj0cmrp6ngfx32dn4l89t6yqkaqwf9hmlu7lwmcflgq0ggsfre70d"+"150000000" \
  --tx-out "addr_test1qq2e5wr44m7p92p9ts8cl642hra66rayfz9rp5jx0ycanfj0cmrp6ngfx32dn4l89t6yqkaqwf9hmlu7lwmcflgq0ggsfre70d"+"150000000" \
  --tx-out "addr_test1qq2e5wr44m7p92p9ts8cl642hra66rayfz9rp5jx0ycanfj0cmrp6ngfx32dn4l89t6yqkaqwf9hmlu7lwmcflgq0ggsfre70d"+"150000000" \
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


  ### 3- Provide value from your AddressB and send two(2) 100tADA UTxOs to your AddressA and three(3) 50tADA UTxOs to Roberto's address.
### And that Roberto's address is
### addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt