import os
import time
import platform
import sys

# Tentar importar rich, instalar se não existir
try:
    from rich.console import Console
    from rich.panel import Panel
    from rich.syntax import Syntax
    from rich.text import Text
    from rich.prompt import Prompt, IntPrompt
    from rich.rule import Rule
except ImportError:
    print("[bold red]Biblioteca 'rich' não encontrada.[/bold red]")
    print("[bold yellow]Instalando a biblioteca 'rich'... Aguarde...[/bold yellow]")
    time.sleep(1)
    os.system("pip install rich")
    print("[bold green]Instalação concluída! Reinicie o script.[/bold green]")
    sys.exit(0)

console = Console()

# ----------------- CÓDIGOS REAIS PARA VISUALIZAR ---------------------

codigo_nmap = '''
# Exemplo básico para escanear portas numa rede usando nmap no Termux.
# Para instalar nmap: pkg install nmap

import os

def scan_ports(target):
    """Escaneia as portas abertas no IP alvo (target)."""
    print(f"Iniciando scan em: {target}")
    os.system(f"nmap -sS {target}")

# Uso:
# scan_ports("192.168.0.1")
'''.strip()

codigo_coleta_info = '''
# Script para coletar informações básicas da rede e sistema

import os

def info_rede():
    print("Informações da interface de rede:")
    os.system("ifconfig")
    print("\\nPing para 8.8.8.8 (Google DNS):")
    os.system("ping -c 4 8.8.8.8")

# Uso:
# info_rede()
'''.strip()

codigo_menu_custom = '''
# Exemplo básico de menu customizado em Python

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

# Uso:
# menu()
'''.strip()

codigo_automacao_termux = '''
#!/bin/bash
# Script para automatizar atualização e limpeza no Termux

echo "Atualizando pacotes..."
pkg update -y && pkg upgrade -y

echo "Limpando arquivos temporários..."
rm -rf /data/data/com.termux/files/usr/tmp/*

echo "Automação concluída!"
'''.strip()

codigo_ngrok = '''
#!/bin/bash
echo "Iniciando túnel ngrok na porta 8080..."
ngrok http 8080
'''.strip()

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

