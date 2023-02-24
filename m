Return-Path: <SRS0=YGgH=6U=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zB6vAbP1CwHmQ4+EpdDMGreL9jHXQ10Fl35YYlhV3cw=;
        b=kR2fowyfTAUkVhUowCYjuVb3+R7XNqQ7bvH62xn9BegWJlfNTl3sHWyWKLJcMoWbP1
         br+fYYyYJv1bWj8R0xTJYq6i4vBu0bbitQfluYicJqlDVe247o7JuJ2NdgCRTUjuKbpi
         Zpr5Dd5YA5TKPeGCkTay7H4BNDtxRGcT9/HJkS9Ze6FS66gQ1TgBWJRaTtNACg7poP/y
         1nSQymlLaIhy29l+XxL7IrBSL29ZUgdMXzpqAgdvPqBGI2MfusHZiT8JKGgzegczjunG
         YwSYZHh3r5Kogllx6zDy60K6Oz1QSxt8et/SxBO2ejXOUfiXaHeWOi82Dqxe4yfupo4h
         fy3w==
Message-ID: <fe3f8b90-7d63-df5a-2e1e-747773b85b47@gmail.com>
Date: Fri, 24 Feb 2023 18:26:46 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] memorder: Fix PowerPC's rmb() requirement
Content-Language: en-US
References: <ffb3543d-658f-9aa5-d094-f5bdd449e7bc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ffb3543d-658f-9aa5-d094-f5bdd449e7bc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Linux kernel's commit 598056d5af8f ("[POWERPC] Fix rmb to order
cacheable vs. noncacheable") [1] strengthened rmb() to use the sync
instruction and a later commit 957ab07b44d8 ("powerpc: Optimise
smp_rmb") [2] updated the comment block above, both back in 2008.

Currently, Section 15.5.6 mentions that lwsync is good enough for
rmb(). This text has been there since the first commit of perfbook
made in August 2008, without ever being updated since.

Reflect the current state of affairs in the text.
Also consistently use "primitive" for kernel APIs.

This discrepancy was caught while reviewing a patch submission at
lkml [3].

Link: [1] https://git.kernel.org/linus/598056d5af8f
Link: [2] https://git.kernel.org/linus/957ab07b44d8
Link: [3] https://lore.kernel.org/r/20230222090344.189270-1-kconsul@linux.vnet.ibm.com/
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ee8119125c23..d158d4f348cf 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4982,20 +4982,22 @@ instructions~\cite{PowerPC94,MichaelLyons05a}:
 \end{description}
 
 Unfortunately, none of these instructions line up exactly with Linux's
-{\tt wmb()} primitive, which requires {\em all} stores to be ordered,
-but does not require the other high-overhead actions of the {\tt sync}
+\co{wmb()} primitive, which requires \emph{all} stores to be ordered,
+but does not require the other high-overhead actions of the \co{sync}
 instruction.
+The \co{rmb()} primitive doesn't have a matching light-weight instruction
+either.
 But there is no choice:
-{ppc64} versions of {\tt wmb()} and {\tt mb()} are defined to be the
-heavyweight {\tt sync} instruction.
-However, Linux's \co{smp_wmb()} instruction is never used for MMIO
+{ppc64} versions of \co{wmb()}, \co{rmb()}, and \co{mb()} are defined
+to be the heavyweight \co{sync} instruction.
+However, Linux's \co{smp_wmb()} primitive is never used for MMIO
 (since a driver must carefully order MMIOs in UP as well as
 SMP kernels, after all), so it is defined to be the lighter weight
 \co{eieio} or \co{lwsync} instruction~\cite{PaulEMcKenney2016LinuxKernelMMIO}.
 This instruction may well be unique in having a five-vowel mnemonic.
-The \co{smp_mb()} instruction is also defined to be the {\tt sync}
-instruction, but both \co{smp_rmb()} and \co{rmb()} are defined to
-be the lighter-weight {\tt lwsync} instruction.
+The \co{smp_mb()} primitive is also defined to be the \co{sync}
+instruction, while \co{smp_rmb()} is defined to be the lighter-weight
+\co{lwsync} instruction.
 
 \Power{} features ``cumulativity'', which can be used to obtain
 transitivity.
-- 
2.25.1


