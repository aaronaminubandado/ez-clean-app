
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

app = Flask(__name__)
app.secret_key = "Password"

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:2A1a2b_4@localhost/ezclean'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class LaundryItem(db.Model):
    __tablename__ = 'LaundryItems'
    IS_ID = db.Column(db.Integer, primary_key=True,autoincrement=True)
    Item_Name = db.Column(db.String(255), nullable=False)
    Service = db.Column(db.String(255), nullable=False)
    Price = db.Column(db.Float, nullable=False)

    def __init__(self, item_name, service, price):
        self.Item_Name = item_name
        self.Service = service
        self.Price = price

@app.route('/')
def index():
    query = request.args.get('query')
    if query:
        results = search_items(query)
    else:
        results = LaundryItem.query.all()
    return render_template('index.html', Items=results)


@app.route('/insert', methods=['POST'])
def insert():
    if request.method == 'POST':
        item_name = request.form['name']
        service = request.form['service']
        price = float(request.form['price'])

        new_item = LaundryItem(item_name, service, price)
        db.session.add(new_item)
        db.session.commit()

        flash('Item added successfully!', 'success')
        
        return redirect(url_for('index'))

    return "Invalid request method!"



@app.route('/update/<int:item_id>', methods=['GET', 'POST'])
def update(item_id):
    my_data = LaundryItem.query.get(item_id)

    if my_data is None:
        flash("Item not found", "error")
        return redirect(url_for('index'))

    if request.method == 'POST':
        my_data.Item_Name = request.form['name']
        my_data.Service = request.form['service']
        my_data.Price = request.form['price']

        db.session.commit()
        flash("Item updated successfully", "success")

        return redirect(url_for('index'))

@app.route('/delete/<item_id>', methods=['GET','POST'])
def delete(item_id):
    my_data = LaundryItem.query.get(item_id)
    db.session.delete(my_data)
    db.session.commit()
    flash("Item deleted successfully", "success")

    return redirect(url_for('index'))

def search_items(query):
    # Perform the search query using SQLAlchemy
    results = LaundryItem.query.filter(LaundryItem.Item_Name.ilike(f'%{query}%')).all()
    return results


@app.route('/search')
def search():
    query = request.args.get('query')  # Get the search query from the URL parameters
    results = search_items(query)  # Call a function to search for items based on the query
    return render_template('index.html', Items=results)

if __name__ == '__main__':
    app.run(debug=True)
