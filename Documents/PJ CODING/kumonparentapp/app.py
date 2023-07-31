from flask import Flask, render_template, request
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField

app = Flask(__name__)
app.config['SECRET_KEY'] = 'mysecret'

ball_options = [6, 4, 3, 2, 1, 0, "W"]

class CommentForm(FlaskForm):
    comment = StringField("Comment")
    submit = SubmitField("Submit")

@app.route('/', methods=["GET", "POST"])
def index():
    if 'comment' in request.form:
        parent_options.append(request.form['comment'])
    return render_template('index.html', parent_options=parent_options, template_form=CommentForm())