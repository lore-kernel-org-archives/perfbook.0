Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36504 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbeLCPfS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 3 Dec 2018 10:35:18 -0500
Received: by mail-pg1-f193.google.com with SMTP id n2so5878617pgm.3
        for <perfbook@vger.kernel.org>; Mon, 03 Dec 2018 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W84Rpu1RxEL1DgGkUN2Qya/z2lMb902cJAPYOimmsaA=;
        b=FEQLZOjvhQ1Pq9/Ub2cztMfmV2GQFVdAOSt3yAbszPLDD+Cragu1tymZ2kedjIcgwr
         JBKOTajy6a2Eon3RPhtGz4hb5SsB6nQg/yKIEpXrEELo27qUklFW5Aal8WeU8X0IpWpF
         YTKzEel1gvnXCiQTEeb69MBQfJXDS5HY+e9G6m9cHoe+hygeafJmjCUD3I7F3HLEXD/X
         Gxgb7josMkr+7dAn28ORw6aWFXz6yNW7rx73qEFbU6ClEam9sdMbvZ88KYmW7mdgJNfT
         Zrhjs9Ixd9UURG6xwz+bG+mjJgvZ8FeRstDRYULbcJCc53d0aokWCoVjmem9FN4LqnXg
         bO8w==
Subject: [PATCH 1/6] defer: Employ new scheme for 'lst:defer:Hazard-Pointer
 Storage and Erasure'
References: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2fa76576-7ec1-0718-3fb2-5b04cf87c803@gmail.com>
Date: Tue, 4 Dec 2018 00:35:09 +0900
MIME-Version: 1.0
In-Reply-To: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From a526b98e4fe052223c82dbd3cf961d40bc27f294 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 00:13:47 +0900
Subject: [PATCH 1/6] defer: Employ new scheme for 'lst:defer:Hazard-Pointer Storage and Erasure'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/hazptr.tex | 58 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 1aca813..588f603 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -22,33 +22,30 @@ and there are no longer any hazard pointers referencing it, that element
 may safely be freed.
 
 \begin{listing}[btp]
-{ \scriptsize
-\begin{verbbox}
- 1 int hp_store(void **p, void **hp)
- 2 {
- 3   void *tmp;
- 4 
- 5   tmp = READ_ONCE(*p);
- 6   WRITE_ONCE(*hp, tmp);
- 7   smp_mb();
- 8   if (tmp != READ_ONCE(*p) ||
- 9       tmp == HAZPTR_POISON) {
-10     WRITE_ONCE(*hp, NULL);
-11     return 0;
-12   }
-13   return 1;
-14 }
-15 
-16 void hp_erase(void **hp)
-17 {
-18   smp_mb();
-19   WRITE_ONCE(*hp, NULL);
-20   hp_free(hp);
-21 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:defer:Hazard-Pointer Storage and Erasure]
+\begin{VerbatimL}[commandchars=\\\[\]]
+int hp_store(void **p, void **hp)	\lnlbl[store:b]
+{
+	void *tmp;
+
+	tmp = READ_ONCE(*p);
+	WRITE_ONCE(*hp, tmp);
+	smp_mb();
+	if (tmp != READ_ONCE(*p) || tmp == HAZPTR_POISON) {
+		WRITE_ONCE(*hp, NULL);
+		return 0;
+	}
+	return 1;
+}					\lnlbl[store:e]
+
+void hp_erase(void **hp)		\lnlbl[erase:b]
+{
+	smp_mb();
+	WRITE_ONCE(*hp, NULL);
+	hp_free(hp);
+}					\lnlbl[erase:e]
+\end{VerbatimL}
+\end{linelabel}
 \caption{Hazard-Pointer Storage and Erasure}
 \label{lst:defer:Hazard-Pointer Storage and Erasure}
 \end{listing}
@@ -56,13 +53,16 @@ may safely be freed.
 Of course, this means that hazard-pointer acquisition must be carried
 out quite carefully in order to avoid destructive races with concurrent
 deletion.
+\begin{lineref}[ln:defer:Hazard-Pointer Storage and Erasure]
 One implementation is shown in
 Listing~\ref{lst:defer:Hazard-Pointer Storage and Erasure},
-which shows \co{hp_store()} on lines~1-14 and \co{hp_erase()} on
-lines~16-21.
+which shows \co{hp_store()} on
+lines~\lnref{store:b}-\lnref{store:e} and \co{hp_erase()} on
+lines~\lnref{erase:b}-\lnref{erase:e}.
 The \co{smp_mb()} primitive will be described in detail in
 Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}, but may be ignored for
 the purposes of this brief overview.
+\end{lineref}
 
 The \co{hp_store()} function records a hazard pointer at \co{hp} for the data
 element whose pointer is referenced by \co{p}, while checking for
-- 
2.7.4


