Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oOzmHhGo8ccsicNVGpfBXozPu/mXtleBwFFvyuMP3mM=;
        b=jnPB9Cm3wrXMAVR/CSX1bEWTe+YC+dVVbvVzLq5WF6HQut7fQlaoAuEeRIvER2OPE5
         sPUnnGhgCp2JFu2cPyjVlzrAH0/zLhttzykmBZvxWtiTto41R92UQslpRhLR3B3hLsar
         GG2ttMV8kSB7MWkwN8CVesQJS0zi2T+SXn8qgz6nmbgTowQpbHQ8AOWMqWBpyjkc65Tk
         SCEVY/P++bz4j3LNd+0kyl+hnV6tajHckTMoGXdNkVKvnjMG9fi4deR3YkGBkmh1M0VE
         hzInRrcliXLoJWgyTRts8LgGAYxhBE6P80FqW5aG3DXUjzHtxopUu+gJr5oo218DyJkj
         GYfg==
Subject: [PATCH 4/4] styleguide: Loosen restriction on comment in litmus test
References: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c512286b-7f12-c518-80f7-ba3cd2649302@gmail.com>
Date: Fri, 30 Nov 2018 07:15:21 +0900
MIME-Version: 1.0
In-Reply-To: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f07d05ca837a57e07f7a87bcbac2bf034905adab Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Nov 2018 22:20:18 +0900
Subject: [PATCH 4/4] styleguide: Loosen restriction on comment in litmus test

Reflect the change in the labeling of epilogue part of litmus
tests.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 3fe79ce..517424b 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -511,8 +511,8 @@ at the beginning of a litmus test.
 
 Similarly, several tokens such as \qco{exists}, \qco{filter},
 and~\qco{locations} indicate the end of litmus test's body.
-Once one of them appears in a litmus test, no comment is
-allowed to appear thereafter.  Those tokens keep the same meaning
+Once one of them appears in a litmus test, comments should be
+ocaml style (\qco{(* ... *)}). Those tokens keep the same meaning
 even when they appear in comments!
 
 The pair of characters \qco{\{} and \qco{\}} also have special
@@ -520,7 +520,7 @@ meaning in the C flavour tests. They are used to seperate portions
 in a litmus test.
 
 First pair of \qco{\{} and \qco{\}} encloses initialization part.
-Comments in this part should be of the form \qco{(* ... *)}.
+Comments in this part should also be in the ocaml form.
 
 You can't use \qco{\{} and \qco{\}} in comments in litmus tests, either.
 
@@ -544,7 +544,7 @@ P0(int *x}
 
 [...]
 
-exists (0:r1=0)  // comment after test body
+exists (0:r1=0)  // C++ style comment after test body
 \end{VerbatimN}
 \end{linelabel}
 
@@ -576,20 +576,11 @@ P1(int *x0, int *x1)
 	r2 = READ_ONCE(*x0);
 }
 
-//\end[snippet][existslabel=exists_]
-exists (1:r2=0 /\ 0:r2=0)
+//\end[snippet]
+exists (1:r2=0 /\ 0:r2=0)  (* \lnlbl[exists_] *)
 \end{VerbatimN}
 \end{linelabel}
 
-To support labeling lines after the test body, \co{\\end[snippet]}
-can have following options:
-
-\begin{VerbatimU}
-exsitslabel=<label of exists>
-filterlabel=<label of filter>
-locationslabel=<label of locations>
-\end{VerbatimU}
-
 Example above is converted to the following intermediate code
 by a script \path{utilities/reorder_ltms.pl}.\footnote{
 	Currently, only C flavour litmus tests are supported.
@@ -624,8 +615,8 @@ P1(int *x0, int *x1)
 	r2 = READ_ONCE(*x0);
 }
 
-exists (1:r2=0 /\ 0:r2=0)\lnlbl{exists_}
-//\end{snippet}[existslabel=exists_]
+exists (1:r2=0 /\ 0:r2=0)  \lnlbl{exists_}
+//\end{snippet}
 \end{VerbatimN}
 \end{linelabel}
 
-- 
2.7.4


