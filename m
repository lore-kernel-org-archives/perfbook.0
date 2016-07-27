Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BZwT/D/QblMXmHju0hJd4OOmvE8lz/57YRNYkVM1vtE=;
 b=QQ2Fust6XSmgVurqPzvgfeVfDIyhrYiILzTtNp7jdR/WDEILyp96NZ8Svr5mCaFkmf
 0gtkRdyJRAT4PuLFFsUPgPXAm/e3EXaoElbZUo2J98BF4btr2XQBoC6pAU8xVij5SiU2
 Ttfd0M7y2i41HOA0iGEPZWikoYt/HFTyweSrGGsZpTvA1fjTA0h1quBv+fkiVF4kh3Xf
 zkF7SD5mpybXxZGHcat5+ebtPeL+vXQsjLU+uX2/yBDBXkaoAQ8Bnvbs1ueJcCXZSetE
 bGn+OYDzQs6cNwy9Xiy5o3UDc6fcu9wZ3e/FBakS8TCzZ2IMrZQSHw3nYalZSp6e6ehS
 4E4Q==
Subject: [PATCH v2] Tweak width of epigraph
References: <7dd18275-9406-b024-9766-6fe6aa3cb7e4@gmail.com>
 <20160726152216.GY7094@linux.vnet.ibm.com>
 <86975302-4961-0437-8170-df9e12145390@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fadd9a11-78e8-ced4-ae35-66ca845b7fd4@gmail.com>
Date: Thu, 28 Jul 2016 00:09:32 +0900
MIME-Version: 1.0
In-Reply-To: <86975302-4961-0437-8170-df9e12145390@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 63252e8e5f8e3a74e1ab41fd577b90cdf037e36c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 27 Jul 2016 23:51:18 +0900
Subject: [PATCH v2] Tweak width of epigraph

The default of \epigraphwidth is .5\textwidth.
This causes different widths of one-column and two-column layouts.
This commit defines it in an absolute length to specify same
width for both layouts

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 9216485..95902be 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -31,7 +31,7 @@
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
 \usepackage{epigraph}
-
+\setlength{\epigraphwidth}{2.3in}
 % custom packages

 \usepackage{qqz}
-- 
1.9.1


