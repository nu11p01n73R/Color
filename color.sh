#!/usr/local/bin/bash

cat <<EOF 
function color() 
{
        bash "${C_PATH}/helpers.sh" "\$1"
}
EOF
