sudo apt install apt-transport-https software-properties-common
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-focal-prod focal main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt update
sudo apt install dotnet-sdk-3.1


sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/$(lsb_release -rs)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt install dotnet-runtime-3.1




wget http://ftp.us.debian.org/debian/pool/main/i/icu/icu-devtools_67.1-7_amd64.deb

wget http://ftp.us.debian.org/debian/pool/main/i/icu/libicu-dev_63.1-6+deb10u3_amd64.deb	

sudo dpkg -i 	libicu-dev_63.1-6+deb10u3_amd64.deb	

sudo apt install dotnet-sdk-3.1
