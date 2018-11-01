source ./0_basicExport.sh

echo -e "${FONTCOLOR}# 1/6 Finding grower key in keystore${NC}"
export GROWER_KEYSTORE=$(ls ./crypto-config/peerOrganizations/grower.itrazo.com/users/Admin@grower.itrazo.com/msp/keystore/*sk | xargs -n 1 basename)
echo -e "${FONTCOLOR}# 2/6 grower-keystore: '$GROWER_KEYSTORE'${NC}"

echo -e "${FONTCOLOR}# 3/6 Create and Import Grower PeerAdmin cards${NC}"
composer card create\
 -p connection-profiles/grower.json\
 -u PeerAdmin\
 -r PeerAdmin -r ChannelAdmin\
 -f ./id-cards/PeerAdmin@itrazo-grower.card\
 -k ./crypto-config/peerOrganizations/grower.itrazo.com/users/Admin@grower.itrazo.com/msp/keystore/$GROWER_KEYSTORE\
 -c ./crypto-config/peerOrganizations/grower.itrazo.com/users/Admin@grower.itrazo.com/msp/signcerts/Admin@grower.itrazo.com-cert.pem

composer card import -f ./id-cards/PeerAdmin@itrazo-grower.card

echo -e "${FONTCOLOR}# 4/6 Finding ninemile key in keystore${NC}"
export NINEMILE_KEYSTORE=$(ls ./crypto-config/peerOrganizations/ninemile.itrazo.com/users/Admin@ninemile.itrazo.com/msp/keystore/*sk | xargs -n 1 basename)
echo -e "${FONTCOLOR}# 5/6 ninemile-keystore: '$NINEMILE_KEYSTORE'${NC}"

echo -e "${FONTCOLOR}# 6/6 Create and Import Ninemile PeerAdmin cards${NC}"
 composer card create\
 -p connection-profiles/ninemile.json\
 -u PeerAdmin\
 -r PeerAdmin -r ChannelAdmin\
 -f ./id-cards/PeerAdmin@itrazo-ninemile.card\
 -k ./crypto-config/peerOrganizations/ninemile.itrazo.com/users/Admin@ninemile.itrazo.com/msp/keystore/$NINEMILE_KEYSTORE\
 -c ./crypto-config/peerOrganizations/ninemile.itrazo.com/users/Admin@ninemile.itrazo.com/msp/signcerts/Admin@ninemile.itrazo.com-cert.pem

 composer card import -f ./id-cards/PeerAdmin@itrazo-ninemile.card
