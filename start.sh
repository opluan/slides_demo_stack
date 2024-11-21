#!/bin/bash

WHOAMI_FILE="./slides/whoami.html"
CONTENT_FILE="/app/content.md"
MATERIA="${AULA%/*}"

echo "${AULA}"
echo "${MATERIA}"

if [ -f "${AULA}" ]; then
    cp "${AULA}" "${CONTENT_FILE}"
else
    echo "Aula não encontrada"
    exit 1 
fi

if [ -f "${WHOAMI_FILE}" ]; then
    # Para facilitar a escrita, mantemos as quebras de linha no arquivo original
    # Porem o segundo `sed` precisa que o arquivo não contenha quebras explicitas de linha, pois ele acabou não funcionando corretamente o replace
    # Então, trocamos as quebras de linha por literais no primeiro `sed`
    # O arquivo resultante CONTENT_FILE, vai ficar com as quebras de linha normais, porem isto nao interfere
    # a;N;$!ba:
    # :a cria um rótulo chamado a.
    # N lê a próxima linha e a adiciona ao buffer atual.
    # $!ba retorna ao rótulo a enquanto não estiver na última linha do arquivo ($!).
    sed -i ':a;N;$!ba;s/\n/\\n/g' ${WHOAMI_FILE}

    WHOAMI_CONTENT=$(cat "${WHOAMI_FILE}")

    # Facilita introduzir o WHOAMI apenas quando necessário
    sed -i "s@<\!-- WHOAMI_REPLACE -->@${WHOAMI_CONTENT}@g" "${CONTENT_FILE}"
fi

npm start
