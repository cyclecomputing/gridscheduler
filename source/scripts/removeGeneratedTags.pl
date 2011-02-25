#!/usr/bin/perl

my $dir = $ARGV[0];
my $tmpfile = "/tmp/rgt.$$";

processDir ($dir);
print "Done.\n";

sub processDir {
   my $dir = $_[0];

   print "Processing $dir\n";

   opendir (DIR, $dir);
   my (@files) = readdir (DIR);
   closedir DIR;

   foreach $file (@files) {
      if (($file eq ".") || ($file eq "..")) {
         next;
      }
      elsif (-d "$dir/$file") {
         processDir ("$dir/$file");
      }
      elsif ($file =~ /\.html$/) {
         processFile ("$dir/$file");
      }
      else {
         print "Skipping $dir/$file\n";
      }
   }
}

sub processFile {
   my $file = $_[0];

   print "Processing $file\n";

   `grep -v '<!-- Generated by javadoc' $file > $tmpfile`;
   unlink ($file);
   `mv $tmpfile $file`;
}