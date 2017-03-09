#!/usr/local/bin/bash

cat <<EOF 
function color() 
{
        bash "${COLOR_PATH}/helpers.sh" "\$1"
}
EOF
