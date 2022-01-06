Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IFOBm46cgGBpW9Z+UXAwaPfYYKAVMmL3lqYJm30I1kw=;
        b=Ee7zAYFMa9OFmw6kfcJP+LDGrMyroYUhonq4Qnx2r9vC4Bfy+O3FQZehIFwZca71yi
         2EebprRAf00dW9ykJVu32G8IoPhBgfIp/aRzQ+BMEQm/SN32CiI2GQCKIpm2UyC8HRE0
         u54MCBAq9I9k5/7MowLHjYWsFgA9ggEji5EYWspWxILmZXjuFQmtbvH9eaLP8S2Tt7P/
         7MXQhtgcv9Oq3vs7KipKz4vjhmWIbc1HSkji8ppnyzvE4iavp4z0J4tnR7mGhn5nDS5h
         OX35+faBZ1qhnCpGWSGuA3z6g734YIpcheFhOFxhvciExKHB31Ae9ofkuyP+0K6VCKvR
         l3ow==
Subject: [PATCH RESEND -perfbook 03/10] index: Add tags for 'type-safe memory'
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f883e06c-1aa1-46ef-45a4-beed66010945@gmail.com>
Date: Thu, 6 Jan 2022 16:36:19 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

"Type-safety guarantee" is indexed by this tag as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex    | 2 +-
 defer/rcuusage.tex  | 2 +-
 together/refcnt.tex | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index ee939341..c152251b 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -242,7 +242,7 @@ The \co{rcu_barrier()} primitive does this job.
 }
 
 Finally, RCU may be used to provide
-type-safe memory~\cite{Cheriton96a}, as described in
+\IX{type-safe memory}~\cite{Cheriton96a}, as described in
 \cref{sec:defer:Type-Safe Memory}.
 In the context of RCU, type-safe memory guarantees that a given
 data element will not change type during any RCU read-side critical section
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index f69201bb..a3a17f61 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -586,7 +586,7 @@ same type.
 In other words, these lockless algorithms can tolerate a given data
 element being freed and reallocated as the same type of structure
 while they are referencing it, but must prohibit a change in type.
-This guarantee, called ``type-safe memory'' in
+This guarantee, called ``\IX{type-safe memory}'' in
 academic literature~\cite{Cheriton96a},
 is weaker than the \IXpl{existence guarantee} discussed
 in \cref{sec:defer:Existence Guarantee},
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 56c6baa9..1963ddd2 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -38,7 +38,8 @@ use in concurrent software, including:
 	garbage collectors, and, as is seen in
 	\cref{sec:defer:Hazard Pointers,sec:defer:Read-Copy Update (RCU)},
 	by hazard pointers and RCU, respectively.
-\item	A type-safety guarantee is provided for the object.
+\item	A \IXalt{type-safety guarantee}{type-safe memory}
+	is provided for the object.
 	An additional identity check must be performed once
 	the reference is acquired.
 	Type-safety guarantees can be provided by special-purpose
-- 
2.17.1


