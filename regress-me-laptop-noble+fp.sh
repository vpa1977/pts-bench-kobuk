set -ex 
export DEVICE_IP=192.168.20.17
sshpass -p ubuntu ssh-copy-id -o StrictHostKeyChecking=no ubuntu@$DEVICE_IP
ssh ubuntu@$DEVICE_IP sudo cp sources.list /etc/apt/
ssh ubuntu@$DEVICE_IP sudo apt -y install git
ssh ubuntu@$DEVICE_IP git clone --recurse-submodules -b pts-system-test https://github.com/vpa1977/pts-bench-kobuk.git
ssh ubuntu@$DEVICE_IP "cd ./pts-bench-kobuk/ && ./install-deps.sh"
ssh ubuntu@$DEVICE_IP "cd ./pts-bench-kobuk/ && ./no-framepointer/run-fp.sh"
mkdir -p artifacts/$DEVICE_IP
scp -r $DEVICE_IP:/home/ubuntu/.phoronix-test-suite/test-results/ artifacts/$DEVICE_IP

