#!/data/data/com.termux/files/usr/bin/bash

# WiFi Hacking Tool - Termux Installation Script
# For educational purposes only

echo "🚀 WiFi Hacking Tool - Termux Installation"
echo "=========================================="
echo

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Termux
if [[ ! "$PREFIX" == *"com.termux"* ]]; then
    print_error "This script is designed for Termux only!"
    exit 1
fi

print_success "Running on Termux ✓"

# Update package repositories
print_status "Updating package repositories..."
if pkg update -y; then
    print_success "Package repositories updated"
else
    print_error "Failed to update packages"
    exit 1
fi

# Upgrade existing packages
print_status "Upgrading existing packages..."
if pkg upgrade -y; then
    print_success "Packages upgraded"
else
    print_warning "Some packages may have failed to upgrade"
fi

# Install essential packages
print_status "Installing essential packages..."
ESSENTIAL_PACKAGES=(
    "python"
    "python3" 
    "git"
    "wget"
    "curl"
    "which"
    "vim"
    "nano"
    "termux-api"
)

failed_packages=()
for package in "${ESSENTIAL_PACKAGES[@]}"; do
    print_status "Installing $package..."
    if pkg install "$package" -y; then
        print_success "$package installed"
    else
        print_warning "Failed to install $package"
        failed_packages+=("$package")
    fi
done

# Install optional wireless/networking tools
print_status "Installing optional networking tools..."
OPTIONAL_PACKAGES=(
    "nmap"
    "crunch"
    "john"
    "hashcat"
    "tsu"
    "proot"
)

print_warning "Note: Some tools may not be available or may have limited functionality"
for package in "${OPTIONAL_PACKAGES[@]}"; do
    print_status "Attempting to install $package..."
    if pkg install "$package" -y 2>/dev/null; then
        print_success "$package installed"
    else
        print_warning "$package not available or failed to install"
        failed_packages+=("$package")
    fi
done

# Install Python packages
print_status "Installing Python packages..."
if pip install --upgrade pip; then
    print_success "pip upgraded"
else
    print_warning "pip upgrade failed"
fi

PYTHON_PACKAGES=(
    "requests"
    "colorama" 
    "scapy"
)

for package in "${PYTHON_PACKAGES[@]}"; do
    print_status "Installing Python package: $package..."
    if pip install "$package"; then
        print_success "$package installed"
    else
        print_warning "Failed to install Python package: $package"
        failed_packages+=("python-$package")
    fi
done

# Create directories
print_status "Creating necessary directories..."
mkdir -p ~/wifi-hacking
mkdir -p ~/wordlists
mkdir -p ~/captures

# Download sample wordlists
print_status "Downloading sample wordlists..."
cd ~/wordlists

# Download common passwords
if wget -q "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt" -O common_passwords.txt; then
    print_success "Common passwords wordlist downloaded"
else
    print_warning "Failed to download common passwords wordlist"
fi

# Create a basic numeric wordlist
print_status "Creating basic wordlists..."
if command -v crunch > /dev/null; then
    crunch 4 4 0123456789 -o ~/wordlists/4digit_numbers.txt 2>/dev/null || true
    crunch 6 6 0123456789 -o ~/wordlists/6digit_numbers.txt 2>/dev/null || true
    print_success "Numeric wordlists created"
else
    # Create manually if crunch not available
    echo "Creating numeric wordlists manually..."
    seq 0000 9999 | sed 's/^/000/g' | sed 's/.*\(....\)$/\1/' > ~/wordlists/4digit_numbers.txt
    print_success "Basic 4-digit wordlist created"
fi

# Set permissions
print_status "Setting proper permissions..."
chmod +x ~/wifi-hacking-termux/wifi_hacking_termux.py 2>/dev/null || true
chmod +x ~/wifi-hacking-termux/install_termux.sh 2>/dev/null || true

# Create desktop shortcut if possible
print_status "Creating shortcuts..."
cat > ~/wifi-hacking-termux/run.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/wifi-hacking-termux
python3 wifi_hacking_termux.py
EOF
chmod +x ~/wifi-hacking-termux/run.sh 2>/dev/null || true

# Display installation summary
echo
echo "🎉 Installation Complete!"
echo "========================"
echo

if [ ${#failed_packages[@]} -eq 0 ]; then
    print_success "All packages installed successfully!"
else
    print_warning "Some packages failed to install:"
    for package in "${failed_packages[@]}"; do
        echo "  - $package"
    done
fi

echo
echo "📂 Directories created:"
echo "  - ~/wifi-hacking (for scripts)"
echo "  - ~/wordlists (for password lists)"  
echo "  - ~/captures (for handshake files)"
echo

echo "🚀 To run the tool:"
echo "  cd ~/wifi-hacking-termux"
echo "  python3 wifi_hacking_termux.py"
echo

echo "⚠️  Important Reminders:"
echo "  • This tool is for educational purposes only"
echo "  • No root access = limited functionality" 
echo "  • Cannot perform real WiFi attacks without root"
echo "  • Use only on networks you own or have permission to test"
echo

print_success "Ready to learn about WiFi security! 🔒"

# Check system info
echo
echo "📊 System Information:"
echo "  Termux Version: $(getprop ro.build.version.release 2>/dev/null || echo 'Unknown')"
echo "  Android Version: $(getprop ro.build.version.release 2>/dev/null || echo 'Unknown')"
echo "  Python Version: $(python3 --version 2>/dev/null || echo 'Not installed')"
echo "  Architecture: $(uname -m)"
echo

echo "🔗 Next Steps:"
echo "1. Read the README.md for detailed usage instructions"
echo "2. Start with educational modules to learn concepts"
echo "3. Practice with the simulation features"
echo "4. Consider setting up a proper pentesting lab for real testing"
echo

exit 0
