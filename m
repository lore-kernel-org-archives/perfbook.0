Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BpAZ63y3+1LSZw719GTyY3zMJ5LMh+PFp8j+XznT9iI=;
 b=VBq9Ij6oFQavDAvimfat5kymG2O4FtKox7+uoBqL/uZ1oNieslObLrn4tpp9VII3e4
 qZhNFJLDVoEKvE89wAOZSWETsw/pds2quB1FR3M5am35hNgQv25uwVB5ZthPIdjFzprN
 GMaTKL9HyzRo2wKcjLvq0xYD0lGD3h2x/fkG4U5sNLlfVPl2ZWapybt8LT23dUg9Cwvz
 nN96/LakgpFUC634i0jbUksIcAYghBI7wzu2/7nkyQnB8sKgWoVP2uIHB/CAxvhm6/ar
 vzsRP0ImfhI6sd29oOVZpXUsa5vUP0HO2btl0C5i/JRUgsP9GBQHzXddK0M9DSjDvSug
 jn3A==
Subject: [RFC PATCH 2/3] FAQ-BUILD.txt: Add graphviz package as required
References: <be0f87e8-a39f-6c82-1946-46bacfcd6f66@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <75ad897b-773c-896f-78a4-9fcefa401516@gmail.com>
Date: Sun, 5 Jun 2016 23:57:49 +0900
MIME-Version: 1.0
In-Reply-To: <be0f87e8-a39f-6c82-1946-46bacfcd6f66@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 671ca17a531c5e658812c16c8983788f93b55293 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 4 Jun 2016 15:33:50 +0900
Subject: [RFC PATCH 2/3] FAQ-BUILD.txt: Add graphviz package as required

The implicit rule for .dot -> .eps requires 'dot' command.
It is availabe in the 'graphviz' package.
This commit adds it in item #5 of FAQ-BUILD.txt.
It also update Ubuntu's release name as 'Trusty'.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index e888725..f1be71a 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -34,14 +34,14 @@
 	find it?

 	A.	The "pdflatex" package is a variant of Don Knuth's
-		digital typesetting program.  On Ubuntu Maverick,
+		digital typesetting program.  On Ubuntu Trusty,
 		installing the following set of packages suffices:

 			texlive-latex-base texlive-latex-extra psutils
 			texlive-publishers-doc texlive-fonts-extra
 			texlive-math-extra texlive-publishers
 			texlive-science texlive-bibtex-extra latex2html
-			gnuplot-x11 xfig inkscape
+			gnuplot-x11 xfig inkscape graphviz

 		Other systems might provide similarly named packages.
 		For example, Doug Miller noted that the following list
-- 
1.9.1


