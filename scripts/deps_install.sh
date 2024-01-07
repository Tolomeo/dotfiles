case "$(uname)" in
Darwin)
	if ! xcode-select -p >/dev/null 2>&1; then
		echo "Installing Xcode Command Line Tools"

		xcode-select --install &
		wait $!

		if xcode-select -p >/dev/null 2>&1; then
			echo "Xcode Command Line Tools installed successfully"
		else
			echo "Xcode Command Line Tools installation failed"
			exit 1
		fi
	fi
	;;
Linux)
	echo "Installing system dependencies"

	deps="build-essential procps curl file libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libnss3 libxss1 libasound2 libxtst6 xauth xvfb"

	sudo apt update
	for dep in $deps; do
		sudo apt install -y $dep
	done
	;;
esac
