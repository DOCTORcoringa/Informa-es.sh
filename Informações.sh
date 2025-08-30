import os
import time
import platform
from rich.console import Console
from rich.panel import Panel
from rich.prompt import Prompt

console = Console()

def clear_screen():
    os.system('clear' if os.name == 'posix' else 'cls')

def digitando(texto, delay=0.03):
    for char in texto:
        print(f"\033[1;32m{char}\033[0m", end='', flush=True)  # verde ANSI
        time.sleep(delay)
    print("\n")

def mostrar_banner_menu():
    clear_screen()
    banner_text = (
        "   ██████  ██████  ███    ███\n"
        "  ██      ██    ██ ████  ████\n"
        "  ██      ██    ██ ██ ████ ██\n"
        "  ██      ██    ██ ██  ██  ██\n"
        "   ██████  ██████  ██      ██\n"
        "Doctor sempre inovando\n"
    )
    painel = Panel(banner_text, border_style="green", style="green")
    console.print(painel)

def mostrar_menu():
    mostrar_banner_menu()
    menu_text = (
        "[1] Escanear portas abertas na rede\n"
        "[2] Coletar informações da rede e sistema\n"
        "[3] Menu customizado em Python\n"
        "[4] Automação para Termux\n"
        "[5] Túneis ngrok\n"
        "[6] IP Tracer OSINT\n"
        "[7] Gerador de Wordlist\n"
        "[8] Limpar Termux\n"
        "[9] Opção Extra (Spam e Denúncia)\n"
        "[10] Sobre o sistema\n"
        "[0] Sair\n"
    )
    painel_menu = Panel(menu_text, title="MENU PRINCIPAL", border_style="green", style="green")
    console.print(painel_menu)
    escolha = Prompt.ask("Digite sua escolha")
    return escolha

def mostrar_opcao(explicacao, codigo):
    clear_screen()
    aviso_etica = (
        "*** AVISO DE RESPONSABILIDADE E ÉTICA ***\n\n"
        "Este sistema e seus códigos são disponibilizados para fins educacionais\n"
        "e uso ético somente.\n\n"
        "Não nos responsabilizamos por usos ilegais ou antiéticos.\n\n"
        "Utilize com responsabilidade.\n\n"
    )
    digitando(aviso_etica, delay=0.02)
    digitando(explicacao + "\n\n", delay=0.02)
    digitando(codigo.strip() + "\n", delay=0.001)
    input("\nPressione ENTER para voltar ao menu...")

# Códigos reais exemplos
codigo_nmap = '''
import os

def scan_ports(target):
    print(f"Iniciando scan em: {target}")
    os.system(f"nmap -sS {target}")

# Uso:
# scan_ports("192.168.0.1")
'''

codigo_coleta_info = '''
import os

def info_rede():
    print("Info da interface de rede:")
    os.system("ifconfig")
    print("\\nPing para 8.8.8.8:")
    os.system("ping -c 4 8.8.8.8")
'''

codigo_menu_custom = '''
def menu():
    print("1 - Opção A")
    print("2 - Opção B")
    escolha = input("Escolha uma opção: ")
    if escolha == '1':
        print("Você escolheu a opção A")
    elif escolha == '2':
        print("Você escolheu a opção B")
    else:
        print("Opção inválida")
'''

codigo_automacao_termux = '''
#!/bin/bash
echo "Atualizando pacotes..."
pkg update -y && pkg upgrade -y
echo "Limpando arquivos temporários..."
rm -rf /data/data/com.termux/files/usr/tmp/*
echo "Automação concluída!"
'''

codigo_ngrok = '''
#!/bin/bash
echo "Iniciando túnel ngrok na porta 8080..."
ngrok http 8080
'''

codigo_ip_tracer = '''
import requests

def ip_tracer(ip):
    url = f"http://ip-api.com/json/{ip}"
    response = requests.get(url)
    data = response.json()
    if data['status'] == 'success':
        print(f"País: {data['country']}")
        print(f"Região: {data['regionName']}")
        print(f"Cidade: {data['city']}")
        print(f"ISP: {data['isp']}")
    else:
        print("IP inválido ou não localizado.")
'''

codigo_wordlist_gen = '''
#!/bin/bash
echo "Gerando wordlist..."
read -p "Palavra base: " base
crunch 8 8 -t ${base}@@@@ -o wordlist.txt
echo "Wordlist salva em wordlist.txt"
'''

codigo_cleanup = '''
#!/bin/bash
echo "Limpando arquivos temporários..."
rm -rf $HOME/tmp/*
rm -rf $HOME/.cache/*
echo "Sistema limpo!"
'''

codigo_opcao_extra = '''
Opção Extra com funcionalidades de spam e denúncia.
(Implementações adicionais podem ser adicionadas aqui)
'''

codigo_sobre_sistema = f'''
Sistema SPM - Painel informativo criado pelo Doctor Coringa.

Sistema: {platform.system()} {platform.release()}
Python versão: {platform.python_version()}

Para uso educativo e responsável.
'''

def main():
    while True:
        escolha = mostrar_menu()
        if escolha == "0":
            clear_screen()
            digitando("Saindo... Até logo!\n")
            break
        elif escolha == "1":
            explicacao = "Escaneia portas abertas na rede usando nmap para auditorias de segurança."
            mostrar_opcao(explicacao, codigo_nmap)
        elif escolha == "2":
            explicacao = "Coleta informações básicas da rede e sistema para diagnóstico."
            mostrar_opcao(explicacao, codigo_coleta_info)
        elif escolha == "3":
            explicacao = "Menu customizado em Python para organizar funcionalidades."
            mostrar_opcao(explicacao, codigo_menu_custom)
        elif escolha == "4":
            explicacao = "Automação em bash para atualizar e limpar ambiente Termux."
            mostrar_opcao(explicacao, codigo_automacao_termux)
        elif escolha == "5":
            explicacao = "Automatiza túneis ngrok para testes locais seguros."
            mostrar_opcao(explicacao, codigo_ngrok)
        elif escolha == "6":
            explicacao = "Ferramenta para geolocalizar IP usada em análises OSINT."
            mostrar_opcao(explicacao, codigo_ip_tracer)
        elif escolha == "7":
            explicacao = "Gera wordlist personalizada para testes de força bruta."
            mostrar_opcao(explicacao, codigo_wordlist_gen)
        elif escolha == "8":
            explicacao = "Limpa caches e temporários para manter Termux leve."
            mostrar_opcao(explicacao, codigo_cleanup)
        elif escolha == "9":
            explicacao = "Funções extras de envio de mensagens e denúncias."
            mostrar_opcao(explicacao, codigo_opcao_extra)
        elif escolha == "10":
            mostrar_opcao("Informações do sistema e painel.", codigo_sobre_sistema)
        else:
            mostrar_opcao("Opção inválida.", "")

if __name__ == "__main__":
    main()

