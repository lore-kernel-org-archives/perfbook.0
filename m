Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aN9RometzeXrTvEeOElD3UM8t0XC9PtsTEiDTzBRBwE=;
        b=Msle7g7jVoJFF9dpN1uTaBTJkT/X0cblGMEsCvBg9CyydRipa2YCeVuOhl+J/5FsB/
         LK0nV+aMg35EsJtrctGUaoosBiO7i0mYpvTU5QPy5LuOCOOYZ2PAW/e6yKhaqpzk2QwU
         QLjxZ1JKjJsVINjkcBQYglN9Uj3XKNF3dCobg57I8vgCBl2s9IY6jN2+jYi1OtTd5M0M
         vFXzeSfUV4VP/RK3+txYVbBYuoiU+GZJYctgqhA41Yb/xzOc5YOCPBp0GA/wGsZPbFqB
         ee+A5EuRn2D60CQ+oQEnYy6OkCDAHRYyT8uY5BXOSBFQ466VEGvhYOw5ZNIpGJeXGkia
         DNCw==
Subject: [PATCH 2/2] memorder: Avoid citing duplicate bib entries
References: <b34039b3-cf06-ef01-8021-c6839934dbeb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <de62f2da-665c-4466-0bf5-8a3d318bacba@gmail.com>
Date: Wed, 19 Dec 2018 00:04:59 +0900
MIME-Version: 1.0
In-Reply-To: <b34039b3-cf06-ef01-8021-c6839934dbeb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3908668ab195e3b0b230eb7a667b03009107ca24 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 15 Dec 2018 22:39:02 +0900
Subject: [PATCH 2/2] memorder: Avoid citing duplicate bib entries

[MDR16a] and [MDR16b] are identical.

Let's consistently use "PaulEMcKenney2016LinuxKernelMMIO".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ef24095..cb4d037 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4926,7 +4926,7 @@ defined to be the heavyweight {\tt sync} instruction.
 However, Linux's \co{smp_wmb()} instruction is never used for MMIO
 (since a driver must carefully order MMIOs in UP as well as
 SMP kernels, after all), so it is defined to be the lighter weight
-\co{eieio} or \co{lwsync} instruction~\cite{PaulEMcKenney2016MMIO}.
+\co{eieio} or \co{lwsync} instruction~\cite{PaulEMcKenney2016LinuxKernelMMIO}.
 This instruction may well be unique in having a five-vowel mnemonic.
 The \co{smp_mb()} instruction is also defined to be the {\tt sync}
 instruction, but both \co{smp_rmb()} and \co{rmb()} are defined to
-- 
2.7.4


