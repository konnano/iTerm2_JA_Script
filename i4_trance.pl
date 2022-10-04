#!/usr/bin/env perl
use strict;
use warnings;
my $Lang = 'ja';

unless( $ARGV[0] ){

 sub trans_1{
  my( $data,$i,$ls ) = @_;
  open my $read,'>','tran.txt' or die"trans_1 $!\n";
   print $read $data;
  close $read;
   print" $i translate...\n";
  unless( $ls ){
   system"trap 'rm tran.txt trans.txt; exit 1' 1 2 3 15
          cat tran.txt|trans -b en:$Lang|
          perl -pe 's/：/:/g;s/&/&amp;/g;s/>/&gt;/g;s/</&lt;/g;s/\"/&quot;/g' >> trans.txt";
  }elsif( $ls and $ls == 1 ){
   system"trap 'rm tran.txt trans.txt; exit 1' 1 2 3 15
          cat tran.txt|trans -b en:$Lang|perl -pe 's/：/:/g;s/\"/”/g' >> trans.txt";
  }else{
   system"trap 'rm tran.txt trans.txt; exit 1' 1 2 3 15
          cat tran.txt|trans -b en:$Lang|perl -pe 's/：/:/g;s/\"/”/g'|
          sed 'N;s/\\n/==/' >> trans.txt";
  }
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
 }else{ print" Can't search file 1...\n"; }

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
 }else{ print" Can't search file 2...\n"; }

 $file = -f 'Interfaces/iTermPasteSpecialViewController.xib' ?
            'Interfaces/iTermPasteSpecialViewController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"3 $!";
   while(<$code>){
    $data .= /\s+title="([^"]+)"/   ? "$1\n" :
             /\s+toolTip="([^"]+)"/ ? "$1\n" :
             m|<string key="toolTip">(.+)</string>| ? "$1\n" : '';
   }
  close $code;
  trans_1 $data,3; $data = '';
 }else{ print" Can't search file 3...\n"; }

 $file = -f 'Interfaces/iTermEditKeyActionWindowController.xib' ?
            'Interfaces/iTermEditKeyActionWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"4 $!\n";
   while(<$code>){
    $data .= "$1\n" if /\s+title="([^"]+)"/;
   }
  close $code;
  trans_1 $data,4; $data = '';
 }else{ print" Can't search file 4...\n"; }

 $file = -f 'Interfaces/AdvancedWorkingDirectoryWindow.xib' ?
            'Interfaces/AdvancedWorkingDirectoryWindow.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"5 $!\n";
   while(<$code>){
    $data .= "$1\n" if /\s+title="([^"]+)"/;
   }
  close $code;
  trans_1 $data,5; $data = '';
 }else{ print" Can't search file 5...\n"; }

 $file = -f 'sources/iTermHotkeyPreferencesWindowController.xib' ?
            'sources/iTermHotkeyPreferencesWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"6 $!";
   while(<$code>){
    $data .= /\s+title="([^"]+)"/   ? "$1\n" :
             /\s+toolTip="([^"]+)"/ ? "$1\n" :
             m|<string key="title">(.+)</string>| ? "$1\n" : '';
   }
  close $code;
  trans_1 $data,6; $data = '';
 }else{ print" Can't search file 6...\n"; }

 $file = -f 'sources/iTermBadgeConfigurationWindowController.xib' ?
            'sources/iTermBadgeConfigurationWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"7 $!";
   while(<$code>){
    $data .= "$1\n" if /\s+title="([^"]+)"/;
   }
  close $code;
  trans_1 $data,7; $data = '';
 }else{ print" Can't search file 7...\n"; }

 $file = -f 'sources/PointerPrefsController.m' ? 'sources/PointerPrefsController.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"8 $!\n";
   while(<$code>){
    $data .= "$1\n" if /\s+@"([^\s]+)\s+.+"/;
    $data .= "$1\n" if /\s+@"[^\s]+\s+(.+)"/;
   }
  close $code;
  trans_1 $data,8,2; $data = '';
 }else{ print" Can't search file 8...\n"; }

 $file = -f 'sources/iTermKeyBindingMgr.m' ? 'sources/iTermKeyBindingMgr.m':
         -f 'sources/iTermKeyBindingAction.m' ? 'sources/iTermKeyBindingAction.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"9 $!\n";
   while(<$code>){
    $data .= "$1\n" if /actionString\s+=\s+@"([^"]+)"/;
   }
  close $code;
  trans_1 $data,9,1; $data = '';
 }else{ print" Can't search file 9...\n"; }

$file = -f 'sources/iTermAdvancedSettingsModel.m' ?
            'sources/iTermAdvancedSettingsModel.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"10 $!";
   while(<$code>){
    $data .= "$1\n" if /SECTION_.+@"([^\\"]+)(?:\\n|")/;
     $data .= "$1\n" if /SECTION_.+\\n([^\\]+)\\n/;
      $data .= "$1\n" if /SECTION_.+\\n([^"]+)"/;
   }
  close $code;
  trans_1 $data,10,1;
 }else{ print" Can't search file 10...\n"; }

  my $me;
  open my $code1,'<','trans.txt' or die "R1 $!\n";
   while(<$code1>){
   s/(\\) /$1/g;
   s/””|\\”//g;
   s/\\u003e/> /g;
   s/\\u0026/& /g;
   s/\\u003d/= /g;
   s/\\u200b//g;
   s/\\+([34])/\\\\$1/g;
   s/\\+.?$/\\/;
    $me .= $_;
   }
  close $code1;
  open my $code2,'>','trans.txt' or die "R2 $!\n";
   print $code2 $me;
  close $code2;

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

 open my $trans,'<','trans.txt' or die"item_1 $!\n";
  my @bn = <$trans>;
 close $trans;

 $file = -f 'Interfaces/MainMenu.xib' ? 'Interfaces/MainMenu.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_1 $!";
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
 }else{ print" Can't search file 1_1...\n"; }

 $file = -f 'Interfaces/PreferencePanel.xib' ? 'Interfaces/PreferencePanel.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_2 $!";
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
 }else{ print" Can't search file 1_2...\n"; }

 $file = -f 'Interfaces/iTermPasteSpecialViewController.xib' ?
            'Interfaces/iTermPasteSpecialViewController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_3 $!";
   while(my $data = <$code>){
    if( $data =~ /\s+title="[^"]+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/title="[^"]+"/title="$bn[$e]"/;
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
 }else{ print" Can't search file 1_3...\n"; }

 $file = -f 'Interfaces/iTermEditKeyActionWindowController.xib' ?
            'Interfaces/iTermEditKeyActionWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_4 $!\n";
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
 }else{ print" Can't search file 1_4...\n"; }

 $file = -f 'Interfaces/AdvancedWorkingDirectoryWindow.xib' ?
            'Interfaces/AdvancedWorkingDirectoryWindow.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_5 $!\n";
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
 }else{ print" Can't search file 1_5...\n"; }

 $file = -f 'sources/iTermHotkeyPreferencesWindowController.xib' ?
            'sources/iTermHotkeyPreferencesWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_6 $!";
   while(my $data = <$code>){
    if( $data =~ /\s+title="[^"]+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/title="[^"]+"/title="$bn[$e]"/;
        $e++; last;
     }
    }elsif( $data =~ /<string key="title">/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s|.+|<string key="title">$bn[$e]</string>|;
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
 }else{ print" Can't search file 1_6...\n"; }

 $file = -f 'sources/iTermBadgeConfigurationWindowController.xib' ?
            'sources/iTermBadgeConfigurationWindowController.xib' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_7 $!";
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
 }else{ print" Can't search file 1_7...\n"; }

 $file = -f 'sources/PointerPrefsController.m' ? 'sources/PointerPrefsController.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_8 $!\n";
   while(my $data = <$code>){
    if( $data =~ /\s+@"[^\s]+\s+.+"/ ){
     for(;$e<@bn;){ chomp $bn[$e];
      $bn[$e] =~ s/==/ /;
      $data =~ s/@".+"/@"$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file; $me = '';
 }else{ print" Can't search file 1_8...\n"; }

 $file = -f 'sources/iTermKeyBindingMgr.m' ? 'sources/iTermKeyBindingMgr.m':
         -f 'sources/iTermKeyBindingAction.m' ? 'sources/iTermKeyBindingAction.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_9 $!\n";
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
 }else{ print" Can't search file 1_9...\n"; }

 $file = -f 'sources/iTermAdvancedSettingsModel.m' ?
            'sources/iTermAdvancedSettingsModel.m' : 0;
 if( $file ){
  open my $code,'<',$file or die"1_10 $!";
   while(my $data = <$code>){
    if( $data =~ /SECTION_.+@"[^\\"]+(?:\\n|")/ and $bn[$e] ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/(.*SECTION_.+)@"[^\\"]+(\\n|")/$1@"$bn[$e] $2/;
        $e++; last;
     }
    }
    if( $data =~ /SECTION_.+\\n[^\\]+\\n/ and $bn[$e] ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/(.*SECTION_.+)\\n[^\\]+\\n/$1\\n$bn[$e]\\n/;
        $e++; last;
     }
    }
    if( $data =~ /SECTION_.+\\n[^"]+"/ and $bn[$e] ){
     for(;$e<@bn;){ chomp $bn[$e];
      $data =~ s/(.*SECTION_.+)\\n[^"]+"/$1\\n$bn[$e]"/;
        $e++; last;
     }
    }
    $me .= $data;
   }
  close $code;
  read_1 $me,$file;
 }else{ print" Can't search file 1_10...\n"; }
}
