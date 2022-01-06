Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qrvRahSS2vENoNCawg1Pj1GALAS8oK6m8MwdsrZ+t7E=;
        b=gbJJ2RrE/ODJle1fVqsw7QLgR+YSbWV2+3y/GCmO6i5NnKf/QGm9vAhu4dC25jEaMu
         jc+rwIwgnncL3Qd0c/F6rMSVU2qv0iYHMlpuR8UZBI9t0e6r43MumXynAWWroA1Dtn3K
         G1FPxc5FkJoOcYoGQm72rhzo7b1cWlKa05MYRbodQ3hOGw+ibdbcLnGuMLP81TROZXCl
         8EUce/cXk3V7D6amX+xbAZ0pDNGpDF7ZFo3AaksSgvptbX/ocKuHBfnwga3dfeV9kT45
         DBiTekukXHkAC2onAfBYzE8spMKGr3Dj3x/GLAf13HMALIbUD56wpk3mRkpUwk6/jDXt
         izBw==
Subject: [PATCH RESEND -perfbook 10/10] WIP locking: Add acronym tag for RAII
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c678dc7c-6a0d-9f81-7e43-977de4fb76cc@gmail.com>
Date: Thu, 6 Jan 2022 16:44:19 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The use of \IXacrmfst{} macro changes the resulting sentence from:

  ... to use the object-oriented "resource allocation is
  initialization" (RAII) pattern [...].

to:

  ... to use the object-oriented \emph{resource-allocation-is-
  initialization} (RAII} pattern [...].

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glsdict.tex         | 2 ++
 locking/locking.tex | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/glsdict.tex b/glsdict.tex
index c861e09b..7f7ae336 100644
--- a/glsdict.tex
+++ b/glsdict.tex
@@ -229,6 +229,8 @@
 \newacronym{numa}{NUMA}{non-uniform memory architecture}
 \newacronym{qsbr}{QSBR}{quiescent-state-based reclamation}
 \newabbreviation{qsbr:m}{QSBR}{quiescent-state-based-reclamation}
+\newacronym{raii}{RAII}{resource allocation is initialization}
+\newabbreviation{raii:m}{RAII}{resource-allocation-is-initialization}
 \newacronym{rcu}{RCU}{read-copy update}
 \newacronym{smp}{SMP}{symmetric multiprocessing}
 \newabbreviation{smp:m}{SMP}{symmetric-multiprocessing}
diff --git a/locking/locking.tex b/locking/locking.tex
index 2a6068a7..851a1f00 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1571,8 +1571,8 @@ compared to VAX/VMS's six.
 The locking primitives discussed thus far require explicit acquisition and
 release primitives, for example, \co{spin_lock()} and \co{spin_unlock()},
 respectively.
-Another approach is to use the object-oriented ``resource allocation
-is initialization'' (RAII) pattern~\cite{MargaretAEllis1990Cplusplus}.\footnote{
+Another approach is to use the object-oriented \IXacrmfst{raii}
+pattern~\cite{MargaretAEllis1990Cplusplus}.\footnote{
 	Though more clearly expressed at
 	\url{https://www.stroustrup.com/bs_faq2.html\#finally}.}
 This pattern is often applied to auto variables in languages like C++,
-- 
2.17.1


