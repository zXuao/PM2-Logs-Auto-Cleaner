````markdown
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
/home/
├── .pm2/logs              # Logs do PM2 | PM2 logs
├── logs-clean/
│   └── limpeza_logs_pm2.txt  # Histórico de limpeza | Cleaning history
├── .last_clean_pm2        # Controle de execução | Execution control
└── auto_clean_pm2.sh      # Script principal | Main script
````

---

## ⚙️ Como funciona | How it works

### 🇧🇷 Português

O script roda em loop infinito e:

1. Verifica a data atual
2. Detecta se hoje é o último dia do mês
3. Verifica se já executou no dia
4. Limpa a pasta de logs do PM2
5. Registra a execução em arquivo
6. Aguarda 1 hora e repete

### 🇺🇸 English

The script runs in an infinite loop and:

1. Checks the current date
2. Detects if today is the last day of the month
3. Checks if it already ran today
4. Cleans the PM2 logs directory
5. Logs the execution into a file
6. Waits 1 hour and repeats

---

## 🚀 Instalação | Installation

### 1. Salvar o script | Save the script

```bash
nano /home/auto_clean_pm2.sh
```

Cole o conteúdo do script.

---

### 2. Dar permissão de execução | Make it executable

```bash
chmod +x /home/auto_clean_pm2.sh
```

---

### 3. Executar em background | Run in background

```bash
nohup /home/auto_clean_pm2.sh > /dev/null 2>&1 &
```

---

## 🔥 Executar com PM2 (Recomendado) | Run with PM2 (Recommended)

```bash
pm2 start /home/auto_clean_pm2.sh --name clean-pm2-logs
pm2 save
```

---

## 🧪 Testes | Testing

### 🇧🇷 Português

Para forçar execução imediata:

1. Edite o script:

```bash
nano auto_clean_pm2.sh
```

2. Altere:

```bash
if [ "$AMANHA_MES" != "$HOJE_MES" ]; then
```

Para:

```bash
if true; then
```

3. Execute o script manualmente.

---

### 🇺🇸 English

To force immediate execution:

1. Edit the script:

```bash
nano auto_clean_pm2.sh
```

2. Change:

```bash
if [ "$AMANHA_MES" != "$HOJE_MES" ]; then
```

To:

```bash
if true; then
```

3. Run the script manually.

---

## 📄 Arquivo de Log | Log File

Localização:

```
/home/logs-clean/limpeza_logs_pm2.txt
```

Exemplo:

```
[2026-03-17 18:30:00] Pasta /home/.../.pm2/logs foi limpa com sucesso.
```

---

## ⚠️ Observações | Notes

### 🇧🇷 Português

* O script não remove a pasta, apenas o conteúdo
* O arquivo de log é sempre o mesmo (append)
* O controle evita execuções duplicadas
* Ideal para ambientes sem acesso root

### 🇺🇸 English

* The script does not remove the directory, only its contents
* The log file is always appended (never replaced)
* Execution control prevents duplicates
* Ideal for environments without root access

---

## 👨‍💻 Autor | Author

**by. JVT**
📅 17/03/2026

---

## 💡 Melhorias futuras | Future improvements

* Execução em horário específico (ex: 23:59)
* Notificação (email ou webhook)
* Limpeza seletiva por tipo de arquivo (.log)
* Rotação de logs

---
