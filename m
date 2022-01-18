Return-Path: <SRS0=7ZAc=SC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2HMveR5C8rtzo7T+qhKC58tcrlvy41duVdiP5JmNvCI=;
        b=FkTWX/2zQYJEgxf9fnex8TvjcU5troleu9pCnpFqqItSywMoJAZDOQ93D7Ek9folLv
         VA1OJJurvyLAjizCwPTX1PIsxNF2/kJPbXgSokxtu43kcF0s6777qpipHPlYCfN+ioUk
         YcUa055SI2eVdXtgZ4QeU63IZTdHfU2UVbXtMnUaeBS6kj1yDQFlSNqWLm+EPVE77wtx
         iEYDHP5odRdnkC6qmtpHHcynJ47ndvpq2Oe4v/7cfSnn3QSv7HiHbt8HnUPaOSA4e1fh
         kKR0gftUj1q0Bb3McM82H3tIjA8zVmOaCWZTh3i64ry2BSeNW/kqIe4tdMFcrmvFQQ+v
         Pyvg==
Subject: [PATCH -perfbook 1/6] index: Initial page number format support
References: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <df0fe742-f690-f7fa-afa3-4652a018c34e@gmail.com>
Date: Tue, 18 Jan 2022 19:52:14 +0900
MIME-Version: 1.0
In-Reply-To: <014dcadf-e5ff-3a73-3b5a-a7951375d642@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

If plain \index{} macro were used for tagging terms, one could
say:

    \index{some word|textbf}

to have a page number in bold face.

However, existing indexing scheme conflicts with makeindex's page
number formatting and naively defined macros of \IXB{} and its
variants don't produce proper-format .idx files.

As a workaround, use a helper script "adjustindexformat.pl" to
overcome the conflict.
Adjusted .idx file is kept as $basename-adjust.idx.

See header comments of adjustindexformat.pl for adjustment samples.

Note: $basename.idx is overwritten by the final run of pdflatex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glsdict.tex                    |  5 ++++-
 perfbook-lt.tex                | 15 +++++++++++++++
 utilities/adjustindexformat.pl | 33 +++++++++++++++++++++++++++++++++
 utilities/runlatex.sh          |  2 ++
 4 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100755 utilities/adjustindexformat.pl

diff --git a/glsdict.tex b/glsdict.tex
index 7f7ae336..c2b2d050 100644
--- a/glsdict.tex
+++ b/glsdict.tex
@@ -13,7 +13,9 @@
     plural={\protect\glsabbrvfont{\the\glsshortpltok}},%
     description={\protect\glslongfont{\the\glslongtok}},
     user1={\protect\index{\the\glslongtok\space(\the\glsshorttok)%
-      @\makefirstuc{\the\glslongtok}\space(\the\glsshorttok)}}%
+      @\makefirstuc{\the\glslongtok}\space(\the\glsshorttok)}},%
+    user2={\protect\index{\the\glslongtok\space(\the\glsshorttok)%
+      @\makefirstuc{\the\glslongtok}\space[\the\glsshorttok]}}%
   }%
   \renewcommand*{\GlsXtrPostNewAbbreviation}{%
     \glshasattribute{\the\glslabeltok}{regular}%
@@ -178,6 +180,7 @@
 }
 
 \newcommand{\IXacr}[1]{\glsuseri{#1}\acr{#1}} % put index via acronym dictionary
+\newcommand{\IXBacr}[1]{\glsuserii{#1}\acr{#1}} % put index via acronym dictionary
 \newcommand{\IXacrpl}[1]{\glsuseri{#1}\acrpl{#1}} % put index via acronym dictionary (plural)
 \newcommand{\IXAcr}[1]{\glsuseri{#1}\Acr{#1}} % put index via acronym dictionary (upper case)
 \newcommand{\IXAcrpl}[1]{\glsuseri{#1}\Acrpl{#1}} % put index via acronym dictionary (upper case, plural)
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 98899d80..79de56c1 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -205,6 +205,21 @@
 \newcommand{\IXhr}[2]{\indexhr{#1 #2}{#2}{#1}\hlindex{#1 #2}}
 \newcommand{\IXalth}[3]{\indexh{#1}{#3}{#2}\hlindex{#1}}
 \newcommand{\IXalthr}[3]{\indexhr{#1}{#3}{#2}\hlindex{#1}}
+% page number in bold face
+\newcommand{\BF}[1]{\textbf{#1}}
+\newcommand{\IXB}[1]{\ucindex{#1|BF}\hlindex{#1}} % put with first letter capitalized into general index
+\newcommand{\IXBr}[1]{\index{#1|BF}\hlindex{#1}} % put as is into general index
+\newcommand{\IXBpl}[1]{\ucindex{#1|BF}\hlindex{#1s}} % put with first letter capitalized into general index for plural
+\newcommand{\IXBplr}[1]{\index{#1|BF}\hlindex{#1s}} % put as is into general index for plural
+\newcommand{\IXBplx}[2]{\ucindex{#1|BF}\hlindex{#1#2}} % put as is into general index for plural of exeptional form
+\newcommand{\IXBalt}[2]{\ucindex{#2|BF}\hlindex{#1}} % put alternative with first letter capitalized into general index
+\newcommand{\IXBaltr}[2]{\index{#2|BF}\hlindex{#1}} % put alternative as is into general index
+\newcommand{\IXBh}[2]{\indexh{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2}}
+\newcommand{\IXBhpl}[2]{\indexh{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2s}}
+\newcommand{\IXBhr}[2]{\indexhr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2}}
+\newcommand{\IXBalth}[3]{\indexh{#1|BF}{#3|BF}{#2}\hlindex{#1}}
+\newcommand{\IXBalthr}[3]{\indexhr{#1|BF}{#3|BF}{#2}\hlindex{#1}}
+%
 \newcommand{\apic}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{c}}}
 \newcommand{\apig}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{g}}}
 \newcommand{\apipx}[1]{\hlindex{\co{#1}}\sindex[api]{#1@\co{#1}\categapi{px}}}
diff --git a/utilities/adjustindexformat.pl b/utilities/adjustindexformat.pl
new file mode 100755
index 00000000..6cdc8c8f
--- /dev/null
+++ b/utilities/adjustindexformat.pl
@@ -0,0 +1,33 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Adjust index entry format in .idx file generated by \IXB{} and
+# its variants.
+#
+# Adjustment samples (diff):
+#
+# -\indexentry{deadlock|hyperindexformat{\bf@\makefirstuc {deadlock|bf}}}{228}
+# +\indexentry{deadlock@\makefirstuc {deadlock}|hyperindexformat{\BF}}{228}
+# -\indexentry{read-copy update (RCU)@\makefirstuc {read-copy update} [RCU]|hyperpage}{306}
+# +\indexentry{read-copy update (RCU)@\makefirstuc {read-copy update} (RCU)|hyperindexformat{\BF}}{306}
+# -\indexentry{critical section|hyperindexformat{\bf@\makefirstuc {critical section|bf}!RCU read-side}}{325}
+# +\indexentry{critical section@\makefirstuc {critical section}!RCU read-side|hyperindexformat{\BF}}{325}
+#
+# Copyright (C) Akira Yokosawa, 2022
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $line;
+
+open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
+    or die "Could not open file '$ARGV[0]' $!";
+
+while($line = <$fh>) {
+    $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\bf(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\BF\}\}/ ;
+    $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\bf(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\BF\}\}/ ;
+    $line =~ s/(\\makefirstuc )\{([^\)]+)\} \[([^\]]+)\]\|hyperpage\}/$1\{$2\} \($3\)|hyperindexformat\{\\BF\}\}/ ;
+    print $line ;
+}
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 37636f07..48761fd0 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -64,6 +64,8 @@ exerpt_warnings () {
 }
 
 iterate_latex () {
+	perl utilities/adjustindexformat.pl $basename.idx > $basename-adjust.idx
+	cp -f $basename-adjust.idx $basename.idx
 	makeindex $basename.idx > /dev/null 2>&1
 	makeindex $basename-api.idx > /dev/null 2>&1
 	if grep -q '## Warning' $basename.ilg $basename-api.ilg
-- 
2.17.1


