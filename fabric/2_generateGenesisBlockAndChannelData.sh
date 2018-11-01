source ./0_basicExport.sh

echo -e "${FONTCOLOR}# 1/4 Generate Genesis block${NC}"
configtxgen -profile MainOrdererGenesis -outputBlock ./channel/main-genesis.block
echo -e "${FONTCOLOR}# 2/4 CreateChannel${NC}"
configtxgen -profile MainChannel -outputCreateChannelTx ./channel/mainchannel.tx -channelID $CHANNEL_NAME
echo -e "${FONTCOLOR}# 3/4 UpdateAnchorPeer - Grower${NC}"
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channel/GrowerMSPanchors.tx -channelID $CHANNEL_NAME -asOrg Grower
echo -e "${FONTCOLOR}# 4/4 UpdateAnchorPeer - Ninemile${NC}"
configtxgen -profile MainChannel -outputAnchorPeersUpdate ./channel/NinemileMSPanchors.tx -channelID $CHANNEL_NAME -asOrg Ninemile
