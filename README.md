# WiFi Hacking Tool - Termux Non-Root Version 📱

[![Python 3.6+](https://img.shields.io/badge/Python-3.6+-blue.svg)](https://www.python.org/downloads/)
[![Termux](https://img.shields.io/badge/Platform-Termux-green.svg)](https://termux.com/)
[![Educational](https://img.shields.io/badge/Purpose-Educational-yellow.svg)](#disclaimer)

Una versión adaptada de la herramienta WiFi Hacking para **Termux sin acceso root**, diseñada con fines educativos y para aprender conceptos de seguridad inalámbrica.

## ⚠️ LIMITACIONES IMPORTANTES

### 🚫 Sin acceso root, NO es posible:
- ✗ Activar modo monitor
- ✗ Capturar paquetes WiFi 
- ✗ Inyección de paquetes
- ✗ Ataques reales a redes WiFi
- ✗ Cambio de modos de interfaz

### ✅ Lo que SÍ puede hacer:
- ✓ Educación sobre seguridad WiFi
- ✓ Generación de listas de contraseñas
- ✓ Crackeo de hashes (si se proporcionan)
- ✓ Análisis de conceptos de seguridad
- ✓ Simulaciones educativas
- ✓ Información básica de red

## 🚀 Instalación en Termux

### Paso 1: Actualizar Termux
```bash
pkg update && pkg upgrade -y
```

### Paso 2: Instalar dependencias básicas
```bash
pkg install python git wget curl -y
```

### Paso 3: Clonar este repositorio
```bash
git clone https://github.com/[tu-usuario]/Wifi-Hacking-Termux.git
cd Wifi-Hacking-Termux
```

### Paso 4: Ejecutar la herramienta
```bash
python3 wifi_hacking_termux.py
```

## 🛠️ Herramientas Opcionales

Instala herramientas adicionales disponibles en Termux:

```bash
# Generador de listas de contraseñas
pkg install crunch

# Escáner de red básico
pkg install nmap

# Crackeador de hashes
pkg install john

# Herramientas adicionales
pkg install hashcat tsu
```

## 📚 Funcionalidades Educativas

### 1. Educación sobre Modo Monitor
Aprende qué es el modo monitor y por qué se requiere para auditorías WiFi reales.

### 2. Simulación de Descubrimiento de Redes
Simulación educativa de cómo se vería un escaneo real de redes WiFi.

### 3. Teoría de Captura de Handshakes
Explicación detallada del proceso de autenticación WPA/WPA2.

### 4. Generación de Wordlists
Crea listas personalizadas de contraseñas usando diferentes conjuntos de caracteres.

### 5. Educación sobre Ataques WPS
Aprende sobre vulnerabilidades WPS y métodos de ataque.

## 🎓 Propósito Educativo

Esta herramienta está diseñada para:

- **Estudiantes de ciberseguridad** que quieren aprender conceptos básicos
- **Profesionales IT** que necesitan entender vulnerabilidades WiFi
- **Entusiastas de la seguridad** sin acceso a laboratorios especializados
- **Educadores** que enseñan seguridad de redes inalámbricas

## 🔧 Para Pruebas Reales

Si necesitas realizar pruebas reales de penetración WiFi:

### Opciones Recomendadas:
1. **Dispositivo Android rooteado** con Kali NetHunter
2. **Adaptador WiFi USB** con soporte para modo monitor
3. **Distribución de pentesting** dedicada (Kali Linux, Parrot OS)
4. **Laboratorio virtual** con hardware compatible

### Adaptadores WiFi Recomendados:
- **Alfa AWUS036ACS** - USB 3.0, dual band
- **Panda PAU09** - Económico, compatible
- **Alfa AWUS036NHA** - Clásico, muy compatible

## 📖 Recursos de Aprendizaje

### Cursos Recomendados:
- [OWASP Wireless Security](https://owasp.org/www-project-wireless-top-10/)
- [WiFi Alliance Security](https://www.wi-fi.org/security)
- Certified Ethical Hacker (CEH)
- Offensive Security Certified Professional (OSCP)

### Libros:
- "Hacking Exposed Wireless" por Johnny Cache
- "WiFi Security" por Stewart Miller
- "The Wireless Hacking Handbook" por Matthew Neely

## 🚨 Consideraciones Legales

### ✅ Uso Permitido:
- Redes propias
- Laboratorios educativos
- Redes con permiso explícito por escrito
- Ambientes de prueba controlados

### 🚫 Uso Prohibido:
- Redes ajenas sin autorización
- Acceso no autorizado a sistemas
- Interrupción de servicios de red
- Cualquier actividad ilegal

## 🔒 Mejores Prácticas de Seguridad WiFi

### Para Administradores de Red:
1. **Usar WPA3** cuando esté disponible
2. **Contraseñas robustas** (12+ caracteres, mixtos)
3. **Deshabilitar WPS** si no es necesario
4. **Filtrado MAC** como medida adicional
5. **Monitoreo regular** de actividad de red
6. **Actualizaciones de firmware** periódicas

### Para Usuarios:
1. **Evitar redes WiFi públicas** para datos sensibles
2. **Usar VPN** en redes no confiables
3. **Verificar certificados** de sitios web
4. **Mantener dispositivos actualizados**

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Añade nueva funcionalidad educativa'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

### Tipos de Contribuciones Buscadas:
- Nuevo contenido educativo
- Mejoras en la documentación
- Simulaciones más realistas
- Soporte para más herramientas de Termux
- Traducciones a otros idiomas

## 📞 Soporte

- **Issues**: Reporta bugs o solicita funcionalidades
- **Discusiones**: Para preguntas generales sobre WiFi security
- **Wiki**: Documentación extendida y tutoriales

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ve el archivo [LICENSE](LICENSE) para más detalles.

## 🙏 Reconocimientos

- **BlackHatHacker-Ankit** - Autor original de Wifi-Hacking
- **Termux Team** - Por la increíble terminal Android
- **Comunidad de Seguridad** - Por recursos y conocimiento compartido

## ⚖️ Disclaimer Legal

**SOLO PARA FINES EDUCATIVOS**

Esta herramienta es únicamente para educación y concienciación sobre seguridad. Los usuarios son completamente responsables de cumplir con todas las leyes locales, estatales y federales aplicables.

El uso no autorizado de esta herramienta en redes que no son de tu propiedad puede violar leyes locales y federales. Los desarrolladores no son responsables del uso indebido de esta herramienta.

**UTILÍZALA ÉTICAMENTE - APRENDE RESPONSABLEMENTE**

---

## 📊 Estadísticas del Proyecto

![Contributors](https://img.shields.io/github/contributors/[tu-usuario]/Wifi-Hacking-Termux)
![Stars](https://img.shields.io/github/stars/[tu-usuario]/Wifi-Hacking-Termux)
![Forks](https://img.shields.io/github/forks/[tu-usuario]/Wifi-Hacking-Termux)
![Issues](https://img.shields.io/github/issues/[tu-usuario]/Wifi-Hacking-Termux)

**¡Dale una ⭐ si este proyecto te ayudó a aprender sobre seguridad WiFi!**
