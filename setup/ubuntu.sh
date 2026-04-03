deps="build-essential procps curl file libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libnss3 libxss1 libasound2 libxtst6 xauth xvfb"

sudo apt update

for dep in $deps; do
	sudo apt install -y $dep
done
