echo "Updating dnf"
sudo dnf update -y

echo "Installing build tools"
sudo dnf group install -y development-tools
sudo dnf install -y procps-ng curl file
