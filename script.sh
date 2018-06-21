CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
CORE_PEER_LOCALMSPID="Org1MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
CORE_PEER_ADDRESS=peer$1.org1.example.com:7051

peer channel fetch 0 genesis_block.pb -o orderer.example.com:7050 -c "mychannel" 
res=$?
if [ $res -ne 0 ] ; then
        exit 1

sleep 5
echo "block fetched"

peer channel join -b genesis_block.pb
echo "channel joined"