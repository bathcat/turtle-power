function Get-Square {
  [OutputType([int])]
  Param(
      [Parameter(ValueFromPipeline=$true)]
      [int]$x
  )
  process{
    return $x * $x
  }
}