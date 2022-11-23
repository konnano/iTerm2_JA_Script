A Perl script that rewrites and translates iTerm2 sources</br>
It corresponds to the version of Xcode from GitHub where iTerm2 is published</br>
Find the version of iTerm2 and download it

Translation is left to Google, so translate-shell is required

``brew install translate-shell``

Select the target language with trans -T and change => my $Lang = 'ja';

Put this script in the downloaded iTerm2 folder</br>
In a terminal go into the iTerm2 folder and run

```perl i4_trance.pl```

Google Translate takes a long time</br>
Please wait while the prompt returns</br>
When the translation is finished, trans.txt contains the target string</br>
Since it is inserted in the source in order, please be careful about rewriting</br>
Please do not change half-width symbols when correcting machine translation

Example Mouse: <= : Please use half-width symbols</br>
== The half-width symbol judges the space, so it is okay to change the characters before and after</br>
but the characters before and after are necessary

If the order is wrong, trans.txt is added, so</br>
Delete trans.txt and start over</br>
After you have finished translating and correcting, please do the following:

```perl i4_trance.pl 1```

After that, if you build with Xcode, you should be able to translate
