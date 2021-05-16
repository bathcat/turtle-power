# [Choice] Ubuntu version: bionic, focal
ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# From here:
#    https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1

# PWSH
COPY scripts/powershell-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/powershell-debian.sh \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# TODO Un-hardcode the username.
COPY scripts/home/Microsoft.PowerShell_profile.ps1 /home/vscode/.config/powershell/Microsoft.PowerShell_profile.ps1
