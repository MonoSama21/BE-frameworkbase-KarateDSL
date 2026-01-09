# 🥋 Guía Rápida - Plataforma Karate Testing

## 🚀 Inicio Rápido (3 pasos)

### 1. Obtén tu Token de GitHub
```
https://github.com/settings/tokens/new?scopes=repo,workflow
```
Genera un token con permisos: `repo` + `workflow`

---

### 2. Abre la Plataforma
```
https://MonoSama21.github.io/BE-frameworkbase-KarateDSL/
```

---

### 3. Ejecuta las Pruebas
1. Pega tu token
2. Selecciona un tag:
   - `@dailyTests` → Suite completa
   - `@postLoginRolDirectivo` → Login directivo
   - `@misDatos` → Datos de usuario
3. Elige ambiente: **QA** o **DEV**
4. Ingresa tu correo
5. Click **"🚀 Ejecutar Pruebas"**

---

## 📧 Recibirás 2 correos:

### 🔵 Email 1: Inicio
```
✉️ Asunto: 🔵 Inicio de Pruebas Karate – @dailyTests
```
Confirmación de que las pruebas iniciaron.

### 🟢 Email 2: Resultados
```
✉️ Asunto: 🟢 Resultados de Pruebas Karate – @dailyTests
```
Contiene:
- ✅ Estado general (PASSED/FAILED)
- 📊 Tabla de escenarios con colores
- 🌐 Link al reporte HTML completo
- 📦 Link a artifacts en GitHub

---

## 🏷️ Tags Disponibles

| Tag | Descripción | Tiempo estimado |
|-----|-------------|-----------------|
| `@dailyTests` | Suite completa de validación | 10-15 min |
| `@postLoginRolAuxiliar` | Login rol auxiliar | 2-3 min |
| `@postLoginRolDirectivo` | Login rol directivo | 2-3 min |
| `@postLoginRolProfesorPrimaria` | Login profesor primaria | 2-3 min |
| `@postLoginRolProfesorSecundaria` | Login profesor secundaria | 2-3 min |
| `@postLoginRolTutorSecundaria` | Login tutor secundaria | 2-3 min |
| `@misDatos` | Validación de datos personales | 5-7 min |
| `@security` | Pruebas de seguridad | 3-5 min |

---

## 🤖 ¿Necesitas Ayuda?

Click en el botón flotante **🐰 ZeusBot** y selecciona tu rol:

- **👨‍💻 QA** → Guía completa de testing
- **⚙️ DEV** → Validación de APIs
- **💼 Negocio** → Explicación sin tecnicismos
- **🔧 Técnico** → Detalles de arquitectura

---

## 📊 Interpretación de Resultados

### ✅ PASSED (Verde)
```
Escenario: Login exitoso de Directivo
Estado: ✅ PASSED
```
✓ La API funciona correctamente  
✓ No hay problemas  

### ❌ FAILED (Rojo)
```
Escenario: Login con credenciales inválidas
Estado: ❌ FAILED
```
✗ Hay un problema que revisar  
✗ Click en "Ver Reporte" para detalles  

**El reporte HTML de Karate muestra:**
- Request enviado (headers, body)
- Response recibido (status, headers, body)
- Step exacto que falló
- Comparación esperado vs actual

---

## 🔧 Ambientes

### QA (Recomendado)
- Ambiente estable para validaciones
- Datos de prueba controlados
- Ideal para: validar releases, testing de regresión

### DEV
- Ambiente de desarrollo
- Puede tener cambios en progreso
- Ideal para: validar features nuevos, testing exploratorio

---

## 🕐 Ejecuciones Programadas

El sistema ejecuta pruebas automáticamente:

| Día | Hora (Perú) | Tag | Correo |
|-----|-------------|-----|--------|
| Lunes-Viernes | 8:00 AM | `@dailyTests` | 2101010261@undc.edu.pe |
| Sábado-Domingo | 10:00 AM | `@postLoginRolAuxiliar` | 2101010261@undc.edu.pe |

---

## 💡 Tips Pro

### Para QA
- Usa `@dailyTests` antes de cada release
- Compara resultados en el historial para detectar regresiones
- Los reportes Karate son autoevidencias (capturas de request/response)

### Para DEV
- Ejecuta las pruebas antes de hacer merge a main
- Si falla un endpoint, el reporte muestra el request exacto que falló
- Puedes reproducir el fallo en Postman usando los datos del reporte

### Para Negocio
- Verde = Funcionalidad OK ✓
- Rojo = Hay que revisar con el equipo técnico
- El historial muestra la tendencia de calidad en el tiempo

---

## 🚨 Errores Comunes

### "❌ Token inválido"
**Solución:** Genera un nuevo token con permisos correctos

### "⚠️ El tag debe comenzar con @"
**Solución:** Escribe `@dailyTests` (no olvides la @)

### "⚠️ Correo inválido"
**Solución:** Usa un email válido (ej: usuario@dominio.com)

---

## 📞 Contacto

**QA Automation SSr:** Yrvin Pachas  
**Email:** 2101010261@undc.edu.pe  
**Proyecto:** SIASIS - Sistema Académico

---

**🎯 ¡Ahora estás listo para ejecutar pruebas automatizadas! 🚀**

Para más detalles técnicos, consulta [PLATAFORMA-TESTING.md](PLATAFORMA-TESTING.md)
