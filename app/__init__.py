from flask import Flask

def create_app():
    app = Flask(__name__)
    
    from app.routes.user import users_bp
    app.register_blueprint(users_bp)

    return app