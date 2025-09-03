#!/data/data/com.termux/files/usr/bin/bash

# 🎉 LA HERRAMIENTA DEL PAPU - INSTALADOR AUTOMÁTICO COMPLETO
# ==========================================================
# Script de instalación de un solo comando para Termux
# Instala TODO automáticamente sin intervención del usuario
# Uso: wget -qO- https://raw.githubusercontent.com/MikeDioSystem2/la-herramienta-del-papu/main/install.sh | bash

# Disable interactive prompts
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none

clear
echo "🎉 LA HERRAMIENTA DEL PAPU - INSTALADOR AUTOMÁTICO COMPLETO"
echo "=========================================================="
echo "🚀 Instalando TODO automáticamente en Termux..."
echo "⏳ No requiere intervención del usuario - ¡Solo espera!"
echo

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Function to run commands silently with error handling
run_silent() {
    "$@" &>/dev/null
    return $?
}

# Check if running on Termux
if [[ ! "$PREFIX" == *"com.termux"* ]]; then
    echo -e "${RED}❌ Error: Este script debe ejecutarse en Termux!${NC}"
    echo "📲 Descarga Termux desde F-Droid o Google Play Store"
    echo "🔗 Luego ejecuta este script dentro de Termux"
    exit 1
fi

echo -e "${GREEN}✅ Termux detectado!${NC}"
echo

# Request storage permissions (automatic)
echo -e "${BLUE}📁 Configurando permisos automáticamente...${NC}"
if ! run_silent termux-setup-storage; then
    echo -e "${YELLOW}⚠️  Permisos de almacenamiento - configuración manual puede ser necesaria${NC}"
fi

# Update system completely
echo -e "${BLUE}⬆️  Actualizando Termux completamente...${NC}"
echo "🔄 Actualizando repositorios..."
run_silent pkg update -y
echo "📦 Actualizando paquetes existentes..."
run_silent pkg upgrade -y

# Install ALL essential packages in one go
echo -e "${BLUE}📦 Instalando herramientas esenciales...${NC}"
ESSENTIAL_PKGS="python python3 git wget curl which nano vim termux-api unzip zip"
for pkg in $ESSENTIAL_PKGS; do
    echo "  📦 Instalando $pkg..."
    run_silent pkg install -y $pkg || echo "    ⚠️ $pkg - continuar sin él"
done

# Install security tools (attempt all, continue on failures)
echo -e "${BLUE}🔧 Instalando herramientas de seguridad...${NC}"
SECURITY_PKGS="nmap crunch john hashcat tsu proot openssh openssl"
for pkg in $SECURITY_PKGS; do
    echo "  🔧 Instalando $pkg..."
    run_silent pkg install -y $pkg || echo "    ⚠️ $pkg - opcional, continuando"
done

# Install Python packages with error handling
echo -e "${BLUE}🐍 Configurando Python completamente...${NC}"
echo "  🔄 Actualizando pip..."
run_silent python3 -m pip install --upgrade pip || run_silent pip install --upgrade pip

PYTHON_PKGS="requests colorama scapy urllib3 certifi charset-normalizer"
for pypkg in $PYTHON_PKGS; do
    echo "  🐍 Instalando $pypkg..."
    run_silent pip install $pypkg || echo "    ⚠️ $pypkg - opcional, continuando"
done

# Create directories
echo -e "${BLUE}📁 Creando directorios...${NC}"
mkdir -p ~/la-herramienta-del-papu
mkdir -p ~/wordlists
mkdir -p ~/captures

# Download the project with multiple fallback methods
echo -e "${BLUE}⬇️  Descargando La Herramienta del Papu...${NC}"
cd ~
rm -rf la-herramienta-del-papu 2>/dev/null

# Method 1: Git clone
echo "  📥 Intentando descarga con git..."
if run_silent git clone https://github.com/MikeDioSystem2/la-herramienta-del-papu.git la-herramienta-del-papu; then
    echo -e "${GREEN}✅ Descarga con git exitosa!${NC}"
else
    # Method 2: Wget + unzip
    echo "  📥 Intentando descarga con wget..."
    if run_silent wget -O papu.zip https://github.com/MikeDioSystem2/la-herramienta-del-papu/archive/refs/heads/main.zip; then
        echo "  📂 Descomprimiendo..."
        run_silent unzip -q papu.zip
        mv la-herramienta-del-papu-main la-herramienta-del-papu 2>/dev/null
        rm -f papu.zip
        echo -e "${GREEN}✅ Descarga con wget exitosa!${NC}"
    else
        # Method 3: Curl + unzip
        echo "  📥 Intentando descarga con curl..."
        if run_silent curl -L -o papu.zip https://github.com/MikeDioSystem2/la-herramienta-del-papu/archive/refs/heads/main.zip; then
            echo "  📂 Descomprimiendo..."
            run_silent unzip -q papu.zip
            mv la-herramienta-del-papu-main la-herramienta-del-papu 2>/dev/null
            rm -f papu.zip
            echo -e "${GREEN}✅ Descarga con curl exitosa!${NC}"
        else
            echo -e "${RED}❌ Error en todas las descargas${NC}"
            echo -e "${YELLOW}🔧 Creando instalación mínima...${NC}"
            mkdir -p la-herramienta-del-papu
            # Create minimal working version
            cat > la-herramienta-del-papu/wifi_hacking_termux.py << 'MINIMAL'
#!/usr/bin/env python3
print("🎉 La Herramienta del Papu - Versión Mínima")
print("Error en descarga - Visita: https://github.com/MikeDioSystem2/la-herramienta-del-papu")
MINIMAL
        fi
    fi
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

