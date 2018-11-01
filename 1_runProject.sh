export COMPOSE_PROJECT_NAME=itrazo

PROJECT_ROOT=$(pwd)
PROJECT_COMPOSER=$PROJECT_ROOT/composer
PROJECT_FABRIC=$PROJECT_ROOT/fabric

source 0_compileBusinessNetwork.sh

cd $PROJECT_COMPOSER
VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
echo "==============================="
echo "Version: " $VERSION
echo "==============================="

cd $PROJECT_FABRIC
./stop.sh
./start.sh

docker exec cli /bin/sh "./createChannel.sh"

composer network install -c PeerAdmin@itrazo-grower --archiveFile $PROJECT_COMPOSER/bin/itrazo.bna
composer network install -c PeerAdmin@itrazo-ninemile --archiveFile $PROJECT_COMPOSER/bin/itrazo.bna

composer network start -c PeerAdmin@itrazo-grower -n itrazo -V $VERSION -o endorsementPolicyFile=./composer/endorsement-policy.json -A grower-network-admin -C ./fabric/id-cards/grower-network-admin/admin-pub.pem -A ninemile-network-admin -C ./fabric/id-cards/ninemile-network-admin/admin-pub.pem

echo "#Running composer-rest-server"
composer-rest-server -c grower-network-admin@itrazo -n never -a false -w true -t false &
 