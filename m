Return-Path: <SRS0=7RMV=FG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695390948; x=1695995748; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTFWaUHINlU4dO2Bg3gcOiY0i83vG4Riiex4lYGwRwk=;
        b=Iie8uo+Fk0mzyQB5Es0i2D78x49II2pphtRRKDN+DeHDCegDBAfNKniRD/mvWX8Nhi
         dO4jiOwoLIm6z6lldPNTiRpZc77T+bnNFunVbSK+lBTkUjsJQXc57hVA8ebh+XdHxMd7
         QdtOhSwJWw/naEAdVfbfqdmZ7JvAStzEw0Wa8MtUaj2EjMIo9dPRlpRpgqDOjGQQ4EZJ
         elpq/60ntSObI1iHRkRNvbowFpLle7q+SjnK7/glEcXBTbZCVyD/DZIlQ93yZh0RzZp+
         pLEAueMbVUmtahCbwz0MBEju6wpYDNrrdV/vuTQxjQ22JJHlbMIE4Q0kGFUFLOXXl2yS
         JgaA==
Message-ID: <a78a4604-cd3f-1adc-320d-2dbedf1f169b@gmail.com>
Date: Fri, 22 Sep 2023 22:55:44 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/4] memorder: Add index markers for
 'address/control/data dependency', take 2
Content-Language: en-US
References: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add a few more index markers.

Note that the macro \IXpl{} and its friends don't work for the
plural form of "dependencies".

\IXalth{}{}{} is used instead.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 9610618b41f4..9af41194f1de 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3411,7 +3411,8 @@ In contrast, the penalty for failing to use them when needed can be quite high.
 \label{sec:memorder:Address- and Data-Dependency Difficulties}
 \OriginallyPublished{sec:memorder:Address- and Data-Dependency Difficulties}{Address- and Data-Dependency Difficulties}{the Linux kernel}{PaulEMcKenney2014rcu-dereference}
 
-The low overheads of the address and data dependencies discussed in
+The low overheads of the \IXalth{address}{address}{dependency}
+and \IXalth{data dependencies}{data}{dependency} discussed in
 \cref{sec:memorder:Address Dependencies,%
 sec:memorder:Data Dependencies},
 respectively, makes their use extremely attractive.
@@ -3770,7 +3771,7 @@ compiler-generated assembly code.
 \subsection{Control-Dependency Calamities}
 \label{sec:memorder:Control-Dependency Calamities}
 
-The control dependencies described in
+The \IXalth{control dependencies}{control}{dependency} described in
 \cref{sec:memorder:Control Dependencies}
 are attractive due to their low overhead, but are also especially
 tricky because current compilers do not understand them and can easily
@@ -5403,7 +5404,8 @@ One could place an \co{smp_rmb()} primitive
 between the pointer fetch and dereference in order to force Alpha
 to order the pointer fetch with the later dependent load.
 However, this imposes unneeded overhead on systems (such as \ARM,
-Itanium, PPC, and SPARC) that respect address dependencies on the read side.
+Itanium, PPC, and SPARC) that respect
+\IXalth{address dependencies}{address}{dependency} on the read side.
 A \co{smp_read_barrier_depends()} primitive was therefore added to the
 Linux kernel to eliminate overhead on these systems, but was removed
 in v5.9 of the Linux kernel in favor of augmenting Alpha's definition
@@ -5550,7 +5552,8 @@ similar to that of \Power{}'s cumulativity, both of which are
 stronger than \IXacr{lkmm}'s cumulativity described in
 \cref{sec:memorder:Cumulativity}.
 
-\ARM\ also implements control dependencies, so that if a conditional
+\ARM\ also implements \IXalth{control dependencies}{control}{dependency},
+so that if a conditional
 branch depends on a load, then any store executed after that conditional
 branch will be ordered after the load.
 However, loads following the conditional branch will \emph{not}
-- 
2.25.1


