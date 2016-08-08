Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ftvH19rb4ej57t5Cb8T8MBOaeSUZHUAWP4Abw+duyAU=;
 b=vJTbCDo5+44OXT2V8wGtiQxh/CCXWEeKSMGD5J98sGMAZGgbr3L8HiY2pg6E/eIX4L
 t314f2b56cx577EuqdxOyh04Q7wYt2ZToZ/2Bt+x7prMol7vzp6SGVnxKiMs1CENCpr2
 GeGG/Hd8c5xE94N5CTMa8tehuCRxxSAbM6b+ExwwTFLAhS11PyK55Bb7vWrUUVaZy5H/
 Rh5aVEOPGdF4OnvUrF+UONHCe19dQfeUyvfcltUTQwrFDaIGRKnbCJGrOmCqkaS7vw8L
 YxcsbeULxVuayUdWrGAwS/cHgIazhbDz4F/nkYFbHuCcyH/5FYcISLtN7Yhiejkl9ial
 y9Ww==
Subject: [PATCH 3/5] Add \nbco{} command for code snippet without line break
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <40bc5037-1d7a-d45a-3051-a711f84bea06@gmail.com>
Date: Tue, 9 Aug 2016 00:05:02 +0900
MIME-Version: 1.0
In-Reply-To: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3c752419a442afc8d6763ca0e46f77fd8ee14efe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 5 Aug 2016 21:03:23 +0900
Subject: [PATCH 3/5] Add \nbco{} command for code snippet without line break

This commit also replaces an instance of \co{} command in
formal/ppcmem.tex with the \nbco{} command

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 perfbook.tex      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index cf637ad..c5ec6ed 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -96,7 +96,7 @@ In the example, line~1 identifies the type of system (``ARM'' or ``PPC'')
 and contains the title for the model. Line~2 provides a place for an
 alternative name for the test, which you will usually want to leave
 blank as shown in the above example. Comments can be inserted between
-lines~2 and~3 using the OCaml (or Pascal) syntax of \co{(* *)}.
+lines~2 and~3 using the OCaml (or Pascal) syntax of \nbco{(* *)}.

 Lines~3-6 give initial values for all registers; each is of the form
 \co{P:R=V}, where \co{P} is the process identifier, \co{R} is the register
diff --git a/perfbook.tex b/perfbook.tex
index 34059e0..35d6ced 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -61,6 +61,7 @@
 \makeatother
 % ---  End of workaround for Fedora 23 Texlive bug
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
+\newcommand{\nbco}[1]{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}

 \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
 \author{
-- 
1.9.1


