Return-Path: <SRS0=1PbI=F4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697273016; x=1697877816; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ksc6WYDZDvw8qMlW6AlkvPQ6uR/1eS7GAmpngPTdic=;
        b=FwmxWXOnnn10szmfB1P7xU/PRIoVAaeZtVbLtdTgpnJcDsHsKr9WBAj40WgfPVPoDW
         u/Qn3rnXb7zzcLJung9KA+9ke0qmcAl6lJ+2FrA8F+5TbTJjIQWJF7FEUzM/ARs5DLms
         jBMir51t3tPpg+GXlOq/Z/aAifYy/tlKNJdXgJC6SVdRCN3cmZJ8HbeSsCywKov31NIS
         lfbtzCthTpATnP1kugfBvUKUKLHkwZSCWZC+VXoZpc6cXe1kMCXn3jq2+h1Z/6lXSkoC
         +Jh+cs35OjwAbRG/YDivx7HvuDyn6C3933BKCcCmLHgRRdrVMgU3FQ1FjfRhJSbx0z3n
         1+gw==
Message-ID: <15c11f4f-52a7-4427-aec9-b2a875ad121c@gmail.com>
Date: Sat, 14 Oct 2023 17:43:33 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 3/3] memorder: Update of ordering SSE
 non-temporal memory move instructions
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

Since Linux v4.15, smp_mb(), smp_wmb(), and smp_rmb() don't suffice
for ordering them.

Update the text accordingly and add a footnote.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 6b9c3268e589..da56a6999c3f 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -6075,8 +6075,10 @@ that same location, you are on your own.
 Some SSE instructions are weakly ordered (\co{clflush}
 and non-temporal move instructions~\cite{IntelXeonV2b-96a}).
 Code that uses these non-temporal move instructions
-can also use \co{mfence} for \co{smp_mb()},
-\co{lfence} for \co{smp_rmb()}, and \co{sfence} for \co{smp_wmb()}.
+can use \co{mfence} for \co{mb()},
+\co{lfence} for \co{rmb()}, and \co{sfence} for \co{wmb()}.\footnote{
+	\co{smp_mb()}, \co{smp_rmb()}, and \co{smp_wmb()} don't suffice
+	for ordering non-temporal move instructions since Linux v4.15.}
 A few older variants of the x86 CPU have a mode bit that enables out-of-order
 stores, and for these CPUs, \co{smp_wmb()} must also be defined to
 be \co{lock;addl}.
-- 
2.25.1


