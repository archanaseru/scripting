#!/bin/bash

# List of packages to filter
packages=(
  acl
  acpid
  accountsservice
  adwaita-icon-theme
  aide
  ansible
  ansible-core
  apache-cimprov
  apache2
  apache2-bin
  apache2-data
  apache2-utils
  apg
  apt-fast
  apt-transport-https
  aptdaemon
  aptdaemon-data
  aria2
  aspell
  aspell-en
  aspnetcore-runtime-2.2
  aspnetcore-runtime-3.1
  aspnetcore-runtime-5.0
  aspnetcore-runtime-6.0
  aspnetcore-runtime-7.0
  aspnetcore-runtime-8.0
  aspnetcore-targeting-pack-3.1
  aspnetcore-targeting-pack-5.0
  aspnetcore-targeting-pack-6.0
  aspnetcore-targeting-pack-8.0
  at
  at-spi2-core
  audispd-plugins
  auditd
  auoms
  autoconf
  automake
  autopoint
  autotools-dev
  avahi-daemon
  avahi-utils
  azure-cli
  azuremonitoragent
  binfmt-support
  bluez
  bsdmainutils
  bubblewrap
  build-essential
  bzip2
  bzip2-doc
)

# Loop through each package and check if it exists
for package in "${packages[@]}"; do
  echo "Checking package: $package"
  apt show "$package" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Package '$package' is available"
    # You can add further actions here if needed
  else
    echo "Package '$package' is not available"
  fi
done
