function Get-Partitions{
    param(
        $Items,
        $PartitionSize = 2
    )
    [array]$Rest = $Items
    while($Rest.Length -gt $PartitionSize){
        $Partition = $Rest[0..($PartitionSize-1)]
        $Rest = $Rest[ $PartitionSize..($Rest.Length-1)]
        Write-Output $Partition -NoEnumerate
    }
    Write-Output $Rest -NoEnumerate
}

$xs = 1,2,3,4,5,6,7,8,9

$partitions = Get-Partitions $xs 3

foreach ($part in $partitions){
    "Partition: $part"
}
