from app import create_app
import os

app = create_app()

if __name__ == "__main__":
    host = os.getenv("HOST", "127.0.0.1")
    port = int(os.getenv("PORT", "5000"))
    debug = os.getenv("FLASK_DEBUG", "1") == "1"
    # Use Flask dev server for local development (works on Windows).
    app.run(host=host, port=port, debug=debug)