# Uso:
# ip_tracer('8.8.8.8')
'''.strip()

codigo_wordlist_gen = '''
#!/bin/bash
echo "Gerando wordlist personalizada..."
read -p "Digite uma palavra/frase base: " base
crunch 8 8 -t ${base}@@@@ -o wordlist.txt
echo "Wordlist salva em wordlist.txt"
'''.strip()

codigo_cleanup = '''
#!/bin/bash
echo "Limpando arquivos temporários..."
rm -rf $HOME/tmp/*
rm -rf $HOME/.cache/*
echo "Sistema limpo!"
'''.strip()

# ----------------- FUNÇÕES AUXILIARES --------------------

def clear_screen():
    os.system('clear' if os.name == 'posix' else 'cls')

def efeito_digitando(texto="Carregando"):
    for i in range(3):
        dots = '.' * (i + 1)
        console.print(f"[bold cyan]{texto}{dots}[/bold cyan]", end='\r')
        time.sleep(0.5)
    clear_screen()

def banner():
    banner_text = Text("""\
   ██████  ██████  ███    ███
  ██      ██    ██ ████  ████
  ██      ██    ██ ██ ████ ██
  ██      ██    ██ ██  ██  ██
   ██████  ██████  ██      ██
""", style="bold green")
    slogan = Text("Doctor sempre inovando", style="bold cyan")
    console.print(Panel(banner_text, title="SPM", subtitle=slogan, expand=False, border_style="bright_magenta"))

def aviso_etica():
    texto = (
        "[bold red]*** AVISO DE RESPONSABILIDADE E ÉTICA ***[/bold red]\n\n"
        "Este sistema e seus códigos são disponibilizados para fins educacionais, de\n"
        "aprendizado e uso ético apenas.\n\n"
        "O uso indevido pode violar leis e causar danos.\n\n"
        "Não nos responsabilizamos por atos ilegais ou antiéticos realizados.\n\n"
        "Ao utilizar este sistema, você concorda em usá-lo com responsabilidade e ética.\n"
    )
    console.print(Panel(texto, border_style="red"))

def info_sistema():
    clear_screen()
    banner()
    aviso_etica()
    info = (
        "[bold blue]Sistema SPM - Painel Educativo de Scripts[/bold blue]\n\n"
        "Criado pelo Doctor Coringa exclusivamente para passar informações.\n\n"
        f"Sistema operacional: {platform.system()} {platform.release()}\n"
        f"Python versão: {platform.python_version()}\n\n"
        "Destina-se ao uso educativo e ético.\n"
    )
    console.print(Panel(info, border_style="bright_blue"))
    input("Pressione Enter para voltar ao menu principal...")

def mostrar_codigo_e_exp(codigo, titulo, explicacao):
    linguagem = "bash" if codigo.strip().startswith("#!") else "python"
    syntax = Syntax(codigo, linguagem, line_numbers=True, indent_guides=True)
    painel_codigo = Panel.fit(syntax, title=f"Código: {titulo}", border_style="bright_green")
    painel_exp = Panel(explicacao, title="Explicação", border_style="bright_blue")
    aviso = Panel(
        "[yellow]Use este código com responsabilidade e ética.\n\n"
        "É fundamental respeitar as leis e os direitos.\n[/yellow]", border_style="yellow")
    clear_screen()
    console.print(aviso)
    console.print(painel_exp)
    console.print(painel_codigo)
    console.print()
    input("Pressione Enter para voltar ao menu...")

def funcao_spam():
    efeito_digitando("Preparando envio de mensagens")
    clear_screen()
    console.print("[bold green]Envio de mensagens iniciado[/bold green]\n")
    alvo = Prompt.ask("Digite o número do alvo (ex: 5511999999999)")
    qtd = IntPrompt.ask("Quantidade de mensagens a enviar", default=3, show_default=True)
    console.print()
    for i in range(1, qtd + 1):
        console.print(f"Mensagem {i} enviada para {alvo}")
        time.sleep(0.5)
    console.print("\n[bold yellow]Envio concluído![/bold yellow]")
    input("\nPressione Enter para voltar ao menu Extra...")

def funcao_denunciar():
    efeito_digitando("Abrindo formulário de denúncia")
    clear_screen()
    console.print("[bold red]Sistema de denúncia aberto[/bold red]\n")
    alvo = Prompt.ask("Digite o número do alvo para denunciar")
    console.print(f"\nDenúncia enviada para o número: {alvo}")
    console.print("\n[bold yellow]Obrigado por colaborar com a ética e segurança![/bold yellow]")
    input("\nPressione Enter para voltar ao menu Extra...")

def funcao_extra():
    while True:
        clear_screen()
        banner()
        aviso_etica()
        console.print(Rule("[bold blue]OPÇÃO EXTRA[/bold blue]"))
        console.print("[green]1)[/] Envio de mensagens (spam ético)")
        console.print("[yellow]2)[/] Sistema de denúncia")
        console.print("[red]0)[/] Voltar ao menu principal")
        escolha = Prompt.ask("Escolha:", choices=["0", "1", "2"])
        if escolha == "0":
            break
        elif escolha == "1":
            funcao_spam()
        elif escolha == "2":
            funcao_denunciar()

def menu():
    clear_screen()
    banner()
    aviso_etica()
    console.print(Rule("[bold blue]MENU PRINCIPAL[/bold blue]"))
    console.print("[green]1)[/] Escanear portas abertas na rede (nmap — exemplo básico)")
    console.print("[yellow]2)[/] Coletar informações da rede e sistema (exemplo Python simples)")
    console.print("[cyan]3)[/] Exemplo de menu customizado em Python")
    console.print("[magenta]4)[/] Automação simples para Termux (atualizar e limpar — bash)")
    console.print("[bright_green]5)[/] Automatizar túnel ngrok (bash)")
    console.print("[bright_blue]6)[/] IP Tracer com geolocalização (Python OSINT básico)")
    console.print("[bright_yellow]7)[/] Gerador automático de wordlist com crunch (bash)")
    console.print("[bright_red]8)[/] Script de limpeza e limpeza cache no Termux (bash)")
    console.print("[blue]9)[/] Opção Extra (Spam & Denúncia)")
    console.print("[magenta]10)[/] Sobre o Sistema")
    console.print("[red]0)[/] Sair\n")
    escolha = Prompt.ask("Digite sua escolha", choices=[str(i) for i in range(0,11)])
    return escolha

def main():
    while True:
        escolha = menu()
        efeito_digitando()
        if escolha == "0":
            clear_screen()
            console.print("[bold red]Saindo... Até breve![/bold red]")
            break
        elif escolha == "1":
            explicacao = (
                "Este script usa a ferramenta nmap para identificar portas abertas em um endereço de rede.\n\n"
                "É essencial para auditorias de segurança e descoberta de serviços ativos."
            )
            mostrar_codigo_e_exp(codigo_nmap, "Scan de Portas com nmap", explicacao)
        elif escolha == "2":
            explicacao = (
                "Script Python que coleta informações básicas da interface de rede e faz ping para um servidor DNS público.\n\n"
                "Útil para diagnóstico de conectividade e estudo de redes."
            )
            mostrar_codigo_e_exp(codigo_coleta_info, "ColetaInfo Rede/Sistema", explicacao)
        elif escolha == "3":
            explicacao = (
                "Exemplo prático de menu customizado em Python, para facilitar organização e execução de múltiplos comandos ou scripts."
            )
            mostrar_codigo_e_exp(codigo_menu_custom, "Menu Customizado Python", explicacao)
        elif escolha == "4":
            explicacao = (
                "Automação simples em bash para atualizar e limpar seu ambiente Termux garantindo melhor performance e espaço."
            )
            mostrar_codigo_e_exp(codigo_automacao_termux, "Automação Termux (bash)", explicacao)
        elif escolha == "5":
            explicacao = (
                "Script para automatizar a criação de túneis ngrok, útil para testes locais."
            )
            mostrar_codigo_e_exp(codigo_ngrok, "Automação ngrok (bash)", explicacao)
        elif escolha == "6":
            explicacao = (
                "Script Python para traçar geolocalização de um IP para trabalhos de OSINT."
            )
            mostrar_codigo_e_exp(codigo_ip_tracer, "IP Tracer (Python)", explicacao)
        elif escolha == "7":
            explicacao = (
                "Gera wordlist personalizada usando Crunch para ataques de força bruta."
            )
            mostrar_codigo_e_exp(codigo_wordlist_gen, "Gerador Wordlist (bash)", explicacao)
        elif escolha == "8":
            explicacao = (
                "Limpa arquivos temporários e caches no Termux para manter o ambiente leve e limpo."
            )
            mostrar_codigo_e_exp(codigo_cleanup, "Limpeza Termux (bash)", explicacao)
        elif escolha == "9":
            funcao_extra()
        elif escolha == "10":
            info_sistema()

if __name__ == "__main__":
    main()
