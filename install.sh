#!/data/data/com.termux/files/usr/bin/bash

# 🎉 LA HERRAMIENTA DEL PAPU - INSTALADOR AUTOMÁTICO
# ==================================================
# Script de instalación de un solo comando para Termux
# Uso: wget -qO- https://raw.githubusercontent.com/MikeDioSystem2/la-herramienta-del-papu/main/install.sh | bash

clear
echo "🎉 LA HERRAMIENTA DEL PAPU - INSTALADOR AUTOMÁTICO"
echo "=================================================="
echo "🚀 Instalando automáticamente en Termux..."
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
    echo -e "${RED}❌ Error: Este script debe ejecutarse en Termux!${NC}"
    echo "📲 Descarga Termux desde F-Droid o Google Play Store"
    echo "🔗 Luego ejecuta este script dentro de Termux"
    exit 1
fi

echo -e "${GREEN}✅ Termux detectado!${NC}"
echo

# Request storage permissions
echo -e "${BLUE}📁 Configurando permisos de almacenamiento...${NC}"
termux-setup-storage

# Update system
echo -e "${BLUE}⬆️  Actualizando Termux...${NC}"
pkg update -y && pkg upgrade -y

# Install essential packages
echo -e "${BLUE}📦 Instalando herramientas esenciales...${NC}"
pkg install -y python python3 git wget curl which nano vim termux-api

# Install optional tools
echo -e "${BLUE}🔧 Instalando herramientas de seguridad...${NC}"
pkg install -y nmap crunch john hashcat tsu proot 2>/dev/null || true

# Install Python packages
echo -e "${BLUE}🐍 Instalando paquetes de Python...${NC}"
pip install --upgrade pip
pip install requests colorama scapy 2>/dev/null || true

# Create directories
echo -e "${BLUE}📁 Creando directorios...${NC}"
mkdir -p ~/la-herramienta-del-papu
mkdir -p ~/wordlists
mkdir -p ~/captures

# Download the project
echo -e "${BLUE}⬇️  Descargando La Herramienta del Papu...${NC}"
cd ~
git clone https://github.com/MikeDioSystem2/la-herramienta-del-papu.git la-herramienta-del-papu

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Descarga exitosa!${NC}"
else
    echo -e "${RED}❌ Error en la descarga. Intentando método alternativo...${NC}"
    wget -qO- https://github.com/MikeDioSystem2/la-herramienta-del-papu/archive/refs/heads/main.zip > papu.zip
    pkg install unzip -y
    unzip papu.zip
    mv la-herramienta-del-papu-main la-herramienta-del-papu
    rm papu.zip
fi

cd ~/la-herramienta-del-papu

# Set permissions
echo -e "${BLUE}🔐 Configurando permisos...${NC}"
chmod +x *.py 2>/dev/null || true
chmod +x *.sh 2>/dev/null || true

# Create quick launch script
echo -e "${BLUE}🚀 Creando lanzador rápido...${NC}"
cat > ~/papu << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/la-herramienta-del-papu
python3 wifi_hacking_termux.py
EOF
chmod +x ~/papu

# Create alias for easier access
echo 'alias papu="~/papu"' >> ~/.bashrc

# Download sample wordlists
echo -e "${BLUE}📝 Descargando wordlists de ejemplo...${NC}"
cd ~/wordlists
wget -q "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt" -O common_passwords.txt 2>/dev/null || echo "⚠️ Wordlist externa no disponible"

# Create basic wordlists
echo -e "${BLUE}📝 Creando wordlists básicas...${NC}"
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
12345678
abc123
111111
1234567
sunshine
EOF

# Run test
echo -e "${BLUE}🧪 Ejecutando prueba de instalación...${NC}"
cd ~/la-herramienta-del-papu
python3 test_installation.py 2>/dev/null || echo "⚠️ Script de prueba no encontrado"

echo
echo -e "${GREEN}🎉 ¡INSTALACIÓN COMPLETADA EXITOSAMENTE!${NC}"
echo "=============================================="
echo
echo -e "${PURPLE}🚀 COMANDOS PARA USAR LA HERRAMIENTA:${NC}"
echo "• ${YELLOW}papu${NC} - Lanzar la herramienta (desde cualquier lugar)"
echo "• ${YELLOW}~/papu${NC} - Comando alternativo"
echo "• ${YELLOW}cd ~/la-herramienta-del-papu && python3 wifi_hacking_termux.py${NC}"
echo
echo -e "${PURPLE}📁 DIRECTORIOS IMPORTANTES:${NC}"
echo "• Proyecto: ~/la-herramienta-del-papu/"
echo "• Wordlists: ~/wordlists/"
echo "• Capturas: ~/captures/"
echo
echo -e "${PURPLE}📱 TIPS PARA MÓVIL:${NC}"
echo "• Usa Volumen ↑ + Q para salir de programas"
echo "• Desliza desde el borde izquierdo para teclado especial"
echo "• Mantén presionado para copiar/pegar"
echo
echo -e "${RED}⚠️  RECORDATORIO LEGAL:${NC}"
echo "• Solo para fines educativos"
echo "• Usa únicamente en tus propias redes"
echo "• Respeta las leyes locales y regulaciones"
echo
echo -e "${GREEN}✅ ¡LA HERRAMIENTA DEL PAPU ESTÁ LISTA!${NC}"
echo "Escribe: ${YELLOW}papu${NC} para comenzar"
echo

# Auto-launch option
echo -e "${BLUE}¿Quieres ejecutar La Herramienta del Papu ahora? (s/N)${NC}"
read -t 10 -r response
if [[ $response =~ ^[SsYy]$ ]]; then
    echo -e "${GREEN}🚀 Iniciando La Herramienta del Papu...${NC}"
    sleep 2
    ~/papu
fi
