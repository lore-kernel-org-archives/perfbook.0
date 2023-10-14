Return-Path: <SRS0=1PbI=F4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697272941; x=1697877741; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hF9MACXM56uudOvtgLxX99OBER7imG7ChtIT57U4xGM=;
        b=AEEjev5VQU7bR8ZKmGBu4X5X4GoD8LclpxoWO2YLnc1Tq2X9TRHTyCbhh3/FLaansQ
         A9adIZvZG+LqAyssMFbWH1cz62+LgMkChdhl29hdxWDq1H93XeFOFg/fHsFQ7v3V1x9a
         so5v+7oF3gw/77zfEv1dG70nMEVcRpvfE+YwpLJV/+qhBV6NeSnp4W4epYi4dfFRgG5P
         3ikHPFzIvYXY+h8xPFdwzqdSVXtRra0npKq9wkgiq7s9PDzHcJoLtCZGsP+LNzSRr0xK
         dWSdoeO4xP5u9frcHZPQ28nQUjh8DOkMj4k+rsJJN5CDPC0Ca0KPcA0jPqGNbLHU0Wmd
         gucg==
Message-ID: <2890d207-6764-408a-8e19-22dbe4531146@gmail.com>
Date: Sat, 14 Oct 2023 17:42:16 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 2/3] memorder: Add info on recent x86
 implementation of smp_mb()
Content-Language: en-US
References: <20231013012238.1455140-1-joel@joelfernandes.org>
 <91cf01c3-3e67-4763-ab27-9070e50cb245@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <91cf01c3-3e67-4763-ab27-9070e50cb245@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

smp_mb() uses lock;add for x86 in the linux kernel. Add information
about the same.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Changes in v2 (by akiyks):
  - Apply punctuation conventions of perfbook LaTeX source.
      - Break lines at sentence-ending punctuation marks.
  - Overall wordsmith.
      - Fix typo in Subject. (implementation)
      - Drop confusing "the"s.
      - Use "lock;addl" for consistency in the section.
      - Reworded "instead of directly modifying SP" which surprised
        me a bit.
      - Reorder the final sentence to make it obvious that mb() is the
        one who uses mfence.
---
 memorder/memorder.tex | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5c978fbef172..6b9c3268e589 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -6081,6 +6081,16 @@ A few older variants of the x86 CPU have a mode bit that enables out-of-order
 stores, and for these CPUs, \co{smp_wmb()} must also be defined to
 be \co{lock;addl}.
 
+A 2017 kernel commit by Michael S.~Tsirkin replaced \co{mfence} with
+\co{lock;addl} in \co{smp_mb()}, achieving a 60 percent performance
+boost~\cite{Tsirkin2017}.
+The change used a 4-byte negative offset from \co{SP} to avoid
+slowness due to false data dependencies, instead of directly
+accessing memory pointed to by \co{SP}.
+\co{clflush} users still need to use \co{mfence} for ordering.
+Therefore, they were converted to use \co{mb()}, which uses \co{mfence}
+as before, instead of \co{smp_mb()}.
+
 Although newer x86 implementations accommodate self-modifying code
 without any special instructions, to be fully compatible with
 past and potential future x86 implementations, a given CPU must
-- 
2.25.1


