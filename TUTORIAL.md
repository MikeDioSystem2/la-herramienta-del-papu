# Tutorial: WiFi Hacking Tool para Termux 📚

Este tutorial te guiará paso a paso para usar la herramienta de WiFi Hacking en Termux de manera educativa y ética.

## 📋 Tabla de Contenidos

1. [Preparación del Entorno](#preparación-del-entorno)
2. [Instalación](#instalación)  
3. [Primer Uso](#primer-uso)
4. [Módulos Educativos](#módulos-educativos)
5. [Funciones Prácticas](#funciones-prácticas)
6. [Limitaciones y Alternativas](#limitaciones-y-alternativas)
7. [Mejores Prácticas](#mejores-prácticas)

## 🚀 Preparación del Entorno

### Paso 1: Configurar Termux

```bash
# Actualizar repositorios
pkg update && pkg upgrade -y

# Otorgar permisos de almacenamiento
termux-setup-storage

# Verificar que Python esté instalado
python3 --version
```

### Paso 2: Verificar Conectividad

```bash
# Probar conexión a internet
ping -c 4 google.com

# Verificar interfaces de red disponibles
ip addr show
```

## 📦 Instalación

### Método 1: Script Automático

```bash
# Descargar y ejecutar script de instalación
curl -O https://raw.githubusercontent.com/[tu-usuario]/Wifi-Hacking-Termux/main/install_termux.sh
chmod +x install_termux.sh
./install_termux.sh
```

### Método 2: Instalación Manual

```bash
# Clonar repositorio
git clone https://github.com/[tu-usuario]/Wifi-Hacking-Termux.git
cd Wifi-Hacking-Termux

# Instalar dependencias
pkg install python crunch nmap john -y
pip install -r requirements.txt

# Hacer ejecutable
chmod +x wifi_hacking_termux.py
```

## 🎯 Primer Uso

### Ejecutar la Herramienta

```bash
cd Wifi-Hacking-Termux
python3 wifi_hacking_termux.py
```

### Navegación del Menú

- Usa números para seleccionar opciones
- Presiona `Ctrl+C` para cancelar procesos
- Sigue las instrucciones en pantalla

## 📚 Módulos Educativos

### 1. Educación sobre Modo Monitor

**Qué aprenderás:**
- Concepto de modo monitor
- Por qué se necesita para auditorías WiFi
- Limitaciones en Android sin root

**Cómo usarlo:**
1. Ejecuta la opción `(1) Learn about Monitor Mode`
2. Lee la explicación detallada
3. Comprende las limitaciones técnicas

### 2. Simulación de Descubrimiento de Redes

**Qué aprenderás:**
- Cómo se ven los resultados de escaneo WiFi
- Interpretación de BSSID, ESSID, canales
- Identificación de tipos de seguridad

**Ejemplo de salida:**
```
BSSID              ESSID                 Channel  Power  Security
-----------------------------------------------------------------
00:11:22:33:44:55  Home_WiFi_Example     6        -45    WPA2
AA:BB:CC:DD:EE:FF  Office_Network        11       -62    WPA2-Enterprise
```

### 3. Teoría de Captura de Handshakes

**Conceptos clave:**
- Proceso de autenticación WPA/WPA2
- 4-way handshake explicado
- Por qué se necesitan handshakes para cracking

**Proceso teórico:**
```
1. AP → Client: ANonce (número aleatorio)
2. Client → AP: SNonce + MIC  
3. AP → Client: GTK + MIC
4. Client → AP: Confirmación
```

## 🔧 Funciones Prácticas

### Generación de Wordlists

**Paso a paso:**

1. Selecciona opción `(8) Generate Custom Wordlist`
2. Ingresa longitud mínima y máxima:
   ```
   Minimum length: 6
   Maximum length: 8
   ```
3. Elige conjunto de caracteres:
   ```
   1) Lowercase letters
   2) Uppercase letters  
   3) Numbers only
   4) Lowercase + numbers
   5) Mixed case + numbers
   ```
4. Especifica archivo de salida:
   ```
   Output file: ~/wordlists/custom.txt
   ```

**Ejemplo con crunch:**
```bash
crunch 6 8 abcdefghijklmnopqrstuvwxyz0123456789 -o wordlist.txt
```

### Análisis de Hashes (Si Disponible)

Si tienes un hash para practicar:

1. Coloca el hash en un archivo: `echo "hash_aqui" > hash.txt`
2. Usa la opción `(7) Crack Hash with John`
3. Proporciona la ruta del archivo de hash

## 🚫 Limitaciones y Alternativas

### Lo que NO Funciona sin Root:

| Función | Por qué no funciona | Alternativa |
|---------|---------------------|-------------|
| Modo Monitor | Requiere acceso a drivers | Usar VM con adaptador USB |
| Captura de paquetes | Permisos de hardware | Estudiar archivos .pcap existentes |
| Inyección de paquetes | Acceso directo a interfaz | Simulaciones educativas |
| Ataques WPS | Hardware + privilegios | Laboratorio controlado |

### Configuración de Laboratorio Real:

**Opción 1: Adaptador WiFi USB**
```bash
# En Kali Linux con adaptador compatible
airmon-ng start wlan1
airodump-ng wlan1mon
```

**Opción 2: Kali NetHunter (Root)**
- Instalar en dispositivo rooteado
- Usar adaptador WiFi externo
- Acceso completo a herramientas

**Opción 3: Máquina Virtual**
- VirtualBox/VMware con Kali Linux  
- Adaptador WiFi USB pass-through
- Ambiente controlado y seguro

## 🛡️ Mejores Prácticas

### Para Aprendizaje Ético:

1. **Solo redes propias:**
   - Configura un router de prueba
   - Usa diferentes tipos de seguridad
   - Practica en ambiente controlado

2. **Documentación:**
   - Lleva registro de lo aprendido
   - Documenta configuraciones probadas
   - Anota resultados y tiempos

3. **Progresión gradual:**
   - Comienza con WEP (más fácil)
   - Avanza a WPA/WPA2
   - Estudia WPA3 y nuevas tecnologías

### Configuración de Router de Prueba:

```bash
# Configuraciones sugeridas para aprendizaje:
Router 1: WEP (deliberadamente vulnerable)
Router 2: WPA2 con contraseña débil  
Router 3: WPA2 con contraseña fuerte
Router 4: WPA3 (si disponible)
```

## 🎓 Ejercicios Prácticos

### Ejercicio 1: Análisis de Seguridad
1. Ejecuta simulación de descubrimiento
2. Identifica tipos de seguridad mostrados
3. Clasifica redes por nivel de vulnerabilidad

### Ejercicio 2: Generación de Wordlists
1. Crea wordlist de 4 dígitos numéricos
2. Genera lista con letras minúsculas 6-8 caracteres  
3. Combina números y letras para lista personalizada

### Ejercicio 3: Investigación Teórica
1. Investiga diferencias entre WPA2 y WPA3
2. Estudia vulnerabilidades conocidas (KRACK, etc.)
3. Documenta métodos de protección modernos

## 📊 Métricas de Aprendizaje

### Conocimientos Básicos ✅
- [ ] Entender modo monitor
- [ ] Conocer tipos de cifrado WiFi
- [ ] Identificar vulnerabilidades comunes

### Conocimientos Intermedios ⚙️
- [ ] Comprender proceso de handshake
- [ ] Saber generar wordlists efectivas
- [ ] Entender limitaciones técnicas

### Conocimientos Avanzados 🎯
- [ ] Planificar auditorías completas
- [ ] Configurar laboratorios de prueba
- [ ] Implementar contramedidas

## 🆘 Solución de Problemas

### Errores Comunes:

**Error: "Command not found"**
```bash
# Verificar instalación
which python3
which crunch
pkg list-installed
```

**Error: "Permission denied"**
```bash
# Verificar permisos
chmod +x wifi_hacking_termux.py
ls -la wifi_hacking_termux.py
```

**Error: "Module not found"**
```bash
# Instalar dependencias Python
pip install -r requirements.txt
pip install colorama requests
```

### Obtener Ayuda:

1. **Documentación**: Lee el README.md completo
2. **Issues**: Reporta bugs en GitHub
3. **Comunidad**: Participa en foros de seguridad
4. **Cursos**: Considera cursos formales de ciberseguridad

## 🎉 ¡Felicidades!

Has completado el tutorial básico. Ahora estás listo para:

- Usar la herramienta educativa de manera responsable
- Comprender las limitaciones técnicas
- Planificar tu progreso en ciberseguridad
- Configurar un laboratorio de pruebas real

## 📞 Soporte y Recursos

- **GitHub**: Issues y discusiones
- **Documentación**: Wiki del proyecto  
- **Comunidad**: Grupos de Telegram/Discord de ciberseguridad
- **Cursos**: CEH, OSCP, Security+ 

---

**Recuerda: La ciberseguridad es un campo en constante evolución. Mantente actualizado, practica éticamente, y nunca dejes de aprender. 🚀**
