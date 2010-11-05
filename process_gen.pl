use strict;
use warnings;

print "Enter the number of processes you want generated?\n";
chomp(my $num_of_processes = <>);
print "Enter the name of the file you want the generated process stored in:\n";
chomp(my $filename = <>);
my $col_bool = 0;
unless($col_bool){
  print "Do you want column names? (y/n)";
  chomp($col_bool = <>);
  unless($col_bool eq 'y' || $col_bool eq 'n'){
    $col_bool = 0; 
  }
}

my @process_array = ();
foreach(0..$num_of_processes) {
  push(@process_array, [$_, int(rand(50)), int(rand($num_of_processes)), int(rand(100)), 0, int(rand(10))]);
  $process_array[$_][4] = $process_array[$_][2]+$process_array[$_][1]+int(rand(30));
}  
fy_shuffle(@process_array);
open(my $file, ">", $filename) or die "Can't open $filename: $!";
if($col_bool eq 'y'){
  print $file "Pid\tBst\tArr\tPri\tDline\tI/O\n";
}
foreach(@process_array) {
  print $file "$_->[0]\t$_->[1]\t$_->[2]\t$_->[3]\t$_->[4]\t$_->[5]\n";
}  
close $file or die "$file: $!";


sub fy_shuffle {
    my $array = shift;
    my $i = @$array;
    while ( --$i )
    {
        my $j = int rand( $i+1 );
        @$array[$i,$j] = @$array[$j,$i];
    }
}