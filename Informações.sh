import os
import time
import platform
from rich.console import Console
from rich.panel import Panel
from rich.prompt import Prompt
from rich.progress import Progress

console = Console()

def clear_screen():
    os.system('clear' if os.name == 'posix' else 'cls')

def digitando(texto, delay=0.03):
    for char in texto:
        print(f"\033[1;32m{char}\033[0m", end='', flush=True)
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
        "Não nos responsabilizamos por usos ilegais ou antiéticos.\n"
        "Utilize com responsabilidade.\n\n"
    )
    digitando(aviso_etica, delay=0.02)
    digitando(explicacao + "\n\n", delay=0.02)
    digitando("Aqui está o código/comando desta funcionalidade:\n\n", delay=0.02)
    digitando(codigo.strip() + "\n", delay=0.001)
    input("\nPressione ENTER para voltar ao menu...")

codigo_nmap = '''
nmap -sS [endereço IP]
'''

codigo_coleta_info = '''
ifconfig
ping -c 4 8.8.8.8
'''

codigo_menu_custom = '''
print("1 - Opção A")
print("2 - Opção B")
escolha = input("Escolha uma opção: ")
'''

codigo_automacao_termux = '''
pkg update -y && pkg upgrade -y
rm -rf /data/data/com.termux/files/usr/tmp/*
'''

codigo_ngrok = '''
ngrok http 8080
'''

codigo_ip_tracer = '''
import requests
response = requests.get("http://ip-api.com/json/" + ip)
data = response.json()
print(data)
'''

codigo_wordlist_gen = '''
read -p "Palavra base: " base
crunch 8 8 -t ${base}@@@@ -o wordlist.txt
'''

codigo_cleanup = '''
rm -rf $HOME/tmp/*
rm -rf $HOME/.cache/*
'''

codigo_opcao_extra = '''
def spam_e_denuncia():
    from rich.progress import Progress
    import time

    numero = input("Digite o número do alvo: ")
    quantidade = int(input("Digite a quantidade de envios: "))

    print("\\nIniciando envio de mensagens de spam e denúncias para o número informado...\\n")

    with Progress() as progress:
        task = progress.add_task("", total=quantidade)  # barra sem texto
        for i in range(quantidade):
            # Aqui você insere o código real para envio de spam e denúncia
            time.sleep(0.5)  # simula o tempo de envio

            progress.update(task, advance=1)

    print("\\nEnvio de SPAM e denúncias concluído!\\n")
'''

codigo_sobre_sistema = f'''
Sistema SPM - Painel criado pelo Doctor Coringa.

Sistema: {platform.system()} {platform.release()}
Python versão: {platform.python_version()}

Este sistema é destinado a ensino, aprendizado e uso ético.
'''

def main():
    while True:
        escolha = mostrar_menu()
        if escolha == "0":
            clear_screen()
            digitando("Saindo... Até logo!\n")
            break
        elif escolha == "1":
            explicacao = (
                "Este código usa a ferramenta nmap para escanear portas abertas em um endereço IP.\n"
                "Na prática, ajuda a descobrir quais serviços estão rodando, permitindo auditorias de segurança."
            )
            mostrar_opcao(explicacao, codigo_nmap)
        elif escolha == "2":
            explicacao = (
                "Aqui o script coleta informações da rede local e testa a conectividade com o Google DNS.\n"
                "Útil para diagnóstico básico e entendimento do ambiente."
            )
            mostrar_opcao(explicacao, codigo_coleta_info)
        elif escolha == "3":
            explicacao = (
                "Menu customizado em Python para organizar opções e gerenciar interações simples com o usuário."
            )
            mostrar_opcao(explicacao, codigo_menu_custom)
        elif escolha == "4":
            explicacao = (
                "Automação no Termux para atualizar pacotes e limpar arquivos temporários.\n"
                "Importante para manter o ambiente limpo e funcional."
            )
            mostrar_opcao(explicacao, codigo_automacao_termux)
        elif escolha == "5":
            explicacao = (
                "Automatiza a criação de túneis seguros (ngrok) para expor servidores locais na internet."
            )
            mostrar_opcao(explicacao, codigo_ngrok)
        elif escolha == "6":
            explicacao = (
                "Ferramenta básica para geolocalizar um endereço IP usando API pública.\n"
                "Auxilia em investigações iniciais com informações geográficas e ISP."
            )
            mostrar_opcao(explicacao, codigo_ip_tracer)
        elif escolha == "7":
            explicacao = (
                "Geração automática de wordlists personalizadas para testes de força bruta.\n"
                "Essa função usa a ferramenta crunch para facilitar testes controlados."
            )
            mostrar_opcao(explicacao, codigo_wordlist_gen)
        elif escolha == "8":
            explicacao = (
                "Limpeza de arquivos temporários e caches para liberar espaço e manter o Termux ágil."
            )
            mostrar_opcao(explicacao, codigo_cleanup)
        elif escolha == "9":
            # Executa aqui a função real para spam e denuncia junto com barra de progresso
            clear_screen()

            def spam_e_denuncia():
                numero = input("Digite o número do alvo: ")
                quantidade = int(input("Digite a quantidade de envios: "))

                print(f"\nIniciando envio de {quantidade} mensagens de spam e denúncias para {numero}...\n")

                with Progress() as progress:
                    task = progress.add_task("", total=quantidade)  # barra sem texto
                    for i in range(quantidade):
                        # Aqui o código real para envio de spam e denúncia deve ser inserido

                        time.sleep(0.5)  # Simula o tempo de envio
                        progress.update(task, advance=1)

                print("\nEnvio de SPAM e denúncias concluído!\n")

            explicacao = (
                "Nesta opção, o usuário fornece o número do alvo e quantidade de mensagens.\n"
                "O sistema envia mensagens de spam e denúncias de forma combinada,\n"
                "com uma barra de progresso visual no terminal."
            )
            mostrar_opcao(explicacao, codigo_opcao_extra)
            spam_e_denuncia()
        elif escolha == "10":
            mostrar_opcao("Informações detalhadas do sistema e do painel:", codigo_sobre_sistema)
        else:
            mostrar_opcao("Opção inválida, por favor tente novamente.", "")

if __name__ == "__main__":
    main()
    
