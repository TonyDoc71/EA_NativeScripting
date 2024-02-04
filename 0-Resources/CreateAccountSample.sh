#Creating keys and accounts (entrerprise and staking adresses)

#Create keys
echo "Creating keys"
mkdir -p ../wallets
cardano-cli address key-gen \
--verification-key-file ../wallets/1enterprise.vkey \
--signing-key-file ../wallets/1enterprise1.skey

cardano-cli stake-address key-gen \
--verification-key-file ../wallets/1staking.vkey \
--signing-key-file ../wallets/1staking.skey

#Create addresses
echo "Creating addresses"
cardano-cli address build \
--payment-verification-key-file ../wallets/1enterprise.vkey \
--stake-verification-key-file ../wallets/1staking.vkey \
--out-file ../wallets/1payment.addr \
--testnet-magic 2


