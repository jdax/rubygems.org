set -e

if which toxiproxy > /dev/null; then
  echo "Toxiproxy is already installed."
  exit 0
fi

if which apt-get > /dev/null; then
  echo "Installing toxiproxy-1.1.0.deb"
  wget -O /tmp/toxiproxy-1.1.0.deb https://github.com/Shopify/toxiproxy/releases/download/v1.1.0/toxiproxy_1.1.0_amd64.deb
  sudo dpkg -i /tmp/toxiproxy-1.1.0.deb
  sudo service toxiproxy start
  exit 0
fi

if which brew > /dev/null; then
  echo "Installing toxiproxy from homebrew."
  brew tap shopify/shopify
  brew install toxiproxy
  brew info toxiproxy
  exit 0
fi

echo "Sorry, there is no toxiproxy package available for your system. You might need to build it from source."
exit 1
