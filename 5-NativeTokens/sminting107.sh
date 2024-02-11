utxoin="4cc6a67111571267b30b146f818256e797004aa8592abb11b62dbf5d77bead47#3"
policyid=$(cat monetary.pid)
address=$nami
output="5000000"
tokenname=$(echo -n "TonyCoin" | xxd -ps | tr -d '\n')
tokenammount="500"
collateral="4e6e048d8a80650c7d0d525b691ac5980e21f647582bae2fb6002cff48f9c457#0"
signerPKH="58206af50f50f737694134c27c91d9ac1d6dfe65da00ea1aa0d7a9aa07297c2211f3"


cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in $utxoin \
  --required-signer-hash $signerPKH \
  --tx-in-collateral $collateral \
  --tx-out $address+$output+"$tokenammount $policyid.$tokenname" \
  --change-address $Adr01 \
  --mint "$tokenammount $policyid.$tokenname" \
  --mint-script-file policy107.script \
  --invalid-hereafter 41100000 \
  --protocol-params-file protocol.params \
  --out-file sminting107.unsigned

cardano-cli transaction sign \
  --tx-body-file sminting.unsigned \
  --signing-key-file ../../WalletMine/batch107.skey \
  --signing-key-file ../../WalletMine/payment1.skey \
  --testnet-magic 2 \
  --out-file sminting107.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file sminting107.signed