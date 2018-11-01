source ./0_basicExport.sh

echo -e "${FONTCOLOR}# 1/3 Stop and Start fabric network${NC}"
./stop.sh
./start.sh

echo -e "${FONTCOLOR}# 2/3 create and import grower network admin card${NC}"
composer identity request -c PeerAdmin@itrazo-grower -u admin -s adminpw -d ./id-cards/grower-network-admin
composer card create -p connection-profiles/grower.json -u grower-network-admin -n itrazo -c id-cards/grower-network-admin/admin-pub.pem -k id-cards/grower-network-admin/admin-priv.pem -f id-cards/grower-network-admin.card
composer card import -f id-cards/grower-network-admin.card

echo -e "${FONTCOLOR}# 3/3 create and import ninemile network admin card${NC}"
composer identity request -c PeerAdmin@itrazo-ninemile -u admin -s adminpw -d ./id-cards/ninemile-network-admin
composer card create -p connection-profiles/ninemile.json -u ninemile-network-admin -n itrazo -c id-cards/ninemile-network-admin/admin-pub.pem -k id-cards/ninemile-network-admin/admin-priv.pem -f id-cards/ninemile-network-admin.card
composer card import -f id-cards/ninemile-network-admin.card