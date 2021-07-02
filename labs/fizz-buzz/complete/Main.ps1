function Get-Message {
   [OutputType([string])]
   Param(
      [Parameter(ValueFromPipeline = $true)]
      [int]$i
   )

   process {
      if ( $i % 15 -eq 0  ) {
         return 'fizzbuzz';
      }

      if ( $i % 3 -eq 0  ) {
         return 'fizz';
      }

      if ( $i % 5 -eq 0  ) {
         return 'buzz';
      }

      return [string]$i;
   }
}


1..100 | Get-Message 