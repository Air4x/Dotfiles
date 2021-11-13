#!/bin/perl

use Term::ANSIColor;

my $path = "/home/mario/.local/share/todo/todo.txt";
my $number = 1;
open(my $file, "<", $path);
my @tasks = <$file>;
foreach(@tasks) {
    print color ('bold');
    print("    $number:");
    print color ('reset');
    print(" $_");
    $number = $number + 1;
}
