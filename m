Return-Path: <SRS0=OGBw=6K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMbclNZ14igjx6WKBQp47Dtb70qH4bDz1DpU4sYTqqA=;
        b=UFubhX/Q+oDg3haKpYONkXFZ18BtyhqgRTZ3WYpTHYJBEpNJI9K7W40+ZqFh5/fK7i
         /OkJgc2m4t0XIbKnWfmpNbIuwM/M+KuFrxtK1W/36Coc8SQZAGTqAfzqwMyYL78DXxyC
         +oe94QNTKYE/SiUVIWhxSj468dEa8CLbYyd+isvrzKWlBwCbgpSvUoybgHCjtV9iXdvP
         YYUsxaBR9zpw+d8A1bcpJofvmPa7LGC26L2VUWZJ+ZOYzIuNJOT8+S3jPwwaPfvDAsow
         dyB73JpMjgADCtDH4o/QOtm962yupHlOOcMntaUEIoFv7FyAKMwVNvM4Y8qg2pIcmRc0
         Bh9g==
Message-ID: <613a0c11-054c-fc2e-ba95-c460bc38c0d7@gmail.com>
Date: Tue, 14 Feb 2023 19:07:03 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/4] cpu: Use 'on-core' rather than 'in-core'
Content-Language: en-US
References: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Antonym of "off-core" should be "on-core" rather than "in-core".
Consistently use "on-core" in the overheads section.
Similarly, say "on-socket" rather than "in-socket".

Also for consistency, replace "single-CPU CAS" with "same-CPU CAS".

Also, QQz added in commit 34cc066b1d95 ("cpu: Add a QQz on table
E.1") uppercased some of related words in running text.
Lowercase them for consistency.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 7ae99ed6cb7b..af17b3cfdf2f 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -159,7 +159,7 @@ optimization.
 		& CAS      &   7.0 &   14.6 &		\\
 		& lock     &  15.4 &   32.3 &		\\
 	\midrule
-	\multicolumn{2}{l}{In-Core}
+	\multicolumn{2}{l}{On-Core}
 			   &       &        & 224	\\
 		& Blind CAS&   7.2 &   15.2 &		\\
 		& CAS	   &  18.0 &   37.7 & 		\\
@@ -223,7 +223,7 @@ The lock operation is more expensive than CAS because it requires two
 atomic operations on the lock data structure, one for acquisition and
 the other for release.
 
-In-core operations involving interactions between the hardware threads
+On-core operations involving interactions between the hardware threads
 sharing a single core are about the same cost as same-CPU operations.
 This should not be too surprising, given that these two hardware threads
 also share the full cache hierarchy.
@@ -253,10 +253,10 @@ failing.
 The key point is that there are now two accesses to the memory location,
 the load and the CAS\@.
 
-Thus, it is not surprising that in-core blind CAS consumes only about
-seven nanoseconds, while in-core CAS consumes about 18 nanoseconds.
+Thus, it is not surprising that on-core blind CAS consumes only about
+seven nanoseconds, while on-core CAS consumes about 18 nanoseconds.
 The non-blind case's extra load does not come for free.
-That said, the overhead of these operations are similar to single-CPU
+That said, the overhead of these operations are similar to same-CPU
 CAS and lock, respectively.
 
 \QuickQuiz{
@@ -351,7 +351,7 @@ thousand clock cycles.
 	& CAS		&          12.2	&          33.8 \\
 	& lock		&          25.6	&          71.2 \\
         \midrule
-        \multicolumn{2}{l}{In-Core}
+        \multicolumn{2}{l}{On-Core}
 			&		&		\\
 	& Blind CAS	&          12.9	&          35.8 \\
 	& CAS		&           7.0	&          19.4 \\
@@ -393,7 +393,7 @@ thousand clock cycles.
 	which represents a much smaller system with only 16~hardware threads.
 	A similar view is provided by the rows of
 	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
-	down to and including the two ``Off-core'' rows.
+	down to and including the two ``Off-Core'' rows.
 
 \begin{table}
 %\rowcolors{1}{}{lightgray}
@@ -420,7 +420,7 @@ thousand clock cycles.
 	& CAS			     &   6.2 &   13.6 &			  \\
 	& lock			     &  13.5 &   29.6 &			  \\
         \midrule
-	\multicolumn{2}{l}{In-Core}  &       &        &	6		  \\
+	\multicolumn{2}{l}{On-Core}  &       &        &	6		  \\
 	& Blind CAS		     &   6.5 &   14.3 &			  \\
 	& CAS			     &  16.2 &   35.6 &			  \\
         \midrule
@@ -470,7 +470,7 @@ thousand clock cycles.
 \QuickQuizE{
 	\Cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
 	in the answer to \QuickQuizARef{\QspeedOfLightAtoms} says that
-	In-Core CAS is faster than both of Same-CPU CAS and In-Core Blind CAS\@.
+	on-core CAS is faster than both of same-CPU CAS and on-core blind CAS\@.
 	What is happening there?
 }\QuickQuizAnswerE{
 	I \emph{was} surprised by the data I obtained and did a rigorous
@@ -508,7 +508,7 @@ First, there are only two CPUs within a given core and only 56 within
 a given socket, compared to 448 across the system.
 Second, as shown in
 \cref{tab:cpu:Cache Geometry for 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz},
-the in-core caches are quite small compared to the in-socket caches, which
+the on-core caches are quite small compared to the on-socket caches, which
 are in turn quite small compared to the 1.4\,TB of memory configured on
 this system.
 Third, again referring to the figure, the caches are organized as
-- 
2.25.1


