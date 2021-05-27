# [Choice] Ubuntu version: bionic, focal
ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# From here:
#    https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1

ARG USERNAME=vscode
ENV HOME /home/$USERNAME

RUN apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME




# PWSH
COPY scripts/powershell-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/powershell-debian.sh \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Setup
COPY scripts/environment.ps1 /tmp/library-scripts/
RUN pwsh /tmp/library-scripts/environment.ps1 \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# TODO Un-hardcode the username.
COPY scripts/profile.ps1 /home/vscode/.config/powershell/Microsoft.PowerShell_profile.ps1
COPY scripts/profile.ps1 /home/vscode/.config/powershell/Microsoft.VSCode_profile.ps1

RUN chown -R vscode /home/vscode
USER $USERNAME