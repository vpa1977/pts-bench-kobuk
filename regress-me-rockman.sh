set -ex 
export DEVICE_IP=10.245.130.84
sshpass -p ubuntu ssh-copy-id -o StrictHostKeyChecking=no ubuntu@$DEVICE_IP
#ssh ubuntu@$DEVICE_IP "echo deb http://rebuild-test.ubuntu.com/ubuntu-test-rebuild-20240126-mantic-with-fp/ubuntu/ mantic main universe multiverse restricted > sources.list"
ssh ubuntu@$DEVICE_IP sudo apt -y install git
ssh ubuntu@$DEVICE_IP git clone --recurse-submodules -b pts-system-test https://github.com/vpa1977/pts-bench-kobuk.git
ssh ubuntu@$DEVICE_IP "cd ./pts-bench-kobuk/ && ./install-deps.sh"
ssh ubuntu@$DEVICE_IP "cd ./pts-bench-kobuk/ && ./no-framepointer/run.sh"
mkdir -p artifacts/$DEVICE_IP
scp -r ubuntu@$DEVICE_IP:/home/ubuntu/.phoronix-test-suite/test-results/ artifacts/$DEVICE_IP

