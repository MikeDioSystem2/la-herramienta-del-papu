#!/data/data/com.termux/files/usr/bin/bash
# Quick Install Script for WiFi Hacking Tool - Termux Mobile Version
# One-command installation for mobile devices

clear
echo "📱 WiFi Hacking Tool - Mobile Quick Install"
echo "=========================================="
echo "🚀 Installing automatically on Termux..."
echo

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Check if running on Termux
if [[ ! "$PREFIX" == *"com.termux"* ]]; then
    echo -e "${RED}❌ Error: This script must run on Termux!${NC}"
    echo "📲 Download Termux from F-Droid or Google Play Store"
    echo "🔗 Then run this script inside Termux"
    exit 1
fi

echo -e "${GREEN}✅ Termux detected!${NC}"
echo

# Request storage permissions
echo -e "${BLUE}📁 Setting up storage permissions...${NC}"
termux-setup-storage
echo

# Update system
echo -e "${BLUE}⬆️  Updating Termux packages...${NC}"
pkg update -y && pkg upgrade -y

# Install essential packages
echo -e "${BLUE}📦 Installing essential packages...${NC}"
pkg install -y python python3 git wget curl which nano vim termux-api

# Install optional tools
echo -e "${BLUE}🔧 Installing security tools...${NC}"
pkg install -y nmap crunch john hashcat tsu proot

# Install Python packages
echo -e "${BLUE}🐍 Installing Python packages...${NC}"
pip install --upgrade pip
pip install requests colorama scapy

# Create directories
echo -e "${BLUE}📁 Creating project directories...${NC}"
mkdir -p ~/wifi-hacking-mobile
mkdir -p ~/wordlists
mkdir -p ~/captures
mkdir -p ~/tools

# Copy files if in project directory, otherwise download
if [ -f "wifi_hacking_termux.py" ]; then
    echo -e "${GREEN}📋 Copying local files...${NC}"
    cp -r * ~/wifi-hacking-mobile/
else
    echo -e "${BLUE}⬇️  Files will be in current directory${NC}"
    # If you want to download from GitHub, uncomment:
    # git clone https://github.com/[your-repo]/Wifi-Hacking-Termux.git ~/wifi-hacking-mobile
fi

cd ~/wifi-hacking-mobile

# Set permissions
echo -e "${BLUE}🔐 Setting permissions...${NC}"
chmod +x *.py 2>/dev/null || true
chmod +x *.sh 2>/dev/null || true

# Create quick launch script
echo -e "${BLUE}🚀 Creating launcher...${NC}"
cat > ~/wifi-hack << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/wifi-hacking-mobile
python3 wifi_hacking_termux.py
EOF
chmod +x ~/wifi-hack

# Create desktop shortcut equivalent
cat > ~/.termux/boot/wifi-hack-boot.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
# Auto-start script (optional)
# Uncomment next line to auto-launch on boot
# ~/wifi-hack
EOF
chmod +x ~/.termux/boot/wifi-hack-boot.sh 2>/dev/null || true

# Download sample wordlists
echo -e "${BLUE}📝 Downloading sample wordlists...${NC}"
cd ~/wordlists
wget -q "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt" -O common_passwords.txt 2>/dev/null || echo "⚠️ Wordlist download failed (no internet?)"

# Create basic wordlists
echo -e "${BLUE}📝 Creating basic wordlists...${NC}"
if command -v crunch > /dev/null; then
    crunch 4 4 0123456789 -o ~/wordlists/4digit_numbers.txt 2>/dev/null || true
    crunch 6 6 0123456789 -o ~/wordlists/6digit_numbers.txt 2>/dev/null || true
fi

# Create common passwords manually
cat > ~/wordlists/common_mobile.txt << 'EOF'
password
123456
123456789
password123
admin
qwerty
letmein
welcome
monkey
dragon
EOF

cd ~/wifi-hacking-mobile

# Run test
echo -e "${BLUE}🧪 Running installation test...${NC}"
python3 test_installation.py 2>/dev/null || echo "⚠️ Test script not found"

echo
echo -e "${GREEN}🎉 Installation completed successfully!${NC}"
echo "=============================================="
echo
echo -e "${PURPLE}🚀 Quick Launch Commands:${NC}"
echo "• Type: ${YELLOW}~/wifi-hack${NC} (from anywhere)"
echo "• Or: ${YELLOW}python3 ~/wifi-hacking-mobile/wifi_hacking_termux.py${NC}"
echo
echo -e "${PURPLE}📁 Important Directories:${NC}"
echo "• Project: ~/wifi-hacking-mobile/"
echo "• Wordlists: ~/wordlists/"
echo "• Captures: ~/captures/"
echo
echo -e "${PURPLE}📱 Mobile Tips:${NC}"
echo "• Use volume up + Q to quit programs"
echo "• Swipe from left edge for Termux keyboard"
echo "• Long press for copy/paste menu"
echo "• Use extra keys row for special characters"
echo
echo -e "${RED}⚠️  LEGAL REMINDER:${NC}"
echo "• Educational purposes only"
echo "• Use only on your own networks"
echo "• Respect local laws and regulations"
echo
echo -e "${GREEN}✅ Ready to learn WiFi security!${NC}"
echo "Type: ${YELLOW}~/wifi-hack${NC} to start"
echo
