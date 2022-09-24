#!/usr/bin/env perl
use strict;
use warnings;

unless( $ARGV[0] ){

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
   my( $data,$file );

 $file = -f 'Interfaces/MainMenu.xib' ? 'Interfaces/MainMenu.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1 $!";
   while(<$code>){
    $data .= "$1\n" if /\s+title="([^"]+)"/;
   }
  close $code;
  trans_1 $data,1; $data = '';
 }

 $file = -f 'Interfaces/PreferencePanel.xib' ? 'Interfaces/PreferencePanel.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"2 $!";
   while(<$code>){
    $data .= /\s+title="([^"]+)"/   ? "$1\n" :
             /\s+label="([^"]+)"/   ? "$1\n" :
             /\s+toolTip="([^"]+)"/ ? "$1\n" :
             m|<string key="title">(.+)</string>|   ? "$1\n" :
             m|<string key="toolTip">(.+)</string>| ? "$1\n" : '';
   }
  close $code;
  trans_1 $data,2; $data = '';
 }

 $file = -f 'Interfaces/iTermEditKeyActionWindowController.xib' ?
            'Interfaces/iTermEditKeyActionWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"3 $!\n";
   while(<$code>){
    $data .= "$1\n" if /\s+title="([^"]+)"/;
   }
  close $code;
  trans_1 $data,3; $data = '';
 }

 $file = -f 'sources/PointerPrefsController.m' ? 'sources/PointerPrefsController.m' : 0;
 if( $file ){
  open my $code,'<',$file or die;
   while(<$code>){
    $data .= "$1==$2\n" if /@"([^\s]+)\s+(.+)"/;
   }
  close $code;
  $data =~ s/-//g;
  trans_1 $data,4; $data = '';
 }

 $file = -f 'sources/iTermKeyBindingMgr.m' ? 'sources/iTermKeyBindingMgr.m':
         -f 'sources/iTermKeyBindingAction.m' ? 'sources/iTermKeyBindingAction.m' : 0;
 if( $file ){
  open my $code,'<',$file or die;
   while(<$code>){
    $data .= "$1\n" if /actionString\s+=\s+@"([^"]+)"/;
   }
  close $code;
  trans_1 $data,5; $data = '';
 }

 $file = -f 'sources/iTermAdvancedSettingsModel.m' ?
            'sources/iTermAdvancedSettingsModel.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"4 $!";
   while(<$code>){
    $data .= "$1\n" if /SECTION_.+@"([^\\"]+)(?:\\n|")/;
    $data .= "$1\n" if /SECTION_[^\\]+\\n([^"]+)"/;
   }
  close $code;
  trans_1 $data,6;
 }

 unlink 'tran.txt';
}

if( $ARGV[0] and $ARGV[0] == 1 ){

 sub read_1{
  my( $item,$file ) = @_;
  open my $read,'>',$file or die"read_1 $!\n";
   print $read $item;
  close $read;
 }
   my( $e,$me,$file ) = 0;

 open my $trans,'<','trans.txt' or die"5 $!\n";
  my @bn = <$trans>;
 close $trans;

 $file = -f 'Interfaces/MainMenu.xib' ? 'Interfaces/MainMenu.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"6 $!";
   while(my $data = <$code>){
    if( $data =~ /\s+title="[^"]+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/title="[^"]+"/title="$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file; $me = '';
 }

 $file = -f 'Interfaces/PreferencePanel.xib' ? 'Interfaces/PreferencePanel.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"7 $!";
   while(my $data = <$code>){
    if( $data =~ /\s+title="[^"]+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/title="[^"]+"/title="$bn[$e]"/;
        $e++; last;
     }
    }elsif( $data =~ /\s+label="[^"]+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/label="[^"]+"/label="$bn[$e]"/;
        $e++; last;
     }
    }elsif( $data =~ /<string key="title">/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s|.+|<string key="title">$bn[$e]</string>|;
        $e++; last;
     }
    }elsif( $data =~ /<string key="toolTip">/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s|.+|<string key="toolTip">$bn[$e]</string>|;
        $e++; last;
     }
    }elsif( $data =~ /\s+toolTip="/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/toolTip="[^"]+"/toolTip="$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file; $me = '';
 }

 $file = -f 'Interfaces/iTermEditKeyActionWindowController.xib' ?
            'Interfaces/iTermEditKeyActionWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"8 $!\n";
   while(my $data = <$code>){
    if( $data =~ /title="[^"]+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/title="[^"]+"/title="$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file; $me = '';
 }

 $file = -f 'sources/PointerPrefsController.m' ? 'sources/PointerPrefsController.m' : 0;
 if( $file ){
  open my $code,'<',$file or die;
   while(my $data = <$code>){
    if( $data =~ /@"[^\s]+\s+.+"/ ){
     for(;$e<@bn;){ #chomp $bn[$e];
      $bn[$e] =~ s/(.+)==(.+)\n/$1 $2/;
      $data =~ s/@".+"/@"$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file; $me = '';
 }

 $file = -f 'sources/iTermKeyBindingMgr.m' ? 'sources/iTermKeyBindingMgr.m':
         -f 'sources/iTermKeyBindingAction.m' ? 'sources/iTermKeyBindingAction.m' : 0;
 if( $file ){
  open my $code,'<',$file or die;
   while(my $data = <$code>){
    if( $data =~ /actionString\s+=\s+@"[^"]+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/(actionString\s+=\s+)@"[^"]+"/$1@"$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file; $me = '';
 }

 $file = -f 'sources/iTermAdvancedSettingsModel.m' ?
            'sources/iTermAdvancedSettingsModel.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"9 $!";
   while(my $data = <$code>){
    if( $data =~ /SECTION_.+@"[^\\"]+(?:\\n|")/ and $bn[$e] ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/(.*SECTION_.+)@"[^\\"]+(\\n|")/$1@"$bn[$e] $2/;
        $e++; last;
     }
    }
    if( $data =~ /SECTION_.+\\n([^\\]+)\\n/ and $bn[$e] ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/(.*SECTION_.+)\\n[^\\]+\\n/$1\\n$bn[$e]\\n/;
        $e++; last;
     }
    }
    if( $data =~ /SECTION_.+\\n[^"]+"/ and $bn[$e] ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/(.*SECTION_.+)\\n.*?"/$1\\n$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file;
 }
}
