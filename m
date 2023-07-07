Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688731521; x=1691323521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvJ9p95sFfUXLPaJN0zPbimYVu1fWbjgD0hoTinDGp0=;
        b=jbu4jfAYwPyWc5OvJTY9mSus9j5DNRmAf9LyGyK4AjgFDIzk8d8B4CBQDhuieJaYKL
         sodlnJxD5nPj6+Px6s/jAz08KTwrn8CkmOK3PjrkXG+nidWWUZ8CA51e7XhqOL3AMccN
         YWi4BC5sUaNSbAbRgBUVjac/BmARijco1vS0TTMAvb3Z8ajZ6IVMHcj/k0fVh8ZfW+Hs
         avFQb9uGkzTA76jXDvdCIYMy+asPFrI7hZFJVb0wj27lrl1Ji52oJ5/TMc3A774uk/pV
         YalXdqyWnY5n3GBdrS+MamcAgFz0GZJuY+mUoPGi5tz9nUt7HC6f/8qiJD7sWNeiLtAf
         nX/Q==
Message-ID: <7c150e94-ced7-2b28-0a9f-95b42c7e90f8@gmail.com>
Date: Fri, 7 Jul 2023 21:05:17 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 1/7] Get rid of 'twocolumn' option in \documentclass
Content-Language: en-US
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There is a lingering warning from the multicol package (indirectly
required by the idxlayout package) which reads:

    Package multicol Warning: May not work with the twocolumn
    option on input line 143.

This is due to the twocolumn option in \documentclass at the top
of preamble.

It turns out that it can be removed with minor tweaks.

One is the setting of \twocolumnwidth using \columnwidth for
2c builds.  Column width set by geometry becomes accessible after
\begin{document}.  Previously, the twocolumn option at
\documentclass permitted its use in the middle of preamble.

Instead, always set it using the value of 3.125in.

Another is the use of \sloppy.  It is implied in the book class
when the twocolumn option is specified.  Its effect is to prefer
wide inter-word white spaces to horizontal overfulls.
For perfbook, \sloppy is used explicitly for eb builds.
Do the same for 2c builds.

For 1c builds, as they have wider margins, occasional overfulls
should look better than wide inter-word spaces.

Get rid of the warning by removing the twocolumn option and applying
those minor tweaks.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 61b7a3b34fe1..af60f6f2388f 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -1,4 +1,4 @@
-\documentclass[10pt,twocolumn,letterpaper]{pfbook} % book class customized for perfbook
+\documentclass[10pt,letterpaper]{pfbook} % book class customized for perfbook
 % For arxiv.org, must be on or before line 5:
 \pdfoutput=1
 
@@ -464,8 +464,8 @@
 \newlength{\twocolumnwidth}
 \newlength{\onecolumntextwidth}
 \setlength{\onecolumntextwidth}{4.75in}
+\setlength{\twocolumnwidth}{3.125in}
 \IfTwoColumn{
-  \setlength{\twocolumnwidth}{\columnwidth}
   \renewcommand\floatpagefraction{.75}
   \IfHardCover{
     \usepackage[papersize={8.25in,10.75in},body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}
@@ -473,14 +473,15 @@
     \IfAfourPaper{
       \usepackage[a4paper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}
     }{
-      \usepackage[letterpaper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}      
-}}}{ % One Column
-  \setlength{\twocolumnwidth}{3.125in}
+      \usepackage[letterpaper,body={6.5in,8.25in},twocolumn,columnsep=0.25in]{geometry}
+    }}
+  \sloppy % prefer wide inter-word spaces to occasional horizontal overfulls
+}{ % One Column
   \IfEbookSize {
     % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
     \usepackage[papersize={4.5in,6.3in},margin=0.2in,footskip=0.2in,
       headsep=0.0335in,headheight=0.1665in,onecolumn,twoside=false]{geometry}
-    \sloppy
+    \sloppy % prefer wide inter-word spaces to occasional horizontal overfulls
     \setlength{\onecolumntextwidth}{4.1in}
     \usepackage{fancyhdr}
     \fancypagestyle{plain}{%
-- 
2.25.1


