#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
WiFi Hacking Tool - Termux Compatible Version (Non-Root)
Modified for educational purposes and Termux compatibility
Original by: BlackHatHacker-Ankit
Modified by: Assistant for Termux Non-Root compatibility

DISCLAIMER: This tool is for educational purposes only.
Use only on networks you own or have permission to test.
"""

import os
import subprocess
import sys
import platform

def check_termux():
    """Check if running on Termux"""
    return 'com.termux' in os.environ.get('PREFIX', '') or 'termux' in os.environ.get('PREFIX', '').lower()

def install_termux_tools():
    """Install available wireless tools in Termux"""
    print("\n🔧 Installing available tools for Termux...")
    tools = [
        'python',
        'python3',
        'git',
        'wget',
        'curl',
        'nmap',
        'tsu',  # For potential root access if available
        'crunch',  # Password list generator
        'hashcat',  # If available
        'john',  # If available
    ]
    
    for tool in tools:
        try:
            print(f"📦 Installing {tool}...")
            os.system(f"pkg install {tool} -y")
        except:
            print(f"⚠️  Could not install {tool}")
    
    print("\n✅ Installation attempt completed!")
    print("\n⚠️  IMPORTANT LIMITATIONS:")
    print("• Monitor mode requires root access (not available)")
    print("• Packet injection requires root access (not available)")
    print("• Most WiFi attacks require root privileges")
    print("• This tool provides educational content and limited functionality")

def show_termux_warning():
    """Show warning about Termux limitations"""
    print("\n" + "="*70)
    print("⚠️  TERMUX NON-ROOT LIMITATIONS WARNING")
    print("="*70)
    print("🚫 WITHOUT ROOT ACCESS, THE FOLLOWING ARE NOT POSSIBLE:")
    print("   • Monitor mode activation")
    print("   • WiFi packet capture")
    print("   • WiFi packet injection")
    print("   • Real WiFi network attacks")
    print("   • Interface mode switching")
    print("\n✅ WHAT THIS TOOL CAN DO:")
    print("   • Educational demonstrations")
    print("   • Password list generation")
    print("   • Network scanning (limited)")
    print("   • Hash cracking (if handshakes provided)")
    print("   • Learning WiFi security concepts")
    print("\n📚 FOR REAL TESTING:")
    print("   • Use rooted device with Kali NetHunter")
    print("   • Use dedicated WiFi adapter with monitor mode")
    print("   • Use proper penetration testing distribution")
    print("="*70)

def intro():
    """Main menu for Termux version"""
    os.system("clear")
    show_termux_warning()
    
    print("\n\033[1;32m")
    print("-" * 80)
    print("██╗    ██╗██╗███████╗██╗       ██████╗██████╗  █████╗  ██████╗██╗  ██╗")
    print("██║    ██║██║██╔════╝██║      ██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝")
    print("██║ █╗ ██║██║█████╗  ██║█████╗██║     ██████╔╝███████║██║     █████╔╝ ")
    print("██║███╗██║██║██╔══╝  ██║╚════╝██║     ██╔══██╗██╔══██║██║     ██╔═██╗ ")
    print("╚███╔███╔╝██║██║     ██║      ╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗")
    print(" ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝       ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝")
    print("                    📱 TERMUX NON-ROOT VERSION 📱")
    print("                 Modified for Educational Purposes")
    print("-" * 80)
    print("\033[0m")
    
    print("🎓 EDUCATIONAL MENU:")
    print("(1)  📚 Learn about Monitor Mode (Educational)")
    print("(2)  📚 Learn about Network Scanning")
    print("(3)  📊 Simulate Network Discovery")
    print("(4)  📚 Learn about Handshake Capture (Theory)")
    print("(5)  🔧 Install Available Tools")
    print("(6)  🔐 Crack Handshake with Wordlist (if provided)")
    print("(7)  🔐 Crack Hash with John the Ripper (if available)")
    print("(8)  📝 Generate Custom Wordlist")
    print("(9)  📚 Learn about WPS Attacks (Educational)")
    print("(10) 🌐 Basic Network Information")
    print("(11) 📚 WiFi Security Education")
    print("(12) ⚙️  System Information")
    print("\n(0)  ℹ️  About")
    print("(00) 🚪 Exit")
    print("-" * 80)
    
    try:
        choice = int(input("\n📋 Enter your choice: "))
        handle_choice(choice)
    except ValueError:
        print("❌ Invalid input! Please enter a number.")
        input("Press Enter to continue...")
        intro()
    except KeyboardInterrupt:
        print("\n\n👋 Goodbye!")
        sys.exit(0)

def handle_choice(choice):
    """Handle user menu choices"""
    if choice == 1:
        educational_monitor_mode()
    elif choice == 2:
        educational_scanning()
    elif choice == 3:
        simulate_network_discovery()
    elif choice == 4:
        educational_handshake()
    elif choice == 5:
        install_termux_tools()
        input("Press Enter to continue...")
    elif choice == 6:
        crack_with_wordlist()
    elif choice == 7:
        crack_with_john()
    elif choice == 8:
        generate_wordlist()
    elif choice == 9:
        educational_wps()
    elif choice == 10:
        network_info()
    elif choice == 11:
        wifi_education()
    elif choice == 12:
        system_info()
    elif choice == 0:
        about_section()
    elif choice == 00:
        print("👋 Goodbye!")
        sys.exit(0)
    else:
        print("❌ Invalid choice!")
        input("Press Enter to continue...")
    
    intro()

def educational_monitor_mode():
    """Educational content about monitor mode"""
    os.system("clear")
    print("\n📚 MONITOR MODE EDUCATION")
    print("="*50)
    print("🔍 What is Monitor Mode?")
    print("Monitor mode allows a wireless interface to monitor all traffic")
    print("on a wireless channel, not just traffic addressed to it.")
    print("\n⚙️  How it normally works:")
    print("1. airmon-ng check kill    # Kill interfering processes")
    print("2. airmon-ng start wlan0   # Enable monitor mode")
    print("3. iwconfig                # Verify monitor interface")
    print("\n🚫 Why it doesn't work in Termux without root:")
    print("• Requires direct hardware access")
    print("• Needs root privileges")
    print("• Android security restrictions")
    print("• No access to wireless drivers")
    print("\n✅ Alternatives for learning:")
    print("• Use VM with USB WiFi adapter")
    print("• Use dedicated penetration testing OS")
    print("• Study packet captures (pcap files)")
    print("• Use simulation tools")
    
    input("\nPress Enter to continue...")

def educational_scanning():
    """Educational content about network scanning"""
    os.system("clear")
    print("\n📚 NETWORK SCANNING EDUCATION")
    print("="*50)
    print("🔍 What is WiFi Network Scanning?")
    print("Process of discovering wireless networks in range")
    print("\n⚙️  Normal scanning commands:")
    print("• airodump-ng wlan0mon     # Scan for networks")
    print("• iwlist scan              # Basic scanning")
    print("• nmap -sn 192.168.1.0/24  # Network discovery")
    print("\n🚫 Limitations in Termux:")
    print("• No monitor mode = limited scanning")
    print("• Cannot see all network details")
    print("• Cannot capture management frames")
    print("\n✅ What we can do:")
    print("• Basic network connectivity tests")
    print("• Limited network discovery")
    print("• Educational simulations")
    
    print("\n🔍 Attempting basic network information...")
    try:
        # Try to get some basic network info
        result = subprocess.run(['ip', 'route'], capture_output=True, text=True)
        if result.stdout:
            print("📡 Current network information:")
            print(result.stdout[:500])  # Limit output
        else:
            print("⚠️  No network information available")
    except:
        print("⚠️  Could not retrieve network information")
    
    input("\nPress Enter to continue...")

def simulate_network_discovery():
    """Simulate network discovery for educational purposes"""
    os.system("clear")
    print("\n🎭 SIMULATED NETWORK DISCOVERY")
    print("="*50)
    print("📡 Simulating network scan results...")
    print("(This is educational simulation only)")
    print("\nBSSID              ESSID                 Channel  Power  Security")
    print("-" * 65)
    print("00:11:22:33:44:55  Home_WiFi_Example     6        -45    WPA2")
    print("AA:BB:CC:DD:EE:FF  Office_Network        11       -62    WPA2-Enterprise")
    print("11:22:33:44:55:66  Guest_Network         1        -71    Open")
    print("FF:EE:DD:CC:BB:AA  Router_5G             36       -38    WPA3")
    print("99:88:77:66:55:44  IoT_Device            6        -83    WEP (Vulnerable!)")
    print("\n📊 Analysis:")
    print("• Found 5 simulated networks")
    print("• 1 Open network (no password)")
    print("• 1 WEP network (easily crackable)")
    print("• 2 WPA2 networks (require dictionary attacks)")
    print("• 1 WPA3 network (most secure)")
    print("\n⚠️  Remember: This is simulation for learning!")
    
    input("\nPress Enter to continue...")

def educational_handshake():
    """Educational content about handshake capture"""
    os.system("clear")
    print("\n📚 WPA/WPA2 HANDSHAKE EDUCATION")
    print("="*50)
    print("🤝 What is a WPA Handshake?")
    print("A 4-way authentication process between client and access point")
    print("\n⚙️  Normal capture process:")
    print("1. airodump-ng -c 6 --bssid AA:BB:CC:DD:EE:FF -w capture wlan0mon")
    print("2. aireplay-ng -0 10 -a AA:BB:CC:DD:EE:FF wlan0mon")
    print("3. Wait for client reconnection")
    print("4. Analyze captured handshake")
    print("\n🚫 Why it doesn't work without root:")
    print("• No monitor mode capability")
    print("• Cannot inject deauth packets")
    print("• Cannot capture raw 802.11 frames")
    print("\n✅ Learning alternatives:")
    print("• Study provided handshake files")
    print("• Learn about the 4-way handshake protocol")
    print("• Practice with sample pcap files")
    print("• Understand WPA/WPA2 vulnerabilities")
    
    print("\n📖 4-Way Handshake Process:")
    print("1. AP → Client: ANonce (random number)")
    print("2. Client → AP: SNonce + MIC")
    print("3. AP → Client: GTK + MIC")
    print("4. Client → AP: Confirmation")
    
    input("\nPress Enter to continue...")

def crack_with_wordlist():
    """Attempt to crack handshake with wordlist"""
    os.system("clear")
    print("\n🔐 HANDSHAKE CRACKING WITH WORDLIST")
    print("="*50)
    
    handshake_path = input("📁 Enter path to handshake file (.cap/.hccapx): ").strip()
    if not handshake_path:
        print("❌ No path provided!")
        input("Press Enter to continue...")
        return
    
    if not os.path.exists(handshake_path):
        print("❌ File not found! Creating example...")
        print("ℹ️  In real scenario, you would have a captured handshake file")
        input("Press Enter to continue...")
        return
    
    wordlist_path = input("📝 Enter path to wordlist: ").strip()
    if not wordlist_path:
        print("📝 No wordlist provided. Using simulation...")
        print("🔍 Simulating password cracking...")
        print("⏳ Testing common passwords...")
        print("❌ 'password' - Failed")
        print("❌ '123456789' - Failed") 
        print("❌ 'admin' - Failed")
        print("✅ 'password123' - SUCCESS!")
        print("\n🎉 Simulated crack successful!")
        print("💡 In reality, this could take hours/days/years")
    else:
        # Try to use aircrack-ng if available
        print("🔍 Attempting to crack handshake...")
        print("⚠️  Note: aircrack-ng may not be available in Termux")
        cmd = f"aircrack-ng '{handshake_path}' -w '{wordlist_path}'"
        print(f"Command: {cmd}")
        os.system(cmd)
    
    input("\nPress Enter to continue...")

def crack_with_john():
    """Attempt to crack hashes with John the Ripper"""
    os.system("clear")
    print("\n🔐 HASH CRACKING WITH JOHN THE RIPPER")
    print("="*50)
    
    # Check if john is available
    try:
        result = subprocess.run(['which', 'john'], capture_output=True)
        if result.returncode != 0:
            print("⚠️  John the Ripper not installed!")
            print("📦 Install with: pkg install john")
            print("📚 This is for educational hash cracking")
            input("Press Enter to continue...")
            return
    except:
        print("⚠️  John the Ripper not available")
        input("Press Enter to continue...")
        return
    
    hash_file = input("📁 Enter path to hash file: ").strip()
    if not hash_file or not os.path.exists(hash_file):
        print("📚 Educational example of John the Ripper usage:")
        print("john --wordlist=/path/to/wordlist.txt hashfile.txt")
        print("john --show hashfile.txt")
    else:
        print("🔍 Attempting to crack hashes...")
        os.system(f"john '{hash_file}'")
    
    input("\nPress Enter to continue...")

def generate_wordlist():
    """Generate custom wordlist using crunch"""
    os.system("clear")
    print("\n📝 CUSTOM WORDLIST GENERATION")
    print("="*50)
    
    # Check if crunch is available
    try:
        result = subprocess.run(['which', 'crunch'], capture_output=True)
        if result.returncode != 0:
            print("⚠️  Crunch not installed!")
            print("📦 Try to install with: pkg install crunch")
            simulate_wordlist_generation()
            input("Press Enter to continue...")
            return
    except:
        print("⚠️  Crunch not available")
        simulate_wordlist_generation()
        input("Press Enter to continue...")
        return
    
    try:
        min_len = int(input("📏 Minimum password length (4-20): "))
        max_len = int(input("📏 Maximum password length (4-20): "))
        
        if min_len < 4 or max_len > 20 or min_len > max_len:
            print("❌ Invalid length parameters!")
            input("Press Enter to continue...")
            return
        
        charset_options = {
            '1': 'abcdefghijklmnopqrstuvwxyz',
            '2': 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
            '3': '0123456789',
            '4': 'abcdefghijklmnopqrstuvwxyz0123456789',
            '5': 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
        }
        
        print("\n🔤 Character set options:")
        print("1) Lowercase letters")
        print("2) Uppercase letters")
        print("3) Numbers only")
        print("4) Lowercase + numbers")
        print("5) Mixed case + numbers")
        
        choice = input("Choose character set (1-5): ")
        if choice not in charset_options:
            print("❌ Invalid choice!")
            input("Press Enter to continue...")
            return
        
        output_file = input("📁 Output file path: ").strip()
        if not output_file:
            output_file = "wordlist.txt"
        
        charset = charset_options[choice]
        print(f"\n🔧 Generating wordlist...")
        print(f"Command: crunch {min_len} {max_len} {charset} -o {output_file}")
        
        # Warning about file size
        import math
        estimated_size = sum(len(charset)**i for i in range(min_len, max_len+1))
        print(f"⚠️  Estimated {estimated_size} passwords")
        
        if estimated_size > 1000000:
            confirm = input("⚠️  Large wordlist! Continue? (y/N): ")
            if confirm.lower() != 'y':
                print("❌ Cancelled")
                input("Press Enter to continue...")
                return
        
        os.system(f"crunch {min_len} {max_len} {charset} -o {output_file}")
        print(f"✅ Wordlist generated: {output_file}")
        
    except ValueError:
        print("❌ Invalid input!")
    except KeyboardInterrupt:
        print("\n❌ Cancelled by user")
    
    input("\nPress Enter to continue...")

def simulate_wordlist_generation():
    """Simulate wordlist generation for educational purposes"""
    print("📚 WORDLIST GENERATION EDUCATION")
    print("🔧 Crunch is a wordlist generator that creates all possible combinations")
    print("\n💡 Example usage:")
    print("crunch 4 4 0123456789 -o numbers.txt    # 4-digit numbers")
    print("crunch 6 8 abcdefghijklmnopqrstuvwxyz    # 6-8 char lowercase")
    print("crunch 8 8 -f charset.lst mixalpha      # Using charset file")
    print("\n⚠️  Considerations:")
    print("• File size grows exponentially")
    print("• 8-char mixed case = ~218 trillion combinations")
    print("• Use wisely to avoid filling storage")

def educational_wps():
    """Educational content about WPS attacks"""
    os.system("clear")
    print("\n📚 WPS ATTACK EDUCATION")
    print("="*50)
    print("📡 What is WPS (WiFi Protected Setup)?")
    print("A network security standard for easy WiFi network setup")
    print("\n🔍 WPS Attack Methods:")
    print("1. PIN Attack - Brute force 8-digit PIN")
    print("2. Pixie Dust - Exploit weak randomization")
    print("3. Push Button - Physical access required")
    print("\n⚙️  Normal attack tools:")
    print("• reaver -i wlan0mon -b AA:BB:CC:DD:EE:FF -vv")
    print("• bully -b AA:BB:CC:DD:EE:FF -c 6 --pixiewps wlan0mon")
    print("• wifite --wps-only")
    print("\n🚫 Why it doesn't work without root:")
    print("• Requires monitor mode")
    print("• Needs packet injection")
    print("• Direct hardware access required")
    print("\n🛡️  WPS Security Issues:")
    print("• 8-digit PIN = only 10^7 combinations (not 10^8)")
    print("• First 4 digits validated separately")
    print("• Weak pseudo-random number generators")
    print("• Rate limiting often ineffective")
    
    print("\n💡 Educational PIN Generation Simulation:")
    print("WPS PIN: 12345670 (checksum calculated)")
    print("First half: 1234")
    print("Second half: 567")
    print("Checksum: 0")
    
    input("\nPress Enter to continue...")

def network_info():
    """Display basic network information"""
    os.system("clear")
    print("\n🌐 BASIC NETWORK INFORMATION")
    print("="*50)
    
    try:
        print("📡 Network Interfaces:")
        os.system("ip addr show")
        
        print("\n📊 Routing Table:")
        os.system("ip route")
        
        print("\n🔍 Network Connectivity:")
        os.system("ping -c 4 8.8.8.8")
        
    except Exception as e:
        print(f"❌ Error getting network info: {e}")
    
    input("\nPress Enter to continue...")

def wifi_education():
    """Comprehensive WiFi security education"""
    os.system("clear")
    print("\n📚 WIFI SECURITY EDUCATION")
    print("="*50)
    print("🔐 WiFi Security Protocols:")
    print("• WEP - Deprecated, easily cracked")
    print("• WPA - Improved but vulnerable")  
    print("• WPA2 - Current standard, dictionary attacks")
    print("• WPA3 - Latest, more secure")
    print("\n🎯 Common Attack Vectors:")
    print("• Dictionary/Brute force attacks")
    print("• Evil twin attacks")
    print("• KRACK attacks (WPA2)")
    print("• Deauthentication attacks")
    print("• WPS PIN attacks")
    print("\n🛡️  Protection Measures:")
    print("• Use WPA3 when available")
    print("• Strong, unique passwords")
    print("• Disable WPS")
    print("• MAC address filtering")
    print("• Network segmentation")
    print("• Regular firmware updates")
    print("\n📖 Learning Resources:")
    print("• OWASP Wireless Security")
    print("• NIST Cybersecurity Framework")
    print("• WiFi Alliance Security")
    print("• Academic wireless security courses")
    
    input("\nPress Enter to continue...")

def system_info():
    """Display system information"""
    os.system("clear")
    print("\n⚙️  SYSTEM INFORMATION")
    print("="*50)
    
    print(f"🐍 Python Version: {sys.version}")
    print(f"💻 Platform: {platform.platform()}")
    print(f"🏗️  Architecture: {platform.architecture()}")
    
    if check_termux():
        print("📱 Running on: Termux")
        print("🔐 Root Status: Non-root (limited functionality)")
    else:
        print("💻 Running on: Standard Linux")
    
    print("\n📦 Environment Variables:")
    for key in ['PREFIX', 'HOME', 'PATH']:
        if key in os.environ:
            print(f"{key}: {os.environ[key][:60]}...")
    
    print("\n💾 Storage Info:")
    try:
        os.system("df -h")
    except:
        print("Could not retrieve storage information")
    
    input("\nPress Enter to continue...")

def about_section():
    """About section with credits and information"""
    os.system("clear")
    print("\n" + "="*70)
    print("ℹ️  ABOUT WIFI HACKING TOOL - TERMUX VERSION")
    print("="*70)
    print("📚 EDUCATIONAL PURPOSE ONLY")
    print("This tool is designed for learning WiFi security concepts")
    print("in environments where full penetration testing is not possible.")
    print("\n👨‍💻 Original Author: BlackHatHacker-Ankit")
    print("🔄 Modified for: Termux Non-Root compatibility")
    print("📅 Adaptation: 2024")
    print("\n🎯 What This Tool Teaches:")
    print("• WiFi security protocols and vulnerabilities")
    print("• Network reconnaissance concepts")
    print("• Password attack methodologies")
    print("• Wireless security best practices")
    print("• Penetration testing limitations")
    print("\n🚫 What This Tool Cannot Do (without root):")
    print("• Real WiFi network attacks")
    print("• Monitor mode activation")
    print("• Packet injection or capture")
    print("• Active penetration testing")
    print("\n⚖️  LEGAL DISCLAIMER:")
    print("Only use on networks you own or have explicit permission to test.")
    print("Unauthorized network attacks are illegal in most jurisdictions.")
    print("The authors are not responsible for misuse of this tool.")
    print("\n📞 Support:")
    print("• GitHub: Educational wireless security resources")
    print("• Learning: Focus on ethical hacking courses")
    print("• Practice: Use dedicated lab environments")
    print("="*70)
    
    input("\nPress Enter to continue...")

def main():
    """Main function"""
    if not check_termux():
        print("⚠️  This script is optimized for Termux.")
        print("Some features may not work as expected on other systems.")
        input("Press Enter to continue anyway...")
    
    try:
        intro()
    except KeyboardInterrupt:
        print("\n\n👋 Goodbye!")
        sys.exit(0)

if __name__ == "__main__":
    main()
