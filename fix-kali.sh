#!/bin/bash

# Clear screen before running script
clear

# Display Banner
echo -e "\e[1;32m"
echo "========================================="
echo "   🚀 Kali Linux Fix & Upgrade Script  "
echo "========================================="
echo -e "\e[1;33mAuthor  : Lokesh Kumar"
echo "YouTube : https://youtube.com/@termuxvibes"
echo -e "\e[1;32m=========================================\e[0m"
sleep 2

echo "🔍 Finding problematic packages..."
cd /usr/bin || exit

# Find files that cannot be modified
PROBLEM_FILES=()
for file in *; do
    if ! chmod +x "$file" 2>/dev/null; then
        PROBLEM_FILES+=("$file")
    fi
done

if [ ${#PROBLEM_FILES[@]} -eq 0 ]; then
    echo "✅ No problematic files found."
else
    echo "❌ Problematic files found:"
    printf '%s\n' "${PROBLEM_FILES[@]}"
sleep 5
    echo "🗑 Removing problematic files..."
    for file in "${PROBLEM_FILES[@]}"; do
        sudo rm -f "/usr/bin/$file"
    done
    echo "✅ Files removed."
fi
clear
echo "🔄 Installing Broken Packages 🔄"
sleep 5
apt --fix-broken install
clear
sleep 5
echo "🔄 Fixing dpkg...🔄"
sleep 5 
sudo dpkg --configure -a
clear
echo "🛠 Fixing and updating package lists..."
sleep 5
sudo apt-get clean
sudo apt autoremove -y
sudo apt-get update
clear
echo "📦 Upgrading Kali Linux...🔄"
sleep 10

sudo apt-get full-upgrade -y
clear
sleep 1
echo "Clearing Unwanted Package And Moduels "
sleep 2
sudo apt-get clean
sudo apt autoremove -y
sudo apt-get update -y
cd $HOME
sudo rm -rf /var/lib/postgresql/17
sudo rm -rf /etc/postgresql/17
sudo apt-get clean
sudo apt autoremove -y
sudo apt-get update -y
sudo apt-get install postgresql-17
clear 
sleep 1
echo "✅ System fixed and upgraded!"
sleep 1
sleep 3
echo "Enjoy Your day"
sleep 2
echo -e "\e[1;32m"
echo "========================================="
echo "   🚀 Kali Linux Fix & Upgrade Script  "
echo "========================================="
echo -e "\e[1;33mAuthor  : Lokesh Kumar"
echo "YouTube : https://youtube.com/@termuxvibes"
echo -e "\e[1;32m=========================================\e[0m"
sleep 10
echo "----------------------------------------"
sleep 3
echo "bye bye"
sleep 3


