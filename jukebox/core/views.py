from flask import Blueprint, render_template

main = Blueprint('core', __name__, template_folder='../templates')


@main.route('/')
def index():
    return render_template('base.html')


@main.route('/history')
def history():
    return render_template('base.html')


@main.route('/search/<query>', defaults={'query': ''})
def search(query):
    return render_template('base.html')
