# 🌐 Deploy Automático de test-launcher.html

Este archivo documenta cómo se despliega automáticamente la plataforma web.

## 📋 Proceso Actual

El `test-launcher.html` se publica automáticamente en GitHub Pages a través del workflow `karate-manual.yml`.

### Pasos que ejecuta el workflow:

1. **Genera reportes Karate** en `target/karate-reports/`
2. **Crea metadata** con información de la ejecución
3. **Publica en GitHub Pages:**
   - Reportes → `reports/{run_number}/`
   - Índice con historial → `/index.html`

## 🚀 Configuración Manual (Primera vez)

Si es la primera vez que configuras GitHub Pages en este repositorio:

### 1. Habilitar GitHub Pages

```bash
# En tu terminal local
git checkout --orphan gh-pages
git rm -rf .

# Copiar test-launcher como índice
cp test-launcher.html index.html

# Crear README
echo "# Plataforma de Testing Karate DSL" > README.md
echo "Accede en: https://MonoSama21.github.io/BE-frameworkbase-KarateDSL/" >> README.md

# Commit y push
git add index.html README.md
git commit -m "🚀 Inicializar GitHub Pages con plataforma de testing"
git push origin gh-pages

# Volver a main
git checkout main
```

### 2. Configurar en GitHub

1. Ve a: **Settings → Pages**
2. **Source:** Deploy from a branch
3. **Branch:** `gh-pages` / `/ (root)`
4. Click **Save**

### 3. Verificar

Espera 1-2 minutos y accede a:
```
https://MonoSama21.github.io/BE-frameworkbase-KarateDSL/
```

## 🔄 Actualizaciones Automáticas

Cada vez que ejecutas pruebas (manual o programadas), el workflow:

### Actualiza el Índice Principal
El workflow crea/actualiza `/index.html` en `gh-pages` con:
- Formulario de ejecución de pruebas
- Historial completo de reportes
- Links a cada reporte individual

### Agrega Nuevo Reporte
Cada ejecución crea un directorio:
```
reports/
  ├── 1/
  │   ├── karate-summary.html
  │   ├── metadata.json
  │   └── ... (otros archivos del reporte)
  ├── 2/
  │   └── ...
  └── N/
      └── ...
```

## 📝 Metadata de Reportes

Cada reporte incluye `metadata.json`:

```json
{
  "run_number": "42",
  "tag": "@dailyTests",
  "ambiente": "QA",
  "fecha": "2026-01-08 14:30:00",
  "timezone": "America/Lima"
}
```

Esto permite al índice mostrar información contextual sin parsear HTML.

## 🛠️ Actualizar test-launcher.html en GitHub Pages

Si haces cambios al archivo `test-launcher.html` y quieres desplegarlos:

### Opción A: Esperar a próxima ejecución
El workflow sobrescribirá el `index.html` automáticamente.

### Opción B: Actualización manual
```bash
# En rama main
git checkout main
# ... hacer cambios en test-launcher.html ...
git add test-launcher.html
git commit -m "✨ Actualizar plataforma de testing"
git push origin main

# Copiar a gh-pages
git checkout gh-pages
git checkout main -- test-launcher.html
mv test-launcher.html index.html
git add index.html
git commit -m "🔄 Sync plataforma desde main"
git push origin gh-pages

# Volver a main
git checkout main
```

### Opción C: Workflow dedicado (Recomendado)
Crea `.github/workflows/deploy-launcher.yml`:

```yaml
name: 🚀 Deploy Test Launcher

on:
  push:
    branches: [ main ]
    paths:
      - 'test-launcher.html'
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: 📥 Checkout
        uses: actions/checkout@v4

      - name: 📋 Copy launcher as index
        run: cp test-launcher.html index.html

      - name: 🌐 Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: .
          publish_branch: gh-pages
          keep_files: true
          destination_dir: .
```

Con este workflow, cualquier cambio a `test-launcher.html` se despliega automáticamente.

## 🔒 Permisos Necesarios

Verifica que el repositorio tenga permisos correctos:

**Settings → Actions → General → Workflow permissions:**
- ✅ Read and write permissions
- ✅ Allow GitHub Actions to create and approve pull requests

## 📊 Verificar Despliegue

### Ver estado del despliegue:
```
https://github.com/MonoSama21/BE-frameworkbase-KarateDSL/deployments
```

### Ver historial de pages:
```
Settings → Pages → History
```

## 🐛 Troubleshooting

### Error 404 al acceder a la plataforma
1. Verifica que `gh-pages` exista: `git ls-remote origin gh-pages`
2. Verifica que tenga `index.html`
3. Espera 1-2 minutos (caché de GitHub)

### Cambios no se reflejan
1. Haz force refresh: `Ctrl+Shift+R` (Windows) o `Cmd+Shift+R` (Mac)
2. Verifica en: https://github.com/MonoSama21/BE-frameworkbase-KarateDSL/tree/gh-pages
3. Revisa logs del workflow

### Reportes antiguos desaparecen
Verifica que el workflow use `keep_files: true` en el step de `peaceiris/actions-gh-pages`.

## 📁 Estructura Final en gh-pages

```
gh-pages/
├── index.html              # test-launcher.html renombrado
├── README.md              # Info de la plataforma
└── reports/               # Reportes históricos
    ├── 1/
    │   ├── karate-summary.html
    │   ├── metadata.json
    │   └── res/          # Assets (CSS, JS, etc)
    ├── 2/
    ├── 3/
    └── .../
```

## 🎯 URLs Importantes

| Recurso | URL |
|---------|-----|
| **Plataforma Principal** | https://MonoSama21.github.io/BE-frameworkbase-KarateDSL/ |
| **Reporte Específico** | https://MonoSama21.github.io/BE-frameworkbase-KarateDSL/reports/42/karate-summary.html |
| **Código Fuente** | https://github.com/MonoSama21/BE-frameworkbase-KarateDSL |
| **Workflows** | https://github.com/MonoSama21/BE-frameworkbase-KarateDSL/actions |
| **Deployments** | https://github.com/MonoSama21/BE-frameworkbase-KarateDSL/deployments |

---

**🔄 Última actualización:** 2026-01-08  
**👤 Mantenedor:** Yrvin Pachas (QA Automation SSr)
