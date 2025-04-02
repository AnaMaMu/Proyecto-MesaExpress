from flask import Blueprint, request, jsonify
from config.db import obtener_conexion


productos_bp = Blueprint('productos', __name__)

# Obtener todos los productos
@productos_bp.route('/productos', methods=['GET'])
def obtener_productos():
    try:
        conexion = obtener_conexion()
        with conexion.cursor() as cursor:
            cursor.execute("SELECT * FROM productos")
            productos = cursor.fetchall()
            columnas = [desc[0] for desc in cursor.description]
            resultado = [dict(zip(columnas, fila)) for fila in productos]
        conexion.close()
        return jsonify(resultado)
    except Exception as e:
        print(f"Error al obtener productos: {e}")
        return jsonify({'error': 'Error al obtener productos'}), 500

# Agregar un producto
@productos_bp.route('/productos', methods=['POST'])
def agregar_producto():
    data = request.get_json()
    nombre = data.get('nombre')
    descripcion = data.get('descripcion')
    precio = data.get('precio')
    imagen = data.get('imagen')

    try:
        conexion = obtener_conexion()
        with conexion.cursor() as cursor:
            cursor.execute("INSERT INTO productos (nombre, descripcion, precio, imagen) VALUES (%s, %s, %s, %s)",
                           (nombre, descripcion, precio, imagen))
            conexion.commit()
        conexion.close()
        return jsonify({'mensaje': 'Producto agregado correctamente'})
    except Exception as e:
        print(f"Error al agregar producto: {e}")
        return jsonify({'error': 'Error al agregar producto'}), 500

# Eliminar un producto
@productos_bp.route('/productos/<int:id>', methods=['DELETE'])
def eliminar_producto(id):
    try:
        conexion = obtener_conexion()
        with conexion.cursor() as cursor:
            cursor.execute("DELETE FROM productos WHERE id = %s", (id,))
            conexion.commit()
        conexion.close()
        return jsonify({'mensaje': 'Producto eliminado correctamente'})
    except Exception as e:
        print(f"Error al eliminar producto: {e}")
        return jsonify({'error': 'Error al eliminar producto'}), 500

# Actualizar un producto
@productos_bp.route('/productos/<int:id>', methods=['PUT'])
def actualizar_producto(id):
    data = request.get_json()
    nombre = data.get('nombre')
    descripcion = data.get('descripcion')
    precio = data.get('precio')
    imagen = data.get('imagen')

    try:
        conexion = obtener_conexion()
        with conexion.cursor() as cursor:
            cursor.execute("UPDATE productos SET nombre = %s, descripcion = %s, precio = %s, imagen = %s WHERE id = %s",
                           (nombre, descripcion, precio, imagen, id))
            conexion.commit()
        conexion.close()
        return jsonify({'mensaje': 'Producto actualizado correctamente'})
    except Exception as e:
        print(f"Error al actualizar producto: {e}")
        return jsonify({'error': 'Error al actualizar producto'}), 500
