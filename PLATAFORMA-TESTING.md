# 🥋 Plataforma de Testing Karate DSL - SIASIS

## 📋 Descripción

**test-launcher.html** es ahora la plataforma principal para ejecutar pruebas automatizadas de APIs con Karate DSL en el proyecto SIASIS. Esta plataforma web interactiva permite a cualquier miembro del equipo (QA, DEV, Negocio) ejecutar pruebas sin necesidad de conocer comandos técnicos.

## 🚀 Ventajas vs Ejecutar desde GitHub Actions

### ✅ Con test-launcher.html (RECOMENDADO)
- ✨ Interfaz visual amigable
- 🎯 Tags preconfigurados (un clic)
- 🤖 Asistente ZeusBot con guías por rol
- 📊 Visualización de historial integrada
- 🔐 Almacenamiento seguro del token (localStorage)
- 📱 Responsive (funciona en móviles)
- 🎨 Validación de formularios en tiempo real

### ❌ Desde GitHub Actions directamente
- Requiere navegar a GitHub → Actions → Workflow
- Más pasos manuales
- Sin validaciones previas
- Menos intuitivo para no técnicos

---

## 🎯 Cómo Usar la Plataforma

### 1️⃣ **Publicar test-launcher.html en GitHub Pages**

#### Opción A: Usando el workflow (AUTOMÁTICO)
El archivo ya se publica automáticamente al ejecutar pruebas. Accede en:
```
https://MonoSama21.github.io/BE-frameworkbase-KarateDSL/
```

#### Opción B: Manual (si necesitas publicarlo antes)
```bash
# Crear rama gh-pages si no existe
git checkout --orphan gh-pages

# Copiar test-launcher.html a la raíz
cp test-launcher.html index.html

# Commit y push
git add index.html
git commit -m "🚀 Publicar plataforma de testing"
git push origin gh-pages

# Volver a main
git checkout main
```

Luego ve a: **Settings → Pages → Source: gh-pages branch**

---

### 2️⃣ **Obtener GitHub Personal Access Token**

1. Ve a: https://github.com/settings/tokens/new?scopes=repo,workflow
2. Nombre: `Karate Testing Platform`
3. Selecciona scopes:
   - ✅ `repo` (Full control of private repositories)
   - ✅ `workflow` (Update GitHub Action workflows)
4. Expiration: 90 días (recomendado)
5. Click **Generate token**
6. **¡IMPORTANTE!** Copia el token (empieza con `ghp_`) - no lo verás de nuevo

---

### 3️⃣ **Ejecutar Pruebas desde la Plataforma**

1. **Abrir la plataforma:**
   ```
   https://MonoSama21.github.io/BE-frameworkbase-KarateDSL/
   ```

2. **En la pestaña "🚀 Ejecutar Pruebas":**
   - **Token:** Pega tu GitHub Token
   - **Tag:** Selecciona o escribe el tag
     - `@dailyTests` - Suite completa diaria
     - `@postLoginRolAuxiliar` - Login auxiliar
     - `@postLoginRolDirectivo` - Login directivo
     - `@postLoginRolProfesor` - Login profesores
     - `@misDatos` - Datos de usuario
     - `@security` - Seguridad
   - **Ambiente:** QA o DEV
   - **Correo:** Tu email para recibir notificaciones

3. **Click en "🚀 Ejecutar Pruebas Automatizadas"**

4. **Recibirás 2 correos:**
   - 🔵 **Inicio:** Confirmación de ejecución
   - 🟢 **Fin:** Resultados completos con tabla de escenarios

---

## 🤖 ZeusBot - Asistente Inteligente

Click en el botón flotante 🐰 para obtener ayuda contextual según tu rol:

### 👨‍💻 QA Automation
- Guía completa de tags disponibles
- Interpretación de reportes Karate
- Tips de debugging

### ⚙️ Desarrolladores
- Validación de APIs antes de merge
- Interpretación de errores de request/response
- Integración con herramientas (Postman, Insomnia)

### 💼 Negocio/Product Owner
- Explicación sin tecnicismos
- Cuándo ejecutar pruebas
- Cómo leer resultados (verde = OK, rojo = problema)

### 🔧 Técnico
- Detalles de arquitectura (Maven, Karate DSL)
- Estructura de artifacts
- Configuración de GitHub Actions

---

## 📊 Historial de Ejecuciones

La pestaña "📊 Historial de Ejecuciones" muestra:

- 📈 **Estadísticas:** Total, exitosas, fallidas
- 🔍 **Filtros:** Por estado (todos, passed, failed)
- 📄 **Cards por ejecución:**
  - Tag ejecutado
  - Ambiente (QA/DEV)
  - Fecha/hora
  - Build number
  - Duración
  - Usuario
  - Resultados (passed/failed/skipped)
  - Links: Ver reporte HTML + GitHub Actions

---

## 🛠️ Configuración del Proyecto

### Variables en test-launcher.html

Si clonaste el proyecto para otro repositorio, actualiza estas variables en la línea ~860:

```javascript
const GITHUB_OWNER = 'MonoSama21';              // Tu usuario de GitHub
const GITHUB_REPO = 'BE-frameworkbase-KarateDSL'; // Nombre del repositorio
const WORKFLOW_ID = 'karate-manual.yml';         // Archivo workflow
```

### Tags disponibles

Los tags se configuran en los archivos `.feature` de Karate:

```gherkin
@dailyTests @postLoginRolAuxiliar
Feature: Login de Rol Auxiliar

  Scenario: Login exitoso
    Given url baseUrl
    When ...
```

---

## 📧 Configuración de Notificaciones por Email

El workflow envía correos automáticos. Configura estos secrets en GitHub:

**Settings → Secrets and variables → Actions → New repository secret**

| Secret | Valor | Ejemplo |
|--------|-------|---------|
| `MAIL_SERVER` | Servidor SMTP | `smtp.gmail.com` |
| `MAIL_PORT` | Puerto SMTP | `587` |
| `MAIL_USERNAME` | Usuario SMTP | `tu-correo@gmail.com` |
| `MAIL_PASSWORD` | Contraseña o App Password | `abcd efgh ijkl mnop` |

### Para Gmail:
1. Habilita "Verificación en 2 pasos"
2. Genera una "Contraseña de aplicación": https://myaccount.google.com/apppasswords
3. Usa esa contraseña en `MAIL_PASSWORD`

---

## 🔒 Seguridad

### ✅ Buenas Prácticas
- El token se guarda en `localStorage` del navegador (no en servidor)
- Nunca compartas tu token en Slack/email/código
- Rota el token cada 90 días
- Usa tokens con scopes mínimos necesarios

### ❌ Nunca hacer
- Commitear el token en Git
- Usar el token de otro usuario
- Compartir tu token públicamente

---

## 🎨 Personalización

### Cambiar colores
Edita las variables CSS en la sección `<style>`:

```css
.tab-button.active {
    color: #667eea; /* Color principal */
}

.btn {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}
```

### Agregar más tags
Edita la sección de `quick-tags`:

```html
<div class="quick-tag" onclick="selectTag('@nuevoTag')">@nuevoTag</div>
```

---

## 🐛 Troubleshooting

### Error 401: Unauthorized
- **Causa:** Token inválido o sin permisos
- **Solución:** Genera un nuevo token con scopes `repo` + `workflow`

### Error 404: Not Found
- **Causa:** Repositorio o workflow no encontrado
- **Solución:** Verifica `GITHUB_OWNER`, `GITHUB_REPO` y `WORKFLOW_ID`

### No recibo correos
- **Causa:** Secrets mal configurados
- **Solución:** Verifica los secrets en GitHub Settings

### El historial no carga
- **Causa:** `history.json` no existe aún
- **Solución:** El historial se genera después de la primera ejecución

---

## 📚 Documentación Relacionada

- [Karate DSL Docs](https://github.com/karatelabs/karate)
- [GitHub Actions Workflow Dispatch](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#workflow_dispatch)
- [GitHub Pages](https://docs.github.com/en/pages)

---

## 👥 Soporte

**QA Lead:** Yrvin Pachas  
**Email:** 2101010261@undc.edu.pe

Para bugs o mejoras en la plataforma, crea un issue en GitHub.

---

## 📝 Changelog

### v2.0.0 - 2026-01-08
- 🥋 Migración completa a Karate DSL
- 🏷️ Tags actualizados (@dailyTests, @postLoginRol*, @misDatos)
- 🌍 Ambientes: QA y DEV
- 🤖 ZeusBot actualizado con guías Karate
- 📊 Historial compatible con reportes Karate HTML

### v1.0.0 - Inicial
- Versión original para Playwright

---

**¡Listo para testing! 🚀** Ahora puedes ejecutar pruebas desde una interfaz amigable sin necesidad de GitHub Actions manual.
