from flask import Flask, render_template, jsonify, request, send_from_directory # Add render_template  
from flask_cors import CORS   

import logging 

app = Flask(__name__)
CORS(app)  


## Frontend load
@app.route('/', methods=['GET'])
@app.route('/charts', methods=['GET'])
@app.route('/profile', methods=['GET'])
@app.route('/about', methods=['GET'])
@app.route('/plans', methods=['GET'])
@app.route('/legal', methods=['GET'])
def frontend(): 
    return render_template('index.html') # Return index.html   
 
 
# Settup logging 
logHandler = logging.FileHandler('app.log')
logHandler.setLevel(logging.INFO)
app.logger.addHandler(logHandler)
app.logger.setLevel(logging.INFO)

if __name__=="__main__":  
    app.run('0.0.0.0', port=6900, debug=True)

