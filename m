Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0D2B9A8
	for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745229538; cv=none; b=KLaXv7hSRqC7Fkd9g2NTfdyRKXiXPI+deZQabAl9Hktl3z/3U8j47oA7+ki627oV1I8u8DXhk45BFnFqp0QMoLb6QatfiBtebauqVU1gMPa8XgCMeOhRjVJpCjTSUGtiMde9QPSUIMXCumjqcu987PUOF7XSFxjptC8KelMQcdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745229538; c=relaxed/simple;
	bh=X8kWJbPfiOCq9TCu8hH4Ol1RRnGOlTxBqDZObMxrA5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odw5uzn51Mza9iLXPjDpwpLkTGWYHwXrTvt+fE0rYC6YwxUjckrssP98JJAiXgVjkBsfEh+z6QO9oUyl+r1Gw0Ui8GfMUuMhGD03FKc0V2k/Mn+alr4ODmTTNJcCENslzq2ysL+FJ1cnhsQ/9l6ieKyA0lJ1JRTHXvTJjEtQHbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNoTVwO5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNoTVwO5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22409077c06so51955995ad.1
        for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745229536; x=1745834336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8f2pofaLC/L8TCjiUpWVwXUXkvXXfZTHu4a3m7dKCY=;
        b=GNoTVwO5/gi2Q8a+Jq6P64+f4O1ECSwDV/FYoYGG/mnHYNaRZwNQIrnQ8NPj7+JQd7
         kykttzdRUT/UVa4+wRcaiwAN3QQZVlsDPCrvPP+VQIPEWLQib4hJlC5e8aViwP6eHAgK
         xWfnSaSOR+ok6aR5a2s0QHIU9jkYSN3qHmVm6Rk/YmmaK2GfpYQUM1/p7/tIz5TJbkVc
         g2doAwYwbh+j+FvYjikCbJHe7FlKcculbO+EJn2IihpPAv+TdRVBCsL7c5KMQ2pFAP9n
         I4+/NgKMKGRtF1KHaYkxNz3Y8n2BNlz3A5Mz7I34zh3o4N8UuCCbJlK2eAHpvKJOHStr
         B8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745229536; x=1745834336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8f2pofaLC/L8TCjiUpWVwXUXkvXXfZTHu4a3m7dKCY=;
        b=SaFPJ/o9g+euwVZxP+AN1842qMQF/p9SumzJcYUDPVki41ZHbQOAqEENv7/PFfOBDF
         FxEO3qX7V3tl/+rWNoEn71If0ZXg468OnA9NBjT+VpWN9ZJCCEzAXT6puWGSmJS0IS7Q
         tGIGysW3wLvlfuUn7N/IdXLjTfrT+kg+xmFTYkhwM64rhZoZxvhTSwUIrMCw09d4H5Ge
         syrtaTANhbukTJnhNqDmD5VcFV5FVVAwQDqr75wErcQs2cjTpHiasJ0YPYSI/mUQpoY9
         DSyKJ5MWCHNG1k4ftaVwNWjJaOuKS/h9qsi1KPxU6vxbR+B8K6kk3NMtnNODCuAu/855
         WVJA==
X-Gm-Message-State: AOJu0YyG+st+iHJgmzi7SZVpE0X9cJkEb1nW8x8UbDMonQ8B0wAyzWqG
	3mqI7tmHevxKrOoQ80HOm095/SNu1WMKIHK1rrxGJ8sq7oy/bhAF
X-Gm-Gg: ASbGncs0vxNq/e+s1xgO6WmzWSxfXfYnwGZHb6eYp12IHJCP6TOTLidjIBLGAQelMH4
	V+JtdJrfARaped8W85sKoPROeU5tYFQS9Rswpz+lRQOH7Vnvyntm38TwXwvlCgeEAGzpt9edBsz
	T7IQUqZJTDjH3+A/4WXVspFkdW83F08tN3lwgmLz7Po6H20OJmiQRTH8nrhWmkOQCJLrMzmVqNf
	CntgoWPR50ZI8Rioqas79u3ji32MtLsHp/42KY7lbAhX15Yyr1U3gusz2g43tbnyP485H7k5VTw
	Z29WOC7btjgz3ul8HPA5XTM4Al/QNgWSU7qvHUmMtbPlM6WITp2yeZ4WOKrMSW0a2S9JDIcLCLU
	Xdt6/yW/2EWk=
X-Google-Smtp-Source: AGHT+IEw//RmcA+yr8Zwobb9CfOFjbeE0CvdelPp4sNTQz02xtbWkLMKjEBuZEchMjmRkMxsTE1UZw==
X-Received: by 2002:a17:903:3ba4:b0:223:5a6e:b16 with SMTP id d9443c01a7336-22c535670c8mr181368645ad.5.1745229536145;
        Mon, 21 Apr 2025 02:58:56 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb491asm61598015ad.116.2025.04.21.02.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 02:58:55 -0700 (PDT)
