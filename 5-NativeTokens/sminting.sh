utxoin="ee66499dd5d735c68127554265330e9865f9f4659ec4de1b55dc080cb090d827#0"
policyid=$(cat policy.id)
address="addr_test1qz32zkseq8gz9ygphje3v2tzjggvarfveuzc6pd0age7yumayw8ggdd4v37lthf9pq4tn9pzq2v6njtn8s748wrkw9tqszuju7"
output="10000000"
tokenname=$(echo -n "AnthonyCoin" | xxd -ps | tr -d '\n')
tokenammount="1000"
collateral="c1bf8b38d94b8e00cbb38bf922481898de0304093c95041a3e96f02bcf624042#1"
signerPKH="832bb3d5216092580bb596b6fd35ae845c63adececd7958466ec38a5"


cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in $utxoin \
  --required-signer-hash $signerPKH \
  --tx-in-collateral $collateral \
  --tx-out $address+$output+"$tokenammount $policyid.$tokenname" \
  --change-address "addr_test1qz32zkseq8gz9ygphje3v2tzjggvarfveuzc6pd0age7yumayw8ggdd4v37lthf9pq4tn9pzq2v6njtn8s748wrkw9tqszuju7" \
  --mint "$tokenammount $policyid.$tokenname" \
  --mint-script-file policy.script \
  --invalid-hereafter 41595076 \
  --protocol-params-file protocol.params \
  --out-file sminting.unsigned

cardano-cli transaction sign \
  --tx-body-file sminting.unsigned \
  --signing-key-file ../WalletMine/4payment2.skey \
  --signing-key-file ../WalletMine/5payment3.skey \
  --signing-key-file ../WalletMine/1ent107.skey \
  --testnet-magic 2 \
  --out-file sminting.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file sminting.signed