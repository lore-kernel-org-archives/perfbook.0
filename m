Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ylUatzaQ2RW+cooZ8V4hAX41pEwuiz3j+69oqDOeZW8=;
 b=Q92HbrZ0dnm8b+TbyiScnNtLRVGgeC9QCX9+JoSaWlXOsJRHpWGiHSXDyMJ7m9bnIi
 hQ0+BH17D8hTs+aX8LLvlvpWjQ2X33TyziC3ezNy+m86KoiFQnwejLVdP6uI9fNfkvrI
 cRSVuyYv1qK+Phq4BtnFMG/E11KEJSQxIOhU/ZpaOcjR5DuP1I4IbwnNPJihCoqzffUR
 Z8BD6gasnjdWA/a/cBSaYmvZB6dE4FA/ycjCxC+K6ybt4IshQyngs92h+vXqj5i5rkZ1
 EnoUWiTXs6OHD0eJCz8DX/X0eF7VLTjBCUckSNCZX6JjT3Mpx5WFG/FBgRsN2ATUGMD0
 wQDA==
Subject: [PATCH] Improve messages regarding font installation
References: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <09228564-927a-0300-9f7c-7c86915092c0@gmail.com>
Date: Fri, 20 May 2016 00:06:58 +0900
MIME-Version: 1.0
In-Reply-To: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 42dc2a0371d48c0b23f4ed70d556ef15213b5f69 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 19 May 2016 23:34:27 +0900
Subject: [PATCH] Improve messages regarding font installation

In commit d8318d8db866 ("Add font installation check"), there was
typos already fixed by commit adc5a0ed9702 ("Fix typo "baloon" ->
"balloon"").
However, it breaks adjustment of "##" characters in the warning
messages.
This commit fixes them.
It also improves explanation of item 1 in FAQ-BUILD.txt by adding
a reference to item 1 of FAQ.txt.
It also adds a comment in Figure 1.1 that refers to item 1 in
FAQ.txt

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt         | 6 +++---
 howto/howto.tex       | 9 +++++----
 utilities/eps2pdf.sh  | 2 +-
 utilities/runlatex.sh | 2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index d963534..e888725 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -1,6 +1,6 @@
-1.	I have installed the Steel City Comic font, and rebuilt
-	"perfbook.pdf".  But it doesn't seem to have any effect.
-	What am I missing?
+1.	I have installed the Steel City Comic font referring to item 1
+	in FAQ.txt, and rebuilt "perfbook.pdf". But it doesn't seem to
+	have any effect. What am I missing?

 	A.	If you built "perfbook.pdf" before installing the font,
 		you need to rebuild cartoons whose sources are .svg
diff --git a/howto/howto.tex b/howto/howto.tex
index 6980114..7a70bb4 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -354,10 +354,11 @@ Other types of systems have well-known ways of locating files by filename.
 \begin{verbatim}
   1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
   2 cd perfbook
-  3 make
-  4 evince perfbook.pdf & # Two-column version
-  5 make perfbook-1c.pdf
-  6 evince perfbook-1c.pdf & # One-column version for e-readers
+  3 # You may need to install a font here. See item 1 in FAQ.txt.
+  4 make
+  5 evince perfbook.pdf & # Two-column version
+  6 make perfbook-1c.pdf
+  7 evince perfbook-1c.pdf & # One-column version for e-readers
 \end{verbatim}
 }
 \caption{Creating an Up-To-Date PDF}
diff --git a/utilities/eps2pdf.sh b/utilities/eps2pdf.sh
index 1497bdd..0a82d57 100644
--- a/utilities/eps2pdf.sh
+++ b/utilities/eps2pdf.sh
@@ -24,7 +24,7 @@ if ! fc-list | grep -q steel
 then
 	echo "#######################################################################"
 	echo "## Steel City Comic font is not found in the font cache!             ##"
-	echo "## Some speech balloons in the cartoons would be rendered awkwardly.  ##"
+	echo "## Some speech balloons in the cartoons would be rendered awkwardly. ##"
 	echo "## See item 1 in FAQ.txt for how to install the font.                ##"
 	echo "## Nevertheless, this build will resume in a short while.            ##"
 	echo "#######################################################################"
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 9ae9021..94d46d6 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -117,7 +117,7 @@ if ! grep -q -i "steel city comic" cartoons/*.pdf
 then
 	echo "#######################################################################"
 	echo "## Steel City Comic font is not found in the resulting PDF!          ##"
-	echo "## Some speech balloons in the cartoons have been rendered awkwardly. ##"
+	echo "## Some speech balloons in the cartoons have been rendered awkwardly.##"
 	echo "## See item 1 in FAQ-BUILD.txt for the solution.                     ##"
 	echo "#######################################################################"
 fi
-- 
1.9.1

