from app import create_app  # Importamos create_app desde app/__init__.py
import mysql.connector
from config import DB_CONFIG

# Prueba de conexión a MySQL antes de levantar Flask
try:
    conexion = mysql.connector.connect(**DB_CONFIG)
    print("✅ Conexión exitosa a MySQL")
    conexion.close()
except mysql.connector.Error as err:
    print(f"❌ ERROR MySQL: {err}")

app = create_app()

if __name__ == "__main__":
    app.run(debug=True)
