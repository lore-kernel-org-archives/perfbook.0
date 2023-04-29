Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682810553; x=1685402553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIpfwiLVUQ9qJZT0MMhS9wHNrQqr7zd0b5SK8V2uQXA=;
        b=QDac+ByflKh8QuK0LMmyWCcQy+Nr5ouluzsOtH+eeApcyfnyts22/WD+0qRuVw+UB0
         fI2iAKaw6dk9sYzh5Sokw0m7eWysC0D6w+RNwy+4+5e7GJhlxhY8a5GHuutLV7MZbmJd
         WYSV7sY91Ly8lvY5WYEB2+dhwd5VL1EVpRbJqS7AMxmtf9QjBSKGAtQH1C3hd2chx/yi
         kG+0CQgJUDvhY3fQIW36h9fUYw7XBlo41YMB10ME0tBDZsLbk1EqcB8n/tTV+BDt/nME
         QXgvs/LdgtmvIARM1TfTE6J/aSg86BWCuWiyCceiRH/9yMxrm67Mg1iFH/vZpHeszcMB
         FGow==
Message-ID: <94bb1aaa-3a0c-3dfc-a698-86d96be68dbc@gmail.com>
Date: Sun, 30 Apr 2023 08:22:29 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 6/7] Tweak TOC width params
Content-Language: en-US
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

We now have Section 15.5.10, (five digits + two periods).
Default of the book class can not afford that much digits in
subsection count.
Increase width parameters to accomodate it.

Also, as for -sf builds, the Helvetica clone font needs slightly
wider spaces in the "em" unit.  Add settings for -sf builds.

Mention default widths in the comment block for future reference.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index cdac9d495a3a..af5e0bf30032 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -158,11 +158,28 @@
 \setboolean{indexhier}{true}
 \newcommand{\IfIndexHier}[2]{\ifthenelse{\boolean{indexhier}}{#1}{#2}}
 
-% Widen pnumwidth in TOC for ebook size build (more than 1000 pages)
+% Tweak width params of TOC
 \makeatletter
-\IfEbookSize{
+\IfEbookSize{ % for ebook size build (more than 1000 pages)
 \renewcommand*\@pnumwidth{2.2em}
 }{}
+% default params defined in book.sty:
+%  width of chapter (two digits):			1.5em
+%  indent of section:					1.5em
+%  width of section (three digits + one periods):	2.3em
+%  indent of subsection:	  			3.8em
+%  width of subsection (four digits + two periods):	3.2em
+\IfSansSerif{	% sans serif (Helvetica clone)
+		%  to cover section "E.10" and subsection "15.5.10",
+		%  width of section:      2.4em
+		%  width of subsection:   3.7em
+\renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.4em}}
+\renewcommand*\l@subsection{\@dottedtocline{2}{3.9em}{3.7em}}
+}{		% serif (Times Roman clone)
+		%  to cover subsection "15.5.10",
+		%  width of subsection:   3.4em
+\renewcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.4em}}
+}
 \makeatother
 
 \IfEbookSize{
-- 
2.25.1


