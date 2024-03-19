from flask import Flask, render_template, request, redirect, url_for, session, jsonify
import mysql.connector
import hashlib

app = Flask(__name__, template_folder=".")
app.secret_key = 'cheie_secreta'  # Cheia secretă pentru sesiune

config = {
    'user': 'test',
    'password': '123',
    'host': 'localhost',
    'database': 'paginaWEB',
    'raise_on_warnings': True,
}

@app.route('/')
def pagina_principala():
    return redirect(url_for('pagina_principala1'))

@app.route('/pagPrinc')
def pagina_principala1():
    if session.get('autentificat'):
        # Dacă utilizatorul este autentificat, șterge sesiunea și redirecționează către pagina principală
        session.clear()
        return redirect(url_for('pagina_principala'))

    return render_template("pagPrinc.html")

@app.route('/pagSport')
def pagina_pagSport():
    return render_template("pagSport.html")

@app.route('/pagContact')
def pagina_pagContact():
    return render_template("pagContact.html")

@app.route('/pagTurism')
def pagina_pagTurism():
    return render_template('pagTurism.html')

@app.route('/pagHotel')
def pagina_pagHotel():
    if not session.get('autentificat') or session.get('tip') != 'Hotel':
        return jsonify({'status': 'error', 'message': 'Acces interzis'})
    return render_template('pagHotel.html')

@app.route('/pagGhid')
def pagina_pagGhid():
    if not session.get('autentificat') or session.get('tip') != 'GhidTuristic':
        return jsonify({'status': 'error', 'message': 'Acces interzis'})
    return render_template('pagGhid.html')

@app.route('/pagRestaurant')
def pagina_pagRestaurant():
    if not session.get('autentificat') or session.get('tip') != 'Restaurant':
        return jsonify({'status': 'error', 'message': 'Acces interzis'})
    return render_template('pagRestaurant.html')

@app.route('/pagProprietar')
def pagina_pagProprietar():
    if not session.get('autentificat') or session.get('tip') != 'ProprTeren':
        return jsonify({'status': 'error', 'message': 'Acces interzis'})
    return render_template('pagProprietar.html')

def autentificare(nume_utilizator, parola):     #Verifica daca utilizatorul exista in baza de date, seteaza datele din sesiune si returneaza true altfel returneaza false
    try:
        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            cursor = connection.cursor(dictionary=True)
            query = "SELECT * FROM dateUser WHERE numeCont=%s AND parola_hash=%s"
            cursor.execute(query, (nume_utilizator, parola))
            utilizator = cursor.fetchone()

            if utilizator:
                # Daca autentificarea este reusita, setam sesiunea
                session['autentificat'] = True
                session['utilizator_id'] = utilizator['user_id']
                session['tip'] = utilizator['tip']
                return True

    except mysql.connector.Error as err:
        print(f'Eroare la conectare la baza de date: {err}')

    finally:
        if 'connection' in locals() and connection.is_connected():
            connection.close()

    return False

@app.route('/login', methods=['GET', 'POST'])
def login():                                    #Se ocupa de logarea utilizatorilor
    if request.method == 'POST':
        nume_utilizator = request.form['nume_utilizator']
        parola = request.form['parola']

        if autentificare(nume_utilizator, parola):
            # Daca autentificarea este reusita, redirecționati catre pagina ceruta
            return redirect(returnPaginaCoresp(session.get('tip')))
        
    return jsonify({'status': 'error', 'message': 'Nume de utilizator sau parola incorecta'})

def returnPaginaCoresp(tip):    #Returneaza titlul paginii corestunzatoare in functie de tipul primit
    switch_dict = {
        'Hotel': 'pagHotel',
        'Restaurant': 'pagRestaurant',
        'GhidTuristic': 'pagGhid',
        'ProprTeren' : 'pagProprietar'
    }

    return switch_dict.get(tip, 'pagPrinc')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port = 5000)
    #app.run(debug=True)