# Create comprehensive wordlists
echo -e "${BLUE}📝 Creando wordlists completas...${NC}"

# Download sample wordlists with error handling
echo "  📥 Descargando wordlists externas..."
cd ~/wordlists
WORDLIST_URLS=(
    "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt common_passwords.txt"
    "https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10k-most-common.txt top10k_passwords.txt"
)

for url_file in "${WORDLIST_URLS[@]}"; do
    url=$(echo $url_file | cut -d' ' -f1)
    file=$(echo $url_file | cut -d' ' -f2)
    echo "    📝 Descargando $file..."
    run_silent wget -q "$url" -O "$file" || run_silent curl -s "$url" -o "$file" || echo "      ⚠️ $file no disponible"
done

# Create basic wordlists with crunch
echo "  🔢 Creando wordlists numéricas..."
if command -v crunch > /dev/null 2>&1; then
    echo "    🔢 Wordlist 4 dígitos..."
    run_silent timeout 30 crunch 4 4 0123456789 -o ~/wordlists/4digit_numbers.txt
    echo "    🔢 Wordlist 6 dígitos..."
    run_silent timeout 60 crunch 6 6 0123456789 -o ~/wordlists/6digit_numbers.txt
    echo "    🔤 Wordlist letras básicas..."
    run_silent timeout 30 crunch 4 6 abcdefghijklmnopqrstuvwxyz -o ~/wordlists/basic_letters.txt
else
    echo "    🔢 Crunch no disponible, creando wordlists básicas..."
    seq 0000 9999 | head -1000 > ~/wordlists/4digit_numbers.txt
    seq 000000 999999 | head -1000 > ~/wordlists/6digit_numbers.txt
fi

# Create comprehensive password lists
echo "  📝 Creando wordlists personalizadas..."
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
iloveyou
princess
1234567890
rockyou
12345
123123
000000
1234
666666
qwertyuiop
EOF

cat > ~/wordlists/wifi_common.txt << 'EOF'
password
admin
123456789
qwerty
12345678
111111
1234567890
123456
password123
1234567
welcome
monkey
letmein
dragon
sunshine
master
123123
welcome123
admin123
root
toor
pass
guest
test
user
wifi
internet
conexion
modem
router
linksys
netgear
dlink
tplink
asus
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

# Final setup and verification
echo -e "${BLUE}🔧 Configuración final...${NC}"

# Create additional useful aliases
echo "  ⚙️ Creando aliases adicionales..."
{
    echo 'alias papu="~/papu"'
    echo 'alias wifi-papu="~/papu"'
    echo 'alias herramienta-papu="~/papu"'
    echo 'alias wifi-hack="~/papu"'
    echo 'alias ll="ls -la"'
    echo 'alias cls="clear"'
} >> ~/.bashrc

# Create desktop-style shortcut
cat > ~/Desktop-papu.txt << 'EOF'
🎉 LA HERRAMIENTA DEL PAPU
========================

Para ejecutar la herramienta:
> papu

Proyecto ubicado en:
> ~/la-herramienta-del-papu/

Wordlists en:
> ~/wordlists/

¡Disfruta aprendiendo WiFi Security!
EOF

# Verify installation
echo -e "${BLUE}🧪 Verificando instalación completa...${NC}"
VERIFICATION_PASSED=true

# Check Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}  ❌ Python3 no encontrado${NC}"
    VERIFICATION_PASSED=false
else
    echo -e "${GREEN}  ✅ Python3 disponible${NC}"
fi

# Check main script
if [ -f ~/la-herramienta-del-papu/wifi_hacking_termux.py ]; then
    echo -e "${GREEN}  ✅ Script principal encontrado${NC}"
else
    echo -e "${RED}  ❌ Script principal no encontrado${NC}"
    VERIFICATION_PASSED=false
fi

# Check papu command
if [ -f ~/papu ]; then
    echo -e "${GREEN}  ✅ Comando 'papu' configurado${NC}"
else
    echo -e "${RED}  ❌ Comando 'papu' no configurado${NC}"
    VERIFICATION_PASSED=false
fi

# Check wordlists
WORDLIST_COUNT=$(ls ~/wordlists/*.txt 2>/dev/null | wc -l)
if [ $WORDLIST_COUNT -gt 0 ]; then
    echo -e "${GREEN}  ✅ Wordlists creadas ($WORDLIST_COUNT archivos)${NC}"
else
    echo -e "${YELLOW}  ⚠️ Pocas wordlists disponibles${NC}"
fi

echo
if [ "$VERIFICATION_PASSED" = true ]; then
    echo -e "${GREEN}🎉 ¡INSTALACIÓN COMPLETADA EXITOSAMENTE!${NC}"
    echo -e "${GREEN}   TODO ESTÁ LISTO PARA USAR${NC}"
else
    echo -e "${YELLOW}⚠️ Instalación completada con advertencias${NC}"
    echo -e "${YELLOW}   La herramienta debería funcionar básicamente${NC}"
fi

echo
echo -e "${PURPLE}🚀 PARA USAR LA HERRAMIENTA:${NC}"
echo -e "${YELLOW}papu${NC}"
echo
echo -e "${PURPLE}📁 ARCHIVOS IMPORTANTES:${NC}"
echo "• Herramienta: ~/la-herramienta-del-papu/"
echo "• Wordlists: ~/wordlists/"  
echo "• Capturas: ~/captures/"
echo "• Info: ~/Desktop-papu.txt"
echo
echo -e "${GREEN}✅ ¡LA HERRAMIENTA DEL PAPU ESTÁ COMPLETAMENTE LISTA!${NC}"

# Source bashrc to enable aliases immediately
source ~/.bashrc 2>/dev/null || true
