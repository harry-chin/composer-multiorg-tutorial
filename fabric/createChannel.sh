echo "Creating channel"
CORE_PEER_ADDRESS=peer0.grower.itrazo.com:7051
CORE_PEER_LOCALMSPID=GrowerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/grower.itrazo.com/users/Admin@grower.itrazo.com/msp

peer channel create -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/mainchannel.tx

sleep 2

echo "Joining peers"
peer channel join -b mainchannel.block

# CORE_PEER_ADDRESS=peer1.grower.itrazo.com:7051
# peer channel join -b mainchannel.block

CORE_PEER_LOCALMSPID=NinemileMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/ninemile.itrazo.com/users/Admin@ninemile.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.ninemile.itrazo.com:7051
peer channel join -b mainchannel.block

echo "Updating anchor peers"
CORE_PEER_LOCALMSPID=GrowerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/grower.itrazo.com/users/Admin@grower.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.grower.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/GrowerMSPanchors.tx

CORE_PEER_LOCALMSPID=NinemileMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/crypto-config/peerOrganizations/ninemile.itrazo.com/users/Admin@ninemile.itrazo.com/msp
CORE_PEER_ADDRESS=peer0.ninemile.itrazo.com:7051
peer channel update -o orderer.itrazo.com:7050 -c mainchannel -f ./channel/NinemileMSPanchors.tx

# CORE_PEER_LOCALMSPID=FillerMSP
# CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/filler.itrazo.com/users/Admin@filler.itrazo.com/msp
# CORE_PEER_ADDRESS=peer0.filler.itrazo.com:7051
# peer channel update -o orderer.itrazo.com:7050 -c channel1 -f ./artifacts/channel/FillerMSPanchors.tx

# CORE_PEER_LOCALMSPID=DistributorMSP
# CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/distributor.itrazo.com/users/Admin@distributor.itrazo.com/msp
# CORE_PEER_ADDRESS=peer0.distributor.itrazo.com:7051
# peer channel update -o orderer.itrazo.com:7050 -c channel1 -f ./artifacts/channel/DistributorMSPanchors.tx

# CORE_PEER_LOCALMSPID=RetailerMSP
# CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/retailer.itrazo.com/users/Admin@retailer.itrazo.com/msp
# CORE_PEER_ADDRESS=peer0.retailer.itrazo.com:7051
# peer channel update -o orderer.itrazo.com:7050 -c channel1 -f ./artifacts/channel/RetailerMSPanchors.tx
