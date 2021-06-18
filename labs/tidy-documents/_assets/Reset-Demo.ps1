$words = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus purus ipsum, vel blandit orci tincidunt a. Duis non dolor sed est maximus venenatis. Proin nec quam tempus, accumsan sem eleifend, iaculis justo. Sed velit ante, rutrum sit amet elementum ac, aliquam sed nibh. Nulla facilisi. Morbi iaculis in sapien a dictum. Praesent molestie, mi vitae elementum tincidunt, ante est volutpat orci, id eleifend eros velit interdum turpis. Aenean tristique velit at augue accumsan fermentum. In rhoncus turpis ac lacinia fringilla. Ut luctus mi sed tortor luctus sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam convallis purus purus, in pharetra dui dignissim et. Maecenas pellentesque cursus velit eget mollis. Proin mauris ante, porta quis tincidunt quis, imperdiet eget est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc tempus condimentum erat. '


function Reset-Demo{
    [cmdletbinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [string]$root
    )
    $folders = "$root/Documents/Videos",
    "$root/Downloads/Pensky",
    "$root/Templates"

    $files = (
        @{
            path="$root/Documents/Videos/stuff.txt"
            content=$words
        },
        @{
            path="$root/Downloads/Pensky/notes.md"
            content=$words
        }
    )

    if (-not $PSCmdlet.ShouldProcess($root)) {
        foreach($path in $folders){
            Write-Host "`t" -NoNewline
            New-Item -Path $path -ItemType Directory -Force -WhatIf
        }
        foreach($info in $files){
            Write-Host "`t" -NoNewline
            New-Item -Path $info.path -ItemType File -Force -WhatIf -Value info.content
        }

        return
    }

    New-Item -Path $folders -ItemType Directory -Force
    foreach($info in $files){
        Write-Host "`t" -NoNewline
        New-Item -Path $info.path -ItemType File -Force -Value $info.content
    }

}
