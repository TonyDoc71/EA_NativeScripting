cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "27930198400ce9027245f4bab187ed6350afd3e8b8e018c27334d42d760f24cb#0" \
  --tx-in "27930198400ce9027245f4bab187ed6350afd3e8b8e018c27334d42d760f24cb#1" \
  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+"90000000" \
  --tx-out "addr_test1vzpjhv74y9sfykqtkkttdlf446z9ccadankd09vyvmkr3fg5a5acz"+"10000000" \
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



## HandsOn

### Assuming you got 2 addresses, AddressA, and AddressB
### And that Roberto's address is
### addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt



### 1- Send 1100 tADA to Roberto's address 

### 2- Provide value from your AddressA and send five (5) 100tADA UTxOs to your AddressB.

### 3- Provide value from your AddressB and send two(2) 100tADA UTxOs to your AddressA and three(3) 50tADA UTxOs to Roberto's address.

### 4- Take 2 inputs from your AddressA with more than 100tADA and pay to Roberto's Address 90, and your wallet 10, and send the change back to your wallet.