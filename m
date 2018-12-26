Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kmg7TT0945/E74KXR4Fi4FZ8Aut1NbeQqykV6nrT//A=;
        b=iVcjvjqbKMMv6NTJYncp9aFwG4Zs2SB/NT4DQtbyzBy5KWT/NXez/dZahk/M3xxSvp
         zPQasM8l1xkpzIov9OHf8wfghB90+JVTpbMthiopETvm2h1Cpexx3J+OQQvR0ykIBuZh
         nDC/VzygrjAZG/K4KSuxNyJyAx6B+nruSqXnFuffuR5EEiifqJQnVgbe0PPuOC/+RjUy
         00lOISQTyPsiBHcvZIpgUNQLhNOtlwyIPFbsEgDsfGQAT7p95/ZlgCFujIbWm983LiEC
         IkwQ9E3X7wTOD8d1ze0sua8CAZFaKqI/+ROY6fpEHQ31q8T74hxGaWABeNuawkAECXQd
         2Z4g==
Subject: [PATCH] gen_snippet_d.pl: Add rules to ignore editor's backup files
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
 <20181224235832.GW4170@linux.ibm.com> <20181225005315.GA20719@linux.ibm.com>
 <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5a07540a-7bf0-e0fc-9a02-9eb2314506d6@gmail.com>
Date: Wed, 26 Dec 2018 23:31:03 +0900
MIME-Version: 1.0
In-Reply-To: <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6c0e6e632bbf234de340bcf51acf2007d8e3ac8b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 26 Dec 2018 23:11:26 +0900
Subject: [PATCH] gen_snippet_d.pl: Add rules to ignore editor's backup files

Excerpt from Paul's report:
    $ make
    sh ./utilities/gen_snippet_d.sh
    sh utilities/autodate.sh >autodate.tex
    CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@data.fcv
    [...]
    CodeSamples/datastruct/hash/.hash_resize.c.swp --> CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
    utilities/fcvextract.pl CodeSamples/datastruct/hash/.hash_resize.c.swp hash > CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
    /bin/bash: CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv: No such file or directory
    make: *** [CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv] Error 1

.hash_resize.c.swp is a swap file of vim, which causes an invalid
dependency rule to be emitted.

To prevent such errors, ignore .swp files as well as emacs' backup
files ending in "~" and "#" from the search results in
gen_snippet_d.pl.

Reported-by: Paul E. McKenney <paulmck@linux.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

This should ignore .swp files in the dependency file.
Can you test "make" while opening hash_resize.c in vim?

        Thanks, Akira

PS:

I'll comment on the update of Quick Quiz 10.13 later this week.

--
 utilities/gen_snippet_d.pl | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/utilities/gen_snippet_d.pl b/utilities/gen_snippet_d.pl
index 8ba31b5..e07e58d 100755
--- a/utilities/gen_snippet_d.pl
+++ b/utilities/gen_snippet_d.pl
@@ -17,11 +17,19 @@ my @fcvsources_ltms;
 my $snippet_key;
 my $snippet_key_ltms;
 my $source;
+my @ignore_re;
+my $re;
 
 $snippet_key = '\begin{snippet}' ;
 $snippet_key_ltms = '\begin[snippet]' ;
+@ignore_re = ('\.swp$', '~$', '\#$') ;  # to ignore backup of vim and emacs
 @fcvsources = `grep -l -r -F '$snippet_key' CodeSamples` ;
+@fcvsources = grep { not /\.ltms$/ } @fcvsources ;
 @fcvsources_ltms = `grep -l -r -F '$snippet_key_ltms' CodeSamples` ;
+foreach $re (@ignore_re) {
+    @fcvsources = grep { not /$re/ } @fcvsources ;
+    @fcvsources_ltms = grep { not /$re/ } @fcvsources_ltms ;
+}
 chomp @fcvsources ;
 chomp @fcvsources_ltms ;
 
@@ -32,9 +40,6 @@ foreach $source (@fcvsources) {
     my @snippet_commands1 ;
     my $subdir ;
     my $snippet ;
-    if ($source =~ /\.ltms$/) {
-	next;
-    }
     @snippet_commands1 = `grep -F '$snippet_key' $source` ;
     chomp @snippet_commands1 ;
     $source =~ m!(.*/[^/]+)/[^/]+! ;
@@ -51,6 +56,7 @@ foreach $source (@fcvsources_ltms) {
     my @snippet_commands1 ;
     my $subdir ;
     my $snippet ;
+
     @snippet_commands1 = `grep -F '$snippet_key_ltms' $source` ;
     chomp @snippet_commands1 ;
     $source =~ m!(.*/[^/]+)/[^/]+! ;
@@ -77,9 +83,7 @@ foreach $source (@fcvsources) {
     my $src_under_sub ;
     my $subdir ;
     my $snippet ;
-    if ($source =~ /\.ltms$/) {
-	next;
-    }
+
     @snippet_commands2 = `grep -F '$snippet_key' $source` ;
     chomp @snippet_commands2 ;
     $src_under_sub = $source ;
-- 
2.7.4


