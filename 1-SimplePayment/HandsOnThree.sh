cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "8375402a9f9de99bcb6d4df6daea03c6aa2a9786284c7e98836787eaa55aabf4#0" \
  --tx-in "8375402a9f9de99bcb6d4df6daea03c6aa2a9786284c7e98836787eaa55aabf4#1" \
  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+"50000000" \
  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+"50000000" \
  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+"50000000" \
  --change-address "addr_test1vzpjhv74y9sfykqtkkttdlf446z9ccadankd09vyvmkr3fg5a5acz" \
  --protocol-params-file protocol.params \
  --out-file payment.unsigned

cardano-cli transaction sign \
  --tx-body-file payment.unsigned \
  --signing-key-file ../WalletMine/ent107.skey \
  --testnet-magic 2 \
  --out-file payment.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file payment.signed


  ### 3- Provide value from your AddressB and send two(2) 100tADA UTxOs to your AddressA and three(3) 50tADA UTxOs to Roberto's address.
### And that Roberto's address is
### addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt