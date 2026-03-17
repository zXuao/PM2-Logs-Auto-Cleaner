# 🧹 PM2 Logs Auto Cleaner

Script em Bash para limpeza automática dos logs do PM2 no último dia de cada mês, sem necessidade de cron ou sudo.

Bash script for automatically cleaning PM2 logs on the last day of each month, without requiring cron or sudo.

---

## 📌 Funcionalidades | Features

### 🇧🇷 Português
- Limpa automaticamente a pasta de logs do PM2
- Executa apenas no último dia do mês
- Evita execução duplicada no mesmo dia
- Registra histórico das limpezas em um único arquivo
- Não requer cron nem permissões de root
- Roda continuamente em background

### 🇺🇸 English
- Automatically cleans PM2 logs directory
- Runs only on the last day of the month
- Prevents duplicate execution on the same day
- Logs all clean operations into a single file
- Does not require cron or root privileges
- Runs continuously in the background

---

## 📂 Estrutura de Diretórios | Directory Structure

```bash
/home/REDEDOR/jnobre.bravista/
├── .pm2/logs              # Logs do PM2 | PM2 logs
├── logs-clean/
│   └── limpeza_logs_pm2.txt  # Histórico de limpeza | Cleaning history
├── .last_clean_pm2        # Controle de execução | Execution control
└── auto_clean_pm2.sh      # Script principal | Main script