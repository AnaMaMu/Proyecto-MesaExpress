import mysql.connector
from mysql.connector import Error

# Esta función establece la conexión con la base de datos y devuelve el objeto de conexión si es exitosa
def conectar_a_mysql():
    try:
        # Establecer la conexión
        conexion = mysql.connector.connect(
            host="localhost",
            user="root",        # Por defecto, el usuario es 'root' en XAMPP
            password="123456",  # Contraseña en XAMPP
            database="mesaexpress"  # Nombre de la base de datos
        )

        if conexion.is_connected():
            print("✅ Conexión exitosa a la base de datos")
            
            # Obtener información del servidor
            info_servidor = conexion.get_server_info()
            print(f"ℹ️ Versión del servidor MySQL: {info_servidor}")

            # Crear un cursor para ejecutar consultas
            cursor = conexion.cursor()
            cursor.execute("SELECT DATABASE();")
            nombre_base_datos = cursor.fetchone()
            print(f"📁 Conectado a la base de datos: {nombre_base_datos[0]}")

            cursor.close()
            return conexion  # Retorna la conexión para ser usada en otros lugares
    except Error as e:
        print(f"❌ Error al conectar a MySQL: {e}")
        return None  # Retorna None si la conexión falla
    finally:
        if 'conexion' in locals() and conexion.is_connected():
            conexion.close()
            print("🔌 Conexión cerrada.")

# Llama a la función
if __name__ == "__main__":
    conexion = conectar_a_mysql()
    if conexion:
        print("La conexión está activa y puede ser utilizada.")
    else:
        print("No se pudo establecer la conexión.")
