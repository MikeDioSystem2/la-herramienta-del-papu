#!/usr/bin/env python3
"""
Test script for WiFi Hacking Tool - Termux Version
Verifies installation and basic functionality
"""

import os
import sys
import subprocess
import platform

def print_header():
    print("=" * 60)
    print("🧪 WiFi Hacking Tool - Installation Test")
    print("=" * 60)

def print_section(title):
    print(f"\n📋 {title}")
    print("-" * 40)

def check_command(command, description):
    """Check if a command is available"""
    try:
        result = subprocess.run(['which', command], 
                              capture_output=True, 
                              text=True)
        if result.returncode == 0:
            print(f"✅ {description}: {result.stdout.strip()}")
            return True
        else:
            print(f"❌ {description}: Not found")
            return False
    except Exception as e:
        print(f"❌ {description}: Error checking - {e}")
        return False

def check_python_module(module_name, description):
    """Check if a Python module can be imported"""
    try:
        __import__(module_name)
        print(f"✅ {description}: Available")
        return True
    except ImportError:
        print(f"❌ {description}: Not available")
        return False

def check_termux():
    """Check if running on Termux"""
    is_termux = 'com.termux' in os.environ.get('PREFIX', '') or \
                'termux' in os.environ.get('PREFIX', '').lower()
    
    if is_termux:
        print("✅ Platform: Running on Termux")
        return True
    else:
        print("⚠️  Platform: Not detected as Termux")
        return False

def main():
    print_header()
    
    # System Information
    print_section("System Information")
    print(f"🐍 Python Version: {sys.version}")
    print(f"💻 Platform: {platform.platform()}")
    print(f"🏗️  Architecture: {platform.architecture()[0]}")
    
    # Check Termux
    print_section("Termux Detection")
    is_termux = check_termux()
    
    # Check Python modules
    print_section("Python Modules")
    modules = [
        ('os', 'OS Module'),
        ('subprocess', 'Subprocess Module'),
        ('sys', 'System Module'),
        ('platform', 'Platform Module'),
    ]
    
    optional_modules = [
        ('requests', 'Requests Library'),
        ('colorama', 'Colorama (Colors)'),
        ('scapy', 'Scapy (Networking)'),
    ]
    
    for module, desc in modules:
        check_python_module(module, desc)
    
    print("\n📦 Optional Modules:")
    for module, desc in optional_modules:
        check_python_module(module, desc)
    
    # Check system commands
    print_section("System Commands")
    essential_commands = [
        ('python3', 'Python 3'),
        ('which', 'Which Command'),
        ('ls', 'List Command'),
        ('cat', 'Cat Command'),
    ]
    
    for cmd, desc in essential_commands:
        check_command(cmd, desc)
    
    # Check optional networking tools
    print_section("Optional Networking Tools")
    optional_commands = [
        ('nmap', 'Network Mapper'),
        ('crunch', 'Wordlist Generator'),
        ('john', 'John the Ripper'),
        ('hashcat', 'Hashcat'),
        ('curl', 'CURL'),
        ('wget', 'Wget'),
    ]
    
    available_tools = 0
    for cmd, desc in optional_commands:
        if check_command(cmd, desc):
            available_tools += 1
    
    # Check directories
    print_section("Directory Structure")
    directories = [
        ('wifi_hacking_termux.py', '🐍 Main Script'),
        ('README.md', '📖 Documentation'),
        ('install_termux.sh', '⚙️  Installation Script'),
        ('requirements.txt', '📋 Requirements'),
        ('LICENSE', '📄 License'),
        ('TUTORIAL.md', '🎓 Tutorial'),
    ]
    
    for file_path, desc in directories:
        if os.path.exists(file_path):
            print(f"✅ {desc}: Found")
        else:
            print(f"❌ {desc}: Missing")
    
    # Create test directories if needed
    test_dirs = ['wordlists', 'captures', 'temp']
    print(f"\n📁 Creating test directories...")
    for dir_name in test_dirs:
        try:
            os.makedirs(dir_name, exist_ok=True)
            print(f"✅ Directory '{dir_name}': Created/Verified")
        except Exception as e:
            print(f"❌ Directory '{dir_name}': Error - {e}")
    
    # Final assessment
    print_section("Installation Assessment")
    
    if is_termux:
        print("✅ Termux environment detected")
    else:
        print("⚠️  Not running on Termux - some features may not work as expected")
    
    print(f"📊 Optional tools available: {available_tools}/{len(optional_commands)}")
    
    if available_tools >= 3:
        print("✅ Good tool availability")
    elif available_tools >= 1:
        print("⚠️  Limited tool availability - basic functionality only")
    else:
        print("❌ No optional tools available - educational mode only")
    
    print_section("Recommendations")
    
    if available_tools < len(optional_commands):
        print("📦 To install missing tools:")
        print("   pkg update && pkg upgrade")
        for cmd, desc in optional_commands:
            if not check_command(cmd, desc):
                print(f"   pkg install {cmd}")
    
    print("\n🚀 To run the tool:")
    print("   python3 wifi_hacking_termux.py")
    
    print("\n📚 For help:")
    print("   Read README.md and TUTORIAL.md")
    
    print("\n⚠️  Remember:")
    print("   • Educational purposes only")
    print("   • Limited functionality without root")
    print("   • Use only on networks you own")
    
    print("\n" + "=" * 60)
    print("🎉 Installation test completed!")
    print("=" * 60)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n👋 Test interrupted by user")
        sys.exit(0)
    except Exception as e:
        print(f"\n❌ Test failed with error: {e}")
        sys.exit(1)
