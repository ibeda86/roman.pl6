my $decimal = prompt "Enter decimal: ";

say decimal-to-roman($decimal);

sub decimal-to-roman(UInt:D $decimal is copy -->Str:D) {
   my $str = '';

   my @conversions =
       M  => 1000,
       CM =>  900,
       D  =>  500,
       CD =>  400,
       C  =>  100,
       XC =>   90,
       L  =>   50,
       XL =>   40,
       X  =>   10,
       IX =>    9,
       V  =>    5,
       IV =>    4,
       I  =>    1,
   ;

   for @conversions -> $pair {
       while $decimal ≥ $pair.value {
           $decimal -= $pair.value;
           $str     ~= $pair.key;
       }
   }

   return $str;
}
