

function Get-Name {
    [OutputType([string])]
    Param(
        [System.IO.FileInfo]$slide
    )
    $chunks = $slide.Name -split '-'
    return $chunks[1].Replace('.md','').ToLower()
}

function Build-Content{
    Param(
        [System.IO.FileInfo]$original,
        [Switch]$WhatIf=$false
    )
    $name = Get-Name $original
    $deckPath = "~/workspace/nars/src/content/typescript/$name"
    New-Item -Path $deckPath -ItemType Directory -WhatIf:$WhatIf
    New-Item -Path "$deckPath/assets" -ItemType Directory -WhatIf:$WhatIf
    Copy-Item -Path $original.FullName -Destination "$deckPath/content.mdx" -WhatIf:$WhatIf
    Copy-Item -Path "~/workspace/nars/src/content/typescript/types/assets/duck.png" -Destination "$deckPath/assets" -WhatIf:$WhatIf
    Copy-Item -Path "~/workspace/nars/src/content/typescript/types/index.ts" -Destination $deckPath -WhatIf:$WhatIf
    
}

gci ../slides/*.md |  %{Build-Content $_}
