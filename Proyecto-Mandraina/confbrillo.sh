sudo modprobe i2c-dev

echo "i2c-dev" | sudo tee /etc/modules-load.d/i2c_dev.conf

sudo usermod -aG i2c $USER
