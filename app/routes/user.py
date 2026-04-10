from flask import Blueprint, jsonify
users_bp = Blueprint('users', __name__)
@users_bp.route("/users")
def home():
    return jsonify({"message": "API is working!"})


@users_bp.route("/health")
def health():
    return jsonify({"status": "ok"}), 200
