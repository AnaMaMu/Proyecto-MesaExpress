from flask import Flask
from flask_cors import CORS
from app.routes.login import loginIniciado
from app.routes.admin import adminStart
from app.routes.registro import registroUsuarios
from app.routes.productos import productos_bp


def create_app():
    app = Flask(__name__)
    app.register_blueprint(productos_bp)


    # ✅ Configuración CORS corregida
    CORS(app, resources={
        r"/*": {
            "origins": "*",
            "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
            "allow_headers": ["Content-Type", "Authorization"]
        }
    })

    # ✅ Registrar los blueprints
    app.register_blueprint(loginIniciado, url_prefix='/auth')
    app.register_blueprint(adminStart, url_prefix='/admin')
    app.register_blueprint(registroUsuarios, url_prefix='/usuarios')

    return app
