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
        print(f"\033[1;32m{char}\033[0m", end='', flush=True)  # verde em ANSI
        time.sleep(delay)
    print("\n")

def mostrar_menu():
    clear_screen()
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
    painel = Panel(menu_text, title="MENU PRINCIPAL", border_style="green", style="green")
    console.print(painel)
    escolha = Prompt.ask("Digite sua escolha")
    return escolha

def mostrar_mensagem(msg):
    clear_screen()
    digitando(msg, delay=0.02)
    input("Pressione ENTER para continuar...")

def main():
    while True:
        escolha = mostrar_menu()
        if escolha == "0":
            clear_screen()
            digitando("Saindo... Até logo!\n")
            break
        elif escolha == "1":
            mostrar_mensagem(
                "Esta opção escaneia portas abertas na rede usando o nmap.\n\n"
                "Você poderá ver quais serviços estão ativos na rede local.\n\n"
                "Use para fins educativos e com responsabilidade ética.\n"
            )
        elif escolha == "2":
            mostrar_mensagem(
                "Coleta informações básicas da rede e sistema.\n\n"
                "Inclui comandos para diagnosticar conexão e identificar dispositivos.\n"
            )
        elif escolha == "3":
            mostrar_mensagem(
                "Menu customizado em Python para organizar comandos.\n\n"
                "Útil para criar interfaces simples e dinâmicas no terminal.\n"
            )
        elif escolha == "4":
            mostrar_mensagem(
                "Automação para Termux do tipo atualizar e limpar arquivos temporários.\n\n"
                "Essas tarefas ajudam na manutenção do ambiente.\n"
            )
        elif escolha == "5":
            mostrar_mensagem(
                "Automatiza o uso do ngrok para criar túneis seguros.\n\n"
                "Usado para expor servidores locais para testes.\n"
            )
        elif escolha == "6":
            mostrar_mensagem(
                "Ferramenta para geolocalizar um endereço IP.\n\n"
                "Útil em investigações iniciais para entender a origem de acessos.\n"
            )
        elif escolha == "7":
            mostrar_mensagem(
                "Gera wordlists para ataques de força bruta usando a ferramenta crunch.\n\n"
                "Permite criar listas personalizadas para testes controlados.\n"
            )
        elif escolha == "8":
            mostrar_mensagem(
                "Limpa caches e arquivos temporários no Termux.\n\n"
                "Ajuda a manter o sistema limpo e leve.\n"
            )
        elif escolha == "9":
            mostrar_mensagem(
                "Opção Extra com funcionalidades:\n"
                "1) Envio de mensagens\n"
                "2) Sistema de denúncias\n"
                "Escolha adequada para interações adicionais.\n"
            )
        elif escolha == "10":
            mostrar_mensagem(
                "Sistema SPM - Painel informativo criado pelo Doctor Coringa.\n\n"
                f"Sistema: {platform.system()} {platform.release()}\n"
                f"Python versão: {platform.python_version()}\n\n"
                "Destinado para uso educativo e responsável.\n"
            )
        else:
            mostrar_mensagem("Opção inválida, tente novamente.")

if __name__ == "__main__":
    main()
    
