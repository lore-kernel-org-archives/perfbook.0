Return-Path: <SRS0=QZ2n=I2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=69iHX1hblzNeSVRqHxraXkgBfFNScHCYCwg9f98XZaU=;
        b=Rl04oC/2+q8qI6HBnmcH9MUNs9/y7R8/zEUmgc0+s4zAkqcN840YHzfDjKbqvF9Fos
         txPhXvPdhMyNa+p2XixukFZz/hR8/PwlnUNzlkhrksZhOawfiLR7cETmVATLlkBS9OQ0
         dZjqOqmt4TWvVuopGujG4cj+S7/FyC/Vz1o8FWqTpC/oHEcv2IoyMPZq+hqtnRFTRDV6
         WIwPy/O4vkNk3h5yRhK/b2IMYHc9PhchRlIjf8D3Nb82IktSA0IHgfLf9JpOVUPC50EM
         Svy/5bdFq63jpj3BIiGQB0/c1XdUiJu+YCdPekm4vFYB7/y882KyqugNzdhV22EUVxq0
         h3GA==
Subject: [PATCH -perfbook 5/5] toyrcu: Move float away from section heading
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1b0c87db-7de2-7253-a613-c419cbdbd00f@gmail.com>
Date: Sun, 28 Mar 2021 17:58:37 +0900
MIME-Version: 1.0
In-Reply-To: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This change prevents a potential orphaned heading (section heading
at the bottom of a page/column).
It also allows the removal of \NoIndentAfterThis macro.

The orphaned heading was observed in the ebook-size build.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 94177293..7dcf1ea3 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -36,7 +36,11 @@ provides a summary and a list of desirable RCU properties.
 
 \section{Lock-Based RCU}
 \label{sec:app:toyrcu:Lock-Based RCU}
-\NoIndentAfterThis
+
+Perhaps the simplest RCU implementation leverages locking, as
+shown in
+\cref{lst:app:toyrcu:Lock-Based RCU Implementation}
+(\path{rcu_lock.h} and \path{rcu_lock.c}).
 
 \begin{listing}[htbp]
 \input{CodeSamples/defer/rcu_lock@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
@@ -45,10 +49,6 @@ provides a summary and a list of desirable RCU properties.
 \label{lst:app:toyrcu:Lock-Based RCU Implementation}
 \end{listing}
 
-Perhaps the simplest RCU implementation leverages locking, as
-shown in
-\cref{lst:app:toyrcu:Lock-Based RCU Implementation}
-(\path{rcu_lock.h} and \path{rcu_lock.c}).
 In this implementation, \co{rcu_read_lock()} acquires a global
 spinlock, \co{rcu_read_unlock()} releases it, and
 \co{synchronize_rcu()} acquires it then immediately releases it.
-- 
2.17.1


