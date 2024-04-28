"""Flask app for Cupcakes"""
from flask import Flask, jsonify, render_template, redirect, request
from models import Cupcake, db, connect_db
import os
# from dotenv import load_dotenv
from uuid import uuid4

# load_dotenv('.env')

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = str(uuid4())

with app.app_context():
    connect_db(app)
    db.create_all()


@app.get('/')
def index():
    return render_template('/index.html')


@app.get('/api/cupcakes')
def get_cupcakes():
    cupcakes: list[Cupcake] = [cupcake.serialize()
                               for cupcake in Cupcake.query.all()]
    return jsonify(cupcakes=cupcakes)


@app.get('/api/cupcakes/<int:id>')
def get_cupcake(id):
    cupcake: Cupcake = Cupcake.query.get(id)
    data = cupcake.serialize()
    return jsonify(cupcake=data)


@app.post('/api/cupcakes')
def add_cupcake():
    data = request.json

    flavor = data.get('flavor')
    size = data.get('size')
    rating = data.get('rating')
    image = data.get('image')

    errors = []

    if not flavor:
        errors.append('Flavor is required.')
    if not size:
        errors.append('Size is required.')
    if not rating:
        errors.append('Rating is required.')

    if errors:
        return jsonify(errors=errors)

    cupcake: Cupcake = Cupcake(
        flavor=flavor, size=size, rating=rating, image=image)

    db.session.add(cupcake)
    db.session.commit()

    return (jsonify(cupcake=cupcake.serialize()), 201)


@app.patch('/api/cupcakes/<int:id>')
def update_cupcake(id: int):
    cupcake: Cupcake = Cupcake.query.get(id)
    data = request.json

    if data.get('flavor'):
        cupcake.flavor = data.get('flavor')

    if data.get('size'):
        cupcake.size = data.get('size')

    if data.get('rating'):
        cupcake.rating = data.get('rating')

    if data.get('image'):
        cupcake.image = data.get('image')

    db.session.add(cupcake)
    db.session.commit()

    return jsonify(cupcake.serialize())


@app.delete('/api/cupcakes/<int:id>')
def delete_cupcake(id: int):
    cupcake: Cupcake = Cupcake.query.get(id)
    db.session.delete(cupcake)
    db.session.commit()

    return jsonify("deleted")
