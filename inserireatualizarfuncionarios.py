import json
import random

def generate_cpf():
    while True:
        cpf = [random.randrange(10) for _ in range(9)]
        for _ in range(2):
            value = sum([(len(cpf) + 1 - i) * v for i, v in enumerate(cpf)]) % 11
            cpf.append(11 - value if value > 1 else 0)
        cpf_num = "".join(map(str, cpf))
        if cpf_num not in generated_cpfs:
            generated_cpfs.add(cpf_num)
            return cpf_num

def gerador_de_pis_pasep():
    while True:
        ar_numeros = [random.randint(0, 9) for _ in range(10)]
        soma_j = sum(
            v * peso for v, peso in zip(
                ar_numeros, [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
            )
        )
        resto_j = soma_j % 11
        j = 0 if resto_j < 2 else 11 - resto_j
        ar_numeros.append(j)
        pis = "".join(map(str, ar_numeros))
        if pis not in generated_pis:
            generated_pis.add(pis)
            return pis

def gerar_nome_aleatorio(silabas=2):
    vogais = 'aeiou'
    consoantes = 'bcdfghjklmnpqrstvwxyz'
    nome = "".join(
        random.choice(consoantes) + random.choice(vogais)
        for _ in range(silabas)
    )
    return nome.capitalize()

def gerar_data_aleatoria(ano_inicial=1950, ano_final=2023):
    dia = random.randint(1, 28)
    mes = random.randint(1, 12)
    ano = random.randint(ano_inicial, ano_final)
    return f"{dia:02d}/{mes:02d}/{ano}"

def gerar_dados_aleatorios(quantidade):
    data = []
    generated_matriculas = set()

    for _ in range(quantidade):
        # Garante matrícula única nesse exemplo simples (de 1 a 99999999)
        while True:
            matricula = str(random.randint(1, 99999999))
            if matricula not in generated_matriculas:
                generated_matriculas.add(matricula)
                break

        entry = {
            "Id": 0,
            "Cpf": generate_cpf(),
            "Nome": gerar_nome_aleatorio(3),
            "Sexo": random.choice(["M", "F"]),
            "FuncionarioAtivo": True,
            "Ativo": True,
            "DataNascimento": gerar_data_aleatoria(1950, 2000),
            "DataAdmissao": gerar_data_aleatoria(2000, 2023),
            "Pis": gerador_de_pis_pasep(),
            "TipoVinculo": 1,
            "Matricula": matricula,
            "Departamento": gerar_nome_aleatorio(4),
            "Cargo": gerar_nome_aleatorio(3),
            "CargaHorariaMaxima": random.randint(0, 44),
            "UnidadeAdministrativa": gerar_nome_aleatorio(5),
            "Email": None,
            "NumeroCtps": None,
            "NumeroSerieCtps": None,
            "Foto": None,
            "FotoBase64": None,
            "UfCtps": random.choice(["SP", "RJ", "MG", "RS", "BA"]),
            "CodigoUnidade": None,
            "Fuso": "-3",
            "WebMarcacao": random.choice([True, False]),
            "Senha": None,
            "SenhaCriptografada": None
        }
        data.append(entry)

    with open("output.json", "w", encoding="utf-8") as f:
        json.dump({"lstFuncionario": data}, f, ensure_ascii=False, indent=2)

    print("JSON data generated and saved to 'output.json'")

# Conjuntos globais para unicidade
generated_cpfs = set()
generated_pis = set()

if __name__ == "__main__":
    gerar_dados_aleatorios(5000)