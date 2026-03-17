#!/bin/bash

PM2_LOGS_DIR="ACRESCENTE A SUA PASTA DE INSTALAÇÃO DO PM2/.pm2/logs"
CLEAN_LOG_DIR="ACRESCENTE A SUA PASTA/logs-clean" 
REPORT_FILE="$CLEAN_LOG_DIR/limpeza_logs_pm2.txt" # Arquivo de log limpeza

ULTIMO_EXEC_FILE="[PASTA ONDE VAI FICAR O ARQUVIO DE LOG DE LIMPEZA]"

mkdir -p "$CLEAN_LOG_DIR"

while true; do
    HOJE=$(date +%Y-%m-%d)
    AMANHA_MES=$(date -d tomorrow +%m)
    HOJE_MES=$(date +%m)
    DATA_ATUAL=$(date '+%Y-%m-%d %H:%M:%S')

    if [ "$AMANHA_MES" != "$HOJE_MES" ]; then
#     if true; then < teste no dia
        if [ -f "$ULTIMO_EXEC_FILE" ]; then
            ULTIMA_EXEC=$(cat "$ULTIMO_EXEC_FILE")
        else
            ULTIMA_EXEC=""
        fi

        if [ "$ULTIMA_EXEC" != "$HOJE" ]; then

            if [ -d "$PM2_LOGS_DIR" ]; then
                find "$PM2_LOGS_DIR" -mindepth 1 -delete
                echo "[$DATA_ATUAL] Pasta $PM2_LOGS_DIR foi limpa com sucesso." >> "$REPORT_FILE"
            else
                echo "[$DATA_ATUAL] Pasta $PM2_LOGS_DIR nÃ£o encontrada." >> "$REPORT_FILE"
            fi

            echo "$HOJE" > "$ULTIMO_EXEC_FILE"
        fi
    fi

    sleep 3600
done

# by. jvt - 17/03/2026
