Return-Path: <SRS0=EmAl=2P=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EdX5LdvPO8IXm7PL4ebJ9DdYkU8fvzKQjpV3IXixGuw=;
        b=Gt8hAJ1dLIJ/UmzY6Ded2bxUMmsNA0Co8Pj/4/G6d7GLq9bFsoPNwVAvyMxioVVSm2
         N61n7kDx2/XwDtvebGanOOSNT6DvsuWT2O7V4EnQziD+3UyR0x9BEHE6/kbXYK6GgnH2
         w/QG9GTbnhO5wJWaF1FTwr+cd6comn94b2guAIxeqXu3zfbnNquQBgcEG+jAWmS7a49F
         zaoBZT9sFoQlBzS8OliAEj2x6RuNng+KZ83cof7cMTvCZIcJ2FwhhjXc06gl2lw49ZZb
         /S0LXdqPQq72ywEEyL+NyU0mEJXDnIKDMrYAZh8uPuMxEYVpd9K2mFAVXV6mngsro6Kl
         XquA==
Message-ID: <c033269a-5cd7-608c-6bd9-3ee47bb56023@gmail.com>
Date: Fri, 14 Oct 2022 19:44:42 +0900
MIME-Version: 1.0
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook v2] memorder: fix a line number reference error
References: <20221014055543.8214-1-zhouzhouyi@gmail.com>
Content-Language: en-US
In-Reply-To: <20221014055543.8214-1-zhouzhouyi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Section 15.2.3 says,

  "Listing 15.10 shows how to make this work reliably on pre-v4.15
   Linux kernels running on DEC Alpha, by replacing line 19's
   READ_ONCE() with lockless_dereference()."

However, the READ_ONCE() is actually on line 18 of Listing 15.9.

Fix the reference and clarify the READ_ONCE() is in Listing 15.9.

Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v1 (from Zhouyi) -> v2

 - Reference line 18 of Listing 15.9.
 - Adjust wording around the fixed reference.
 - Zhouyi's Reported-by.

Zhouyi, how does this look to you?

Thanks, Akira
--
 memorder/memorder.tex | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index c350758d61cb..28319bfba16b 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1274,13 +1274,14 @@ exists (1:r2=x0 /\ 1:r3=1)
 \label{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
 \end{listing}
 
-\begin{fcvref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
+\begin{fcvref}[ln:formal:C-MP+o-wmb-o+o-addr-o:whole]
 \Cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
 % \path{C-MP+o-wmb-o+ld-addr-o.litmus} available at commit bc4b1c3f3b35
 % ("styleguide: Loosen restriction on comment in litmus test")
 shows how to make this work reliably on pre-v4.15 Linux kernels running on
-DEC Alpha, by replacing \clnref{read}'s \co{READ_ONCE()} with
-\apikh{lockless_dereference()},\footnote{
+DEC Alpha, by replacing \co{READ_ONCE()} on \clnref{P1:x1} of
+\cref{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering Before v4.15)}
+with \apikh{lockless_dereference()},\footnote{
 	Note that \co{lockless_dereference()} is not needed on v4.15 and
 	later, and therefore is not available in these later Linux kernels.
 	Nor is it needed in versions of this book containing this sentence.}

base-commit: c2b75b99a151008c6b59bddcabb9e44e744f3678
-- 
2.25.1


