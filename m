Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=pdss4D/IuGOeysZPaiCKFcoUn38M9Y8fUyCQSfsF3Xo=;
 b=V9HpPOjRGUtrPclA3H9VBcdKu2F4/SAYbRkau55laZ8MgIdQo7O6jwjqoUrpA2U3cr
 0endWY2kh/EOdGsGBhmJ/SSdB/xS0ZcEGgZHmCFUPUrmbcY82uz4TXm7/Tpint7HF3pI
 yPeTCVWTW+myaVDCPHyzv6cG7uX/ru6n8IQXld5ByoQZhNzVvKF+OMP7SW8YanNUUwA8
 l2LCIk8ASB0h18G5PcJKLaWFcFfGWZEcSrjcPokmHhBof2cjnhx+xPs0fuZcupQGdLx+
 oBCTYRt4/w8II94/2lgD0CwT49czperyCQ2gqL7E4HoCXFrfTDqo2Yj+mRKXMdG76Dmc
 9zzg==
Subject: [PATCH 01/13] Define \tco{} command to be used in table
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9dfd46c3-601d-7278-043b-7b7d4715118f@gmail.com>
Date: Wed, 4 Jan 2017 10:17:55 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6ccc6c3ca1d324ff09b79fc955eed07b13a4575c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 13:01:28 +0900
Subject: [PATCH 01/13] Define \tco{} command to be used in table

The \co{} command interferes with column width estimation of
tabular environment. To avoid the issue, this commit defines
a command "\tco{}" to be used instead. It will still break at white
spaces, but not at "_".
This commit also updates the definition of \nbco{} to make sure
that it won't break at "_".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 2942a3f..4eaace8 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -94,7 +94,10 @@
 \makeatother
 % ---  End of workaround for Fedora 23 Texlive bug
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
-\newcommand{\nbco}[1]{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}
+\newcommand{\nbco}[1]{\hbox{\texttt{\detokenize{#1}}}} % no break lines for short snippet
+\newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
+% \tco{} will break at spaces but not at underscores
+
 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

 \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
-- 
2.7.4


