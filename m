Return-Path: <SRS0=wSdZ=F3=joelfernandes.org=joel@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1697160169; x=1697764969; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9SkgzJz50OVBUDL3TT4nvUwgLCVsigPygheX/dxd/I=;
        b=SNhsbwGTHz3PCYaJk1Kl/O7va+VDHwTBT9Ii0++/dfOhF/7D2nvv/GDbBm7R1QUYuB
         8KZY561Mb2nMwOgyfzQ3sRvEEap6TaSVYIgZaEbge6kx5u3Z/BrRuFEFUuQt6vi9wmdw
         gozsTt3UKMsajxwEIgZiVPfqXoKLHjFG7SDJU=
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: [PATCH] memorder: Add info on recent x86 implemenation of smp_mb()
Date: Fri, 13 Oct 2023 01:22:38 +0000
Message-ID: <20231013012238.1455140-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: perfbook@vger.kernel.org
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

smp_mb() uses lock;add for x86 in the linux kernel. Add information
about the same.

Cc: paulmck@kernel.org
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
Not even build tested, just focused on the content and to keep my promise I'd
send this out (better than never sending it) ;-). I appreciate maintainers of
perfbook taking this forward ;-). Thanks!

 bib/hw.bib            | 8 ++++++++
 memorder/memorder.tex | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/bib/hw.bib b/bib/hw.bib
index b0885e74..b1dfd119 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -1159,3 +1159,11 @@ Luis Stevens and Anoop Gupta and John Hennessy",
  note="\url{https://github.com/google/fuzzing/blob/master/docs/silifuzz.pdf}",
 }
 
+@unpublished{Tsirkin2017,
+ Author="Michael S. Tsirkin",
+ Title="locking/x86: Use LOCK ADD for smp_mb() instead of MFENCE",
+ month="November",
+ day="10",
+ year="2017",
+ note="\url{https://lore.kernel.org/all/tip-450cbdd0125cfa5d7bbf9e2a6b6961cc48d29730@git.kernel.org/}",
+}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5c978fbe..b28ac4f0 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -6081,6 +6081,14 @@ A few older variants of the x86 CPU have a mode bit that enables out-of-order
 stores, and for these CPUs, \co{smp_wmb()} must also be defined to
 be \co{lock;addl}.
 
+A 2017 kernel commit by Michael S. Tsirkin replaced \co{mfence} with
+\co{lock add} in \co{smp_mb()}, achieving a 60 percent performance
+boost~\cite{Tsirkin2017}. The change used a 4-byte negative offset from
+the \co{SP} to avoid slowness due to false data-dependencies,
+instead of directly modifying the \co{SP}. \co{clflush} users still
+need to use \co{mfence} for ordering, so they have been converted to use
+\co{mb} instead of \co{smp_mb}, which uses an \co{mfence} as before.
+
 Although newer x86 implementations accommodate self-modifying code
 without any special instructions, to be fully compatible with
 past and potential future x86 implementations, a given CPU must
-- 
2.42.0.655.g421f12c284-goog