Message-ID: <c3cf2056-36ca-4a49-b71a-1999071718ae@gmail.com>
Date: Mon, 21 Apr 2025 18:58:54 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 2/5] index: List LKMM under "Memory model"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec0b5744-65b9-4335-be12-6f3ff0e8c31b@gmail.com>
 <2751a064-a9d4-4753-8948-346e12bbe456@paulmck-laptop>
 <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2d36f655-0054-4428-b8d0-b25b06954d09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Given that the Linux kernel memory model (LKMM) is a class of "memory
model", it is better be listed under "Memory model" in Index.

As it is currently impossible to make acronym-related terms go to
second level, remove existing index markers of acronym (meaning
\IXacr --> \acr) and use additional index markers of \IXalthmr.

Given it goes under "Memory model", add a redirection of "Linux kernel
consistency model (LKMM)" to "Memory model, Linux kernel" as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex  |  5 +++--
 indexsee.tex          |  2 ++
 memorder/memorder.tex | 12 ++++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 7d2fb0e7..35e01828 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -142,8 +142,9 @@ Axiomatic approaches may also be applied to higher-level
 languages and also to higher-level synchronization primitives, as
 exemplified by the lock-based litmus test shown in
 \cref{lst:formal:Locking Example} (\path{C-Lock1.litmus}).
-This litmus test can be modeled by
-the \IXacrf{lkmm}~\cite{Alglave:2018:FSC:3173162.3177156,LucMaranget2018lock.cat}.
+This litmus test can be modeled by the
+\IXalthmr{\acrf{lkmm}}{Linux kernel}{memory model}~%
+\cite{Alglave:2018:FSC:3173162.3177156,LucMaranget2018lock.cat}.
 As expected, the \co{herd} tool's output features the string \co{Never},
 correctly indicating that \co{P1()} cannot see \co{x} having a value
 of one.\footnote{
diff --git a/indexsee.tex b/indexsee.tex
index 9f949378..089efd44 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -21,6 +21,7 @@
 \index{Full memory barrier|see{Memory barrier, full}}
 \index{Fully associative cache|see{Cache, fully associative}}
 \index{Grace-period latency|see{Latency, grace-period}}
+\index{Linux kernel memory consistency model (LKMM)|see{Memory model, Linux kernel}}
 \index{Memory latency|see{Latency, memory}}
 \index{Memory-barrier latency|see{Latency, memory-barrier}}
 \index{Memory-barrier overhead|see{Overhead, memory-barrier}}
@@ -40,6 +41,7 @@
 \index{Write miss|see{Cache miss, write}}
 \index{Write-side critical section|see{Critical section, write-side}}
 }{ % effective for single-level index
+\index{Linux kernel memory consistency model (LKMM)|see{Linux kernel memory model}}
 \index{Process consistency|see{Process memory consistency}}
 \index{Sequential consistency|see{Sequential memory consistency}}
 \index{Weak consistency|see{Weak memory consistency}}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ee2dc324..659ff71e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -69,7 +69,8 @@ follows up with more detail on a few representative hardware platforms.
 	The \IXacrf{kcsan}~\cite{MarcoElver2020FearDataRaceDetector1,MarcoElver2020FearDataRaceDetector2},
 	based in part on
 	RacerD~\cite{SamBlackshear2018RacerD}
-	and implementing \IXacr{lkmm}, has also been added to the Linux kernel
+	and implementing \IXalthmr{\acr{lkmm}}{Linux kernel}{memory model},
+	has also been added to the Linux kernel
 	and is now heavily used.
 
 	Finally, there are now better ways of describing the Linux-kernel
@@ -86,7 +87,8 @@ follows up with more detail on a few representative hardware platforms.
 	 {F. W. Nichol}
 
 This section is for people who would like to avoid learning all the
-details of the Linux-kernel memory model (\IXacr{lkmm}), the better
+details of the \IXalthmr{Linux-kernel memory model (\acr{lkmm})}
+{Linux kernel}{memory model}, the better
 to get on with their concurrency lives.
 The good news is that learning a very small fraction of LKMM can get
 you most of its benefits.
@@ -4495,7 +4497,8 @@ For their part, weakly ordered systems might well choose to execute
 the memory-barrier instructions required to guarantee both orderings,
 possibly simplifying code making advanced use of combinations of locked
 and lockless accesses.
-However, as noted earlier, \IXacr{lkmm} chooses not to provide these additional
+However, as noted earlier, \IXalthmr{\acr{lkmm}}{Linux kernel}{memory model}
+chooses not to provide these additional
 orderings, in part to avoid imposing performance penalties on the simpler
 and more prevalent locking use cases.
 Instead, the \co{smp_mb__after_spinlock()} and \co{smp_mb__after_unlock_lock()}
@@ -5746,7 +5749,8 @@ None of these instructions exactly match the semantics of Linux's
 The \co{DMB} and \co{DSB} instructions have a recursive definition
 of accesses ordered before and after the barrier, which has an effect
 similar to that of \Power{}'s cumulativity, both of which are
-stronger than \IXacr{lkmm}'s cumulativity described in
+stronger than \IXalthmr{\acr{lkmm}}{Linux kernel}{memory model}'s
+cumulativity described in
 \cref{sec:memorder:Cumulativity}.
 
 \ARM\ also implements \IXalth{control dependencies}{control}{dependency},
-- 
2.43.0


