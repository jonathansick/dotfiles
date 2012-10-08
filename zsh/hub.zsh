# Setup hub to wrap git: https://github.com/defunkt/hub
if $(command -v hub >/dev/null 2>&1); then
    eval "$(hub alias -s)" 
else
    echo "Install hub sometime: https://github.com/defunkt/hub"
fi
