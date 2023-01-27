function Get-Total {
   begin {
      $total = 0
   }
   process {
      $total += $_
   }
   end {
      return $total
   }
}

Get-Process |
   ? { $_.Name -eq 'Chrome' } |
   % { $_.WorkingSet } |
   Get-Total
