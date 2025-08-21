import json
import random 


def generate_cpf():
    cpf = [random.randrange(10) for _ in range(9)]

 

    for _ in range(2):
        value = sum([(len(cpf) + 1 - i) * v for i, v in enumerate(cpf)]) % 11
        cpf.append(11 - value if value > 1 else 0)

 

    return "".join(str(x) for x in cpf)

def geradorDePisPasep( formatar ):

 

   # 9 números aleatórios
   arNumeros = []
   for i in range(10):
      arNumeros.append( random.randint(0,9) )      

 

   # Calculado DV
   somaJ = ( arNumeros[0] * 3 ) + ( arNumeros[1] * 2 ) + ( arNumeros[2] * 9 ) + ( arNumeros[3] * 8 )  + ( arNumeros[4] * 7 ) + ( arNumeros[5] * 6 ) + ( arNumeros[6] * 5 )  + ( arNumeros[7] * 4 ) + ( arNumeros[8] * 3 ) + ( arNumeros[9] * 2 )

 

   restoJ = somaJ % 11
   subtracao = 11 - restoJ

 

   if ( subtracao == 10 or subtracao == 11 ):
      j = 0
   else:
      j = subtracao   

 

   arNumeros.append( j )

 

   pis = ''.join(str(x) for x in arNumeros)

 

   if formatar:
      return pis[ :10 ] + '-' + pis[ 10: ]
   else:
      return pis
def gerar_nome_aleatorio(silabas=2):
    vogais = 'aeiou'
    consoantes = 'bcdfghjklmnpqrstvwxyz'
    nome = ''

    for _ in range(silabas):
        # Cada sílaba começa com uma consoante
        nome += random.choice(consoantes)
        # Alterna entre vogais e consoantes para criar uma sílaba
        nome += random.choice(vogais)
    
    return nome.capitalize()  # Capitaliza o nome

quantidade_nomes = 10

for _ in range(quantidade_nomes):
    nome_aleatorio = gerar_nome_aleatorio()
    print(nome_aleatorio)
data = []

for i in range(1000):
    entry = {
        "Nome":gerar_nome_aleatorio(2),
        "Cpf": generate_cpf(),
        "Sexo": "M",
        "Cargo": "AREA COMERCIAL",
        "DataNascimento": "12/02/1990",
        "DataAdmissao": "09/03/2022",
        "Pis": geradorDePisPasep(False),
        "TipoVinculo": 1,
        "Matricula": str(random.randint(0,4000000)),
        "Departamento": "TI",
        "NumeroCtps": "",
        "NumeroSerieCtps": "",
        "Foto": [],
        "UfCtps": "SP",
        "CodigoUnidade": 1,
        "FuncionarioAtivo": "true",
        "UnidadeAdministrativa": "UNIDADE PADRAO",
        "Email": "",
        "Fuso": "-3",
        "WebMarcacao": "true"
    }
    data.append(entry)

with open("output.json", "w") as f:
    json.dump(data, f, indent=2)

print("JSON data generated and saved to 'output.json'")
