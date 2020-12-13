from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager


app = Flask(__name__)
app.secret_key="kajdhjuesddhuidsju"
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:Lehaitrieu1601@localhost/quanlykhachsan?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True

db = SQLAlchemy(app=app)

admin = Admin(app=app, name="Quản Lý Khách Sạn - Triều Trang Hotel", template_mode="bootstrap3")


login = LoginManager(app=app)