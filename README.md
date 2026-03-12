# EPS Citas - Viva 1A IPS

Sistema de gestión de citas médicas en Flask + MySQL.

## 🚀 Deploy en Railway

### 1. Crear base de datos MySQL en Railway
1. En tu proyecto Railway, haz clic en **+ New** → **Database** → **MySQL**
2. Railway creará automáticamente las variables de entorno de conexión

### 2. Ejecutar el schema
Conéctate a la base de datos de Railway y ejecuta el archivo `schema.sql`:
```
mysql -h HOST -P PORT -u USER -p DATABASE < schema.sql
```
O pégalo directamente en el panel de Railway → MySQL → Query.

### 3. Subir el proyecto
```bash
# Desde la carpeta del proyecto
railway login
railway init
railway up
```

### 4. Variables de entorno en Railway
Ve a tu servicio → **Variables** y agrega:

| Variable     | Valor                        |
|-------------|------------------------------|
| DB_HOST     | (desde tu MySQL de Railway)  |
| DB_PORT     | (desde tu MySQL de Railway)  |
| DB_USER     | (desde tu MySQL de Railway)  |
| DB_PASSWORD | (desde tu MySQL de Railway)  |
| DB_NAME     | eps_citas                    |
| SECRET_KEY  | una-clave-secreta-segura     |

> Railway auto-inyecta `$MYSQLHOST`, `$MYSQLPORT`, etc. Puedes referenciarlos directamente:
> `DB_HOST=${{MySQL.MYSQLHOST}}`

---

## 💻 Desarrollo local

```bash
# 1. Instalar dependencias
pip install -r requirements.txt

# 2. Crear .env desde el ejemplo
cp .env.example .env
# Edita .env con tus datos locales

# 3. Crear base de datos
mysql -u root -p < schema.sql

# 4. Correr el servidor
python app.py
```

Accede en: http://localhost:5000

---

## 📁 Estructura del proyecto
```
├── app.py              # Rutas Flask
├── confi.py            # Configuración (lee de env vars)
├── database.py         # Conexión MySQL
├── models/
│   ├── pacientes.py    # CRUD pacientes
│   └── citas.py        # CRUD citas
├── templates/          # HTML Jinja2
├── static/
│   └── css/style.css
├── schema.sql          # Script de base de datos
├── requirements.txt
├── Procfile            # Para Railway/Heroku
└── railway.json        # Configuración Railway
```
