import mysql.connector
from confi import DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT


def conectar():
    try:
        conexion = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME,
            port=DB_PORT
        )
        return conexion
    except mysql.connector.Error as e:
        raise Exception(f"Error al conectar con la base de datos: {e}")
