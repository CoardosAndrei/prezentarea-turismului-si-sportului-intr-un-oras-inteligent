import hashlib

parola = input("Introduceti parola: ")
parola_hash = hashlib.sha256(parola.encode()).hexdigest()

print(parola_hash)