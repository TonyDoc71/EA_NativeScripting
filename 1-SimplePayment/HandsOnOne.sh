cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "6a2d6721fde0880c0e9eaa267eb038f0abce7462b915dad0cc903299053922b6#0" \
  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+"5000000 + 500 adfa35cc50c56a468394676d202c31194d3cd5197df266b6ed811def.416e74686f6e79436f696e" \
  --change-address "addr_test1qz32zkseq8gz9ygphje3v2tzjggvarfveuzc6pd0age7yumayw8ggdd4v37lthf9pq4tn9pzq2v6njtn8s748wrkw9tqszuju7" \
  --protocol-params-file protocol.params \
  --out-file payment.unsigned

cardano-cli transaction sign \
  --tx-body-file payment.unsigned \
  --signing-key-file ../WalletMine/5payment3.skey \
  --testnet-magic 2 \
  --out-file payment.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file payment.signed