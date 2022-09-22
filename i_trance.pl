#!/usr/bin/env perl
use strict;
use warnings;

unless( $ARGV[0]){ my $data;

 sub trans_1{
  my( $data,$i ) = @_;
  open my $read,'>','tran.txt' or die"trans_1 $!\n";
   print $read $data;
  close $read;
   print" $i translate...\n";
  system"trap 'rm tran.txt trans.txt; exit 1' 1 2 3 15
         cat tran.txt|trans -b en:ja|sed -e 's/：/:/g' -e 's/&/\&amp;/g'|
         perl -pe 's/>/&gt;/g'|perl -pe 's/</&lt;/g' >> trans.txt";
 }

 open my $code1,'<','Interfaces/MainMenu.xib' or die"1 $!";
  while(<$code1>){
   $data .= "$1\n" if /\s+title="([^"]+)"/;
  }
 close $code1;
 trans_1 $data,1; $data = '';

 open my $code2,'<','Interfaces/PreferencePanel.xib' or die"2 $!";
  while(<$code2>){
   $data .= "$1\n" if /\s+title="([^"]+)"/;
   $data .= "$1\n" if /\s+label="([^"]+)"/;
   $data .= "$1\n" if /\s+toolTip="([^"]+)"/;
   $data .= "$1\n" if m|<string key="title">(.+)</string>|;
   $data .= "$1\n" if m|<string key="toolTip">(.+)</string>|;
  }
 close $code2;
 trans_1 $data,2; $data = '';

 open my $code3,'<','Interfaces/iTermEditKeyActionWindowController.xib' or die"3 $!\n";
  while(<$code3>){
   $data .= "$1\n" if /\s+title="([^"]+)"/;
  }
 close $code3;
 trans_1 $data,3; $data = '';

 open my $code4,'<','sources/iTermAdvancedSettingsModel.m' or die"4 $!";
  while(<$code4>){
   $data .= "$1\n" if /SECTION_.+@"([^\\"]+)(?:\\n|")/;
   $data .= "$1\n" if /SECTION_[^\\]+\\n([^"]+)"/;
  }
 close $code4;
 trans_1 $data,4;

 unlink 'tran.txt';
}

if( $ARGV[0] and $ARGV[0] == 1 ){

 sub read_1{
  my( $item,$file ) = @_;
  open my $read,'>',$file or die"read_1 $!\n";
   print $read $item;
  close $read;
 }

 open my $trans,'<','trans.txt' or die"5 $!\n";
  my @bn = <$trans>;
 close $trans;

 my( $e,$me1,$me2,$me3,$me4 ) = 0;
 open my $xcode1,'<','Interfaces/MainMenu.xib' or die"6 $!";
  while(my $data1 = <$xcode1>){
   if( $data1 =~ /\s+title="[^"]+"/ ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data1 =~ s/title="[^"]+"/title="$bn[$e]"/;
       $e++; last;
    }
   }
   $me1 .= $data1;
  }
 close $xcode1;
 read_1 $me1,'Interfaces/MainMenu.xib';

 open my $xcode2,'<','Interfaces/PreferencePanel.xib' or die"7 $!";
  while(my $data2 = <$xcode2>){
   if( $data2 =~ /\s+title="[^"]+"/ ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data2 =~ s/title="[^"]+"/title="$bn[$e]"/;
       $e++; last;
    }
   }elsif( $data2 =~ /\s+label="[^"]+"/ ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data2 =~ s/label="[^"]+"/label="$bn[$e]"/;
       $e++; last;
    }
   }elsif( $data2 =~ /<string key="title">/ ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data2 =~ s|.+|<string key="title">$bn[$e]</string>|;
       $e++; last;
    }
   }elsif( $data2 =~ /<string key="toolTip">/ ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data2 =~ s|.+|<string key="toolTip">$bn[$e]</string>|;
       $e++; last;
    }
   }elsif( $data2 =~ /\s+toolTip="/ ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data2 =~ s/toolTip="[^"]+"/toolTip="$bn[$e]"/;
       $e++; last;
    }
   }
   $me2 .= $data2;
  }
 close $xcode2;
 read_1 $me2,'Interfaces/PreferencePanel.xib';

 open my $xcode3,'<','Interfaces/iTermEditKeyActionWindowController.xib' or die"8 $!\n";
  while(my $data3 = <$xcode3>){
   if( $data3 =~ /title="[^"]+"/ ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data3 =~ s/title="[^"]+"/title="$bn[$e]"/;
       $e++; last;
    }
   }
   $me3 .= $data3;
  }
 close $xcode3;
 read_1 $me3,'Interfaces/iTermEditKeyActionWindowController.xib';

 open my $xcode4,'<','sources/iTermAdvancedSettingsModel.m' or die"9 $!";
  while(my $data4 = <$xcode4>){
   if( $data4 =~ /SECTION_.+@"[^\\"]+(?:\\n|")/ and $bn[$e] ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data4 =~ s/@"[^\\"]+(\\n|")/@"$bn[$e] $1/;
       $e++; last;
    }
   }
   if( $data4 =~ /SECTION_.+\\n[^\\]+\\n/ and $bn[$e] ){
    for(;$e<@bn;){ chomp $bn[$e];
     $data4 =~ s/\\n[^\\]+\\n/\\n$bn[$e]\\n/;
       $e++; last;
    }
   }
   if( $data4 =~ /SECTION_.+\\n[^"]+"/ and $bn[$e] ){
     if( $data4 =~ /.+\\n.+\\n.+/ ){
      for(;$e<@bn;){ chomp $bn[$e];
       $data4 =~ s/(.+\\n.+)\\n.*?"/$1\\n$bn[$e]"/;
         $e++; last;
      }
     }else{
      for(;$e<@bn;){ chomp $bn[$e];
       $data4 =~ s/\\n.*?"/\\n$bn[$e]"/;
         $e++; last;
      }
     }
    }
   $me4 .= $data4;
  }
 close $xcode4;
 read_1 $me4,'sources/iTermAdvancedSettingsModel.m';
}
