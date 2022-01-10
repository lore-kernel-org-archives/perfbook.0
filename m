Return-Path: <SRS0=TMph=R2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jmlDT7K2o+phezlrT20zgt6wYzzJiRVnDFRB6rAU068=;
        b=FEHfHEl++jiFW51j+uIBg7LXbyfQE8OlTzCuEW5mZkkkAL2/p6+lW2jaMI/I7Z9yKq
         w8kWP8kaHHANYo99/1I8h8ek0AIW50iBGZZNMe1u6LgT1YyT+A0XmS2PwhOw3aG8aXFh
         Hel2ajN4/Y4UulMue00oxv1rM/HhtYyHY3lvVtrAZNmsGA+yfT5T+L5exDKAwOGhez1b
         fl6j8ne4RF0JmYnCi5gBLmSRFguL0Mf/xgCL5aa3IARNRbDt+BoGtmmDVxPKx6M/M1Mk
         VsO+JmZO8i2CjlYRov7pPiDPYuCFFGoWgUgw+3MvYsoSSWS49/SiqQ7cH2ai/HyU28XL
         iBwA==
Subject: [PATCH -perfbook 2/5] defer/rcuintro: Add indexing tags for
 'RCU-protected pointer/data'
References: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <657b7c86-8bd9-bff1-3461-8b0f54f528ec@gmail.com>
Date: Mon, 10 Jan 2022 20:18:23 +0900
MIME-Version: 1.0
In-Reply-To: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Note that \IXr{} works as expected in the main text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index dc464742..069ccfd7 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -202,7 +202,7 @@ pair can be enclosed within another.
 In this case, the nested set of RCU read-side critical sections act as
 one large critical section covering the full extent of the nested set.
 The third read-side API member, \apik{rcu_dereference()}, fetches an
-RCU-protected pointer.
+\IXr{RCU-protected pointer}.
 Conceptually, \co{rcu_dereference()} simply loads from memory, but we
 will see in
 \cref{sec:defer:Publish-Subscribe Mechanism}
@@ -213,7 +213,7 @@ that dereference this pointer.
 \QuickQuiz{
 	What is an RCU-protected pointer?
 }\QuickQuizAnswer{
-	A pointer to RCU-protected data.
+	A pointer to \IXr{RCU-protected data}.
 	RCU-protected data is in turn a block of dynamically allocated
 	memory whose freeing will be deferred such that an RCU grace
 	period will elapse between the time that there were no longer
-- 
2.17.1


