Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BDrLzgjF0RfOeIz1QyqAGNxOfoN+OmVbc3leoBfjFc0=;
 b=scdb0kCjv14nZNb74G5jJive+RIo9hy0mkJ4kDchpu0nS40JjwY2R1B7r5wNLunMLW
 iyoiXOb9Os4IvnJfnpUA07iVTxV9oWO2AypCWKfguj/0ttBFXaeEFQ9dueiac4O2QN9f
 RReRT/fhNFiM+tvOO0QJpc/cIOIRscBfhxoEVTqn+mKAGDP2TGrYXHPmFM8I6JpBupBJ
 XSVPjo3h7QS8AdMhyIixGEn4JmZX4w0x7C2tzTe+EoBTfBwm049dQ3naB5TP44lJbS9+
 NK06dSePHURqiTISHPVGyZHISOHxNVijllq/eNrn7BN8Kro+0bXQsMj4OgO98CcXwEEf
 rbvw==
Subject: [RFT PATCH 2/5] Add font installation check
References: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0050aeae-8bef-287d-37a6-531d957fccad@gmail.com>
Date: Tue, 3 May 2016 07:57:57 +0900
MIME-Version: 1.0
In-Reply-To: <9f8a3c0d-75fe-0b6f-733f-2134f67ccd6f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9720d1856b2b695c34648ca566a4afdcdcb86abb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Mon, 2 May 2016 19:03:11 +0900
Subject: [RFT PATCH 2/5] Add font installation check

This commit adds tests in eps2pdf.sh and runlatex.sh which check
the presence of the Steel City Comic font in the font cache and
in PDF files generated from .svg files.
If either of the tests fails, a message referring the user to
items 1 and 1.1 in FAQ.txt will be displayed.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 utilities/eps2pdf.sh  | 12 ++++++++++++
 utilities/runlatex.sh |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/utilities/eps2pdf.sh b/utilities/eps2pdf.sh
index c0fcdf9..b72f1a5 100644
--- a/utilities/eps2pdf.sh
+++ b/utilities/eps2pdf.sh
@@ -18,6 +18,18 @@
 # http://www.gnu.org/licenses/gpl-2.0.html.
 #
 # Copyright (c) 2010 Paul E. McKenney, IBM Corporation.
+# Copyright (c) 2016 Akira Yokosawa
+
+if ! fc-list | grep -q steel
+then
+	echo "#######################################################################"
+	echo "## Steel City Comic font is not found in the font cache!             ##"
+	echo "## Some speech baloons in the cartoons would be rendered awkwardly.  ##"
+	echo "## See item 1 in FAQ.txt for how to install the font.                ##"
+	echo "## Nevertheless, this build will resume in a short while.            ##"
+	echo "#######################################################################"
+	sleep 5
+fi

 epsfiles=`find . -name '*.eps' -print`
 for i in $epsfiles
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 228d320..3e46e6f 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -111,4 +111,12 @@ fi
 rm -f $basename-warning.log $basename-warning-prev.log
 touch $basename.pdf
 echo "No 'LaTeX Warning' found. '$basename.pdf' is ready."
+if ! grep -q -i "steel city comic" cartoons/*.pdf
+then
+	echo "#######################################################################"
+	echo "## Steel City Comic font is not found in the resulting PDF!          ##"
+	echo "## Some speech baloons in the cartoons have been rendered awkwardly. ##"
+	echo "## See items 1 and 1.1 in FAQ.txt for the solution.                  ##"
+	echo "#######################################################################"
+fi
 exit 0
-- 
1.9.1


