import os

import pymysql
from flask import Flask, flash, redirect, render_template, request, session, url_for
from werkzeug.security import check_password_hash, generate_password_hash

app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY", "dev-only-secret")

def get_db():
    """Open a new connection to the MariaDB container."""
    return pymysql.connect(
        host=os.environ.get("DB_HOST", "db"),
        user=os.environ.get("DB_USER"),
        password=os.environ.get("DB_PASSWORD"),
        database=os.environ.get("DB_NAME"),
        cursorclass=pymysql.cursors.DictCursor,
    )
