if ! xcode-select -p >/dev/null 2>&1; then
	xcode-select --install &
	wait $!

	if xcode-select -p >/dev/null 2>&1; then
		echo "Xcode Command Line Tools installed successfully"
	else
		echo "Xcode Command Line Tools installation failed"
		exit 1
	fi
fi
