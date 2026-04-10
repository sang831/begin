# Local development on Windows

## Why Gunicorn fails on Windows

`gunicorn` is intended for Unix/Linux environments.  
For Windows local development, run the Flask app directly.

## Run locally
```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python run.py
```

## Test endpoints

- http://127.0.0.1:5000/users
- http://127.0.0.1:5000/health

## Notes

- Production still uses Gunicorn via Docker (`Dockerfile`).
- CI for local-first milestone is defined in `.github/workflows/ci.yml`.
- Deploy workflow is manual (`workflow_dispatch`) so you can postpone domain/HTTPS until final step.
- Deploy without domain is supported: workflow deploys `app` only and checks `http://127.0.0.1:5000/health`.
- When domain is added later (`DOMAIN` secret), workflow deploys `app + nginx` and checks `http://127.0.0.1/health`.
- You can override local host/port:

```powershell
$env:HOST="0.0.0.0"
$env:PORT="5000"
$env:FLASK_DEBUG="1"
python run.py
```

