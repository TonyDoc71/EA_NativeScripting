cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "27930198400ce9027245f4bab187ed6350afd3e8b8e018c27334d42d760f24cb#2" \
  --tx-in "4cc6a67111571267b30b146f818256e797004aa8592abb11b62dbf5d77bead47#0" \
  --tx-out "addr_test1qra8rx05s9dv4690meheacnnjhs6uj49x24jmtp76e9c2ylede7uzn8enzys93d8735fa93ltmnpnp578vkhkf37a7eqwqcecv"+"200000000" \
  --change-address "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt" \
  --protocol-params-file protocol.params \
  --out-file multisig.unsigned

cardano-cli transaction sign \
    --tx-body-file multisig.unsigned \
    --signing-key-file ../WalletMine/ent107.skey \
    --signing-key-file ../WalletMine/payment1.skey \
    --testnet-magic 2 \
    --out-file multisig.signed

 cardano-cli transaction submit \
    --testnet-magic 2 \
    --tx-file multisig.signed



## roberto's wallet
## addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt