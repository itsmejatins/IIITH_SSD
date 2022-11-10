from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

from flask_login import (LoginManager, login_manager, login_user, logout_user, login_required, UserMixin)



app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///server.db" 
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

app.app_context().push()

login_manager = LoginManager()

login_manager.init_app(app)

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(80), nullable=False)

    @login_manager.user_loader
    def load_user(user_id):
        return User.query.get(init(user_id))



@app.route('/do_signin', methods = ['POST'])
def do_signin():
    if(request.method == 'POST'):
        req = request.get_json()
        username = req['username']
        password = req['password']
        check_user = User.query.filter_by(username = username).first()
        if(check_user is not None):
            if(check_user.password == password):
                login_user(check_user)
                return "LOGGED in successfully"
            else:
                return "Incorrect Password"
        else:
            return "No such user exists!"
@app.route('/do_register', methods = ['POST'])
def do_register():
    if(request.method == 'POST'):
        req = request.get_json()
        username = req['username']
        password = req['password']
        
        


if __name__ == "__main__":
    app.run(debug=True)
