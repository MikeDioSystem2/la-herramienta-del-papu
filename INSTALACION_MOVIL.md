# 📱 Instalación en Dispositivos Móviles

## 🚀 Instalación Rápida - Un Solo Comando

### 📲 Paso 1: Instalar Termux
1. **Descargar Termux:**
   - 🏪 **F-Droid** (recomendado): [f-droid.org](https://f-droid.org/en/packages/com.termux/)
   - 🏪 **Google Play**: [play.google.com](https://play.google.com/store/apps/details?id=com.termux)

2. **Abrir Termux** en tu teléfono

### 📂 Paso 2: Descomprimir e Instalar

#### Opción A: Instalación Automática (Recomendada)
```bash
# Copia y pega este comando en Termux:
pkg update -y && pkg install wget -y && wget -O install.sh https://[tu-link]/quick_install.sh && chmod +x install.sh && ./install.sh
```

#### Opción B: Desde archivo ZIP descargado
1. **Descomprimir** el archivo `Wifi-Hacking-Termux.zip`
2. **Mover** la carpeta a la memoria interna
3. **En Termux:**
   ```bash
   # Permitir acceso al almacenamiento
   termux-setup-storage
   
   # Navegar a la carpeta descomprimida
   cd ~/storage/shared/Download/Wifi-Hacking-Termux/
   
   # Ejecutar instalador rápido
   chmod +x quick_install.sh
   ./quick_install.sh
   ```

### 🎉 Paso 3: Ejecutar
Después de la instalación, simplemente ejecuta:
```bash
~/wifi-hack
```

---

## 📱 Guía Visual Móvil

### 🎯 Controles de Termux en Móvil

| Acción | Cómo Hacerlo |
|---------|--------------|
| **Copiar texto** | Mantener presionado → Seleccionar → Copiar |
| **Pegar** | Mantener presionado → Pegar |
| **Teclado especial** | Deslizar desde el borde izquierdo |
| **Salir de programa** | Volumen ↑ + Q |
| **Nueva sesión** | Deslizar desde borde izquierdo → Nueva sesión |
| **Zoom** | Pellizcar pantalla |

### 📋 Teclas Especiales

En Termux, usa la **fila de teclas extra**:
- `CTRL` - Para comandos como Ctrl+C
- `ALT` - Para caracteres especiales
- `TAB` - Autocompletar comandos
- `ESC` - Cancelar entrada actual

### 🔧 Comandos Útiles Móviles

```bash
# Lanzar herramienta desde cualquier lugar
~/wifi-hack

# Ver archivos del proyecto
ls ~/wifi-hacking-mobile/

# Ver wordlists disponibles
ls ~/wordlists/

# Verificar instalación
python3 ~/wifi-hacking-mobile/test_installation.py

# Actualizar herramientas
pkg update && pkg upgrade

# Reiniciar instalación
~/wifi-hacking-mobile/quick_install.sh
```

---

## 🛠️ Resolución de Problemas Móviles

### ❌ Error: "Command not found"
```bash
# Instalar paquetes básicos
pkg install python git wget curl

# Verificar Python
python3 --version
```

### ❌ Error: "Permission denied"
```bash
# Dar permisos a archivos
chmod +x ~/wifi-hacking-mobile/*.sh
chmod +x ~/wifi-hacking-mobile/*.py
```

### ❌ Error: "No such file or directory"
```bash
# Verificar ubicación
pwd
ls -la

# Ir a directorio correcto
cd ~/wifi-hacking-mobile/
```

### ❌ Termux se cierra inesperadamente
1. **Abrir Configuración** de Android
2. **Apps** → **Termux**
3. **Batería** → **Optimización** → **No optimizar**
4. **Permisos** → **Almacenamiento** → **Permitir**

### 📱 Problemas de Memoria
```bash
# Limpiar caché
pkg clean

# Ver espacio disponible
df -h

# Eliminar archivos temporales
rm -rf ~/temp/*
rm -rf ~/.cache/*
```

---

## 🎓 Uso Óptimo en Móviles

### 📲 Configuración Recomendada
1. **Orientación:** Horizontal para mejor visibilidad
2. **Zoom:** Ajustar para lectura cómoda
3. **Teclado:** Usar teclado completo cuando esté disponible
4. **Notificaciones:** Permitir para Termux

### 🔋 Ahorro de Batería
```bash
# Configurar CPU para menor consumo
echo 'powersave' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Usar modo nocturno
# Configurar en: Termux → Preferencias → Apariencia
```

### 📊 Mejores Prácticas Móviles
- **Texto pequeño:** Aumentar zoom si es necesario
- **Sesiones múltiples:** Usar varias sesiones para diferentes tareas
- **Copiar/Pegar:** Practicar gestos para eficiencia
- **Respaldo:** Hacer backup de wordlists importantes

---

## 🚨 Limitaciones Móviles Importantes

### 🚫 Lo que NO funciona en móviles:
- **Monitor mode** (limitación de Android)
- **Packet injection** (requiere root y hardware específico)
- **Ataques WiFi reales** (restricciones del sistema)
- **Acceso directo a interfaces** (seguridad de Android)

### ✅ Lo que SÍ funciona perfectamente:
- **Educación completa** sobre WiFi security
- **Generación de wordlists**
- **Crackeo de hashes** (archivos proporcionados)
- **Simulaciones realistas**
- **Análisis de red básico**
- **Aprendizaje interactivo**

---

## 📞 Soporte Móvil

### 🆘 Si necesitas ayuda:
1. **Verificar** instalación con `python3 test_installation.py`
2. **Revisar** este archivo README_MOVIL.md
3. **Consultar** TUTORIAL.md para uso paso a paso
4. **Reportar** problemas en GitHub Issues

### 💡 Tips de Experto:
- **Practica** comandos básicos de Linux primero
- **Lee** toda la documentación disponible  
- **Experimenta** con las simulaciones
- **Aprende** sobre redes WiFi teóricamente primero
- **Configura** un laboratorio legal para pruebas reales

---

## 🎯 Próximos Pasos

Después de instalar exitosamente:

1. **📖 Lee** el TUTORIAL.md completo
2. **🧪 Ejecuta** test_installation.py  
3. **🎓 Comienza** con módulos educativos
4. **📝 Practica** generación de wordlists
5. **🔒 Aprende** sobre seguridad WiFi responsablemente

**¡Disfruta aprendiendo sobre ciberseguridad de manera ética! 🔐📱**
