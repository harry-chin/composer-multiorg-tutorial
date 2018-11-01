source ./0_basicExport.sh

echo -e ${FONTCOLOR}
echo "# 1/2 Remove id-cards directory for deleting all cards and create empty directory for preparation"
echo -e ${NC}
rm -rf ./id-cards
mkdir ./id-cards
echo -e ${FONTCOLOR}
echo "# 2/2 Deleting old ID cards, these commands may fail"
echo -e ${NC}
composer card delete -c PeerAdmin@itrazo-grower
composer card delete -c PeerAdmin@itrazo-ninemile
composer card delete -c grower-network-admin@itrazo
composer card delete -c ninemile-network-admin@itrazo