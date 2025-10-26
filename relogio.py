import json
import random
from faker import Faker

fake = Faker('pt_BR')

def gerar_relogio():
    cep_valido = fake.postcode().replace("-", "")

    return {
        "UnidadeAdm": "",
        "Nome": fake.first_name(),
        "Senha": str(random.randint(100000, 999999)),
        "Responsavel": fake.name(),
        "TipoEndereco": random.choice(['Rua', 'Avenida', 'Travessa', 'Alameda', 'Estrada']),
        "Logradouro": fake.street_name(),
        "Numero": str(random.randint(1, 9999)),
        "Bairro": fake.bairro(),
        "Cep": cep_valido,
        "Cidade": fake.city(),
        "Uf": fake.estado_sigla(),
        "Gps": "true",              # Sempre "true"
        "Selfie": "false",          # Sempre "false"
        "SelfiWifi": "false",       # Sempre "false"
        "SelfieMoldura": "false",   # Sempre "false"
        "QRCode": "false",          # Sempre "false"
        "EsqueciCracha": "false"    # Sempre "false"
    }

quantidade = 10000
dados = {"lstRelogio": [gerar_relogio() for _ in range(quantidade)]}

with open('relogios.json', 'w', encoding='utf-8') as f:
    json.dump(dados, f, ensure_ascii=False, indent=4)

print(f"{quantidade} objetos gerados e salvos em relogios.json!")