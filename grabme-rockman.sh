export DEVICE_IP=10.245.130.84
set -x

while true; do
mkdir -p artifacts/$DEVICE_IP
scp -r ubuntu@$DEVICE_IP:/home/ubuntu/.phoronix-test-suite/test-results/ artifacts/$DEVICE_IP
sleep 120 

done

