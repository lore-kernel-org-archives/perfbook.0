Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962DF22EF0
	for <perfbook@vger.kernel.org>; Sun,  4 Feb 2024 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065113; cv=none; b=SrSIQ/8rdWcndRvskMek1Qy5Wjow3Oh3+feR/w+kYpBb/Dj/8xWaswKeBLYxmnZ3GV31GWuz5w4hRYSQU9LXc9mJrII4sDqv9z0JW3esu1A00nJYN/PRnslC036b2d0BhXHb1YBEcnitRPGFMQ7XHCH/gxcVb8ez9tZvJiegmGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065113; c=relaxed/simple;
	bh=FysINKTEvptjvV+1z0ellqwblUu61sZsg10aXeeYrBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=nHxVd09YrPPhVcT4lLNsJKjPfgrXAVzBwW0CT4qX+pLfoN3yxf85HK8SD7vNtSLJdfdGGJIfWuhUKfikxc45AiI1yi+YoX5lRheaqe3pDuEsk6m8RU8XeE0PVkG+ClLOC86rINnCzud52TqReZ0EJOHF7nem8+BAhABc2KnyXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4HwL+Tr; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4HwL+Tr"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e12d0af927so2669041a34.0
        for <perfbook@vger.kernel.org>; Sun, 04 Feb 2024 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707065110; x=1707669910; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CfHYLNYD5MgcgZE30HKF8DTNzHyv592WrLCrhGkFS0g=;
        b=F4HwL+TrmeXQbRnUkrg8SayrmmlR5+c6jZSGIoTNygGG6HWvtvrT14dHc9QDfiEfrS
         4PoaZxTlGIdcGRcRmOJ7OB9ui2HqThR92p2RahSGPjNRix0cJqNlcsBjXLEeGjyYNLOh
         OLAdc7qzU0+hCBy+XxeJMPOD5aseCKXblO4rdnpcd5oYcHjvyWrsDOcvACVcZkMATuzA
         IxkxNo0bwBgSWxi5Ouu4RTpKiIrH2Q2P7a++ivqz5wqeMDKmRqaGmCzPc0bSMK6PUgU8
         XT7p7qa7JNnPGEJEgY37DIFetrt2wCU/fXecgHok3AMRH/LBELeFz4UTrG2t66Y4C6RN
         Nq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707065110; x=1707669910;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfHYLNYD5MgcgZE30HKF8DTNzHyv592WrLCrhGkFS0g=;
        b=Mtu0bG1n2D7KTcGbW4fWhFNVBJhT5qJa+X4obyrU+e9JuL4L8XX/8cb6P2G2b1uhLC
         pMygBvg+cvkRaRESw4vjDejYYK/qF3IG1XTjvamKjvhMb+sAmjYf0mwn7iVNbLJIL0eZ
         1hOYxCjZImG5oLrbM8ABa3B0io74bX2MCoNfDOCKcswxViFl+xGrOinx2o9spjCZ7/yS
         W4LKK6cV9Wzuf4C/NPh5jqmsTB9TQ+PIsI64WmcTyDiEdP5g0KZPwEwbzZvLZpvmoy2X
         Hb7e0oV/5E9IWWChjtBi9XX2SaB9nmJhzyM1ELWslYNtUkEh+tFT0q6Yz+zk8yyFyVdE
         OrQQ==
X-Gm-Message-State: AOJu0Yz1YCf7Ig5xX+CS1wX9dvq4TyBU0F97MzxjoGaaXmaD6T1Wfkbw
	chnFdOsF6BTmGdIrf2w3b+RdaQIKardQN/39faU4J6r1gag1noQI
X-Google-Smtp-Source: AGHT+IHJTV8JwjXzI2z3fEX58StgrYg4+7DfFOChmFgmpDggV86G1RVuv49Aoi+unnrEroBtgJ9g3w==
X-Received: by 2002:a9d:7758:0:b0:6dd:efff:d7db with SMTP id t24-20020a9d7758000000b006ddefffd7dbmr15704124otl.20.1707065110158;
        Sun, 04 Feb 2024 08:45:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWsUxMZOU9q9tckcG63C3cVZ8SjZsv/rUGaWxdxCisrbf2AiKQNq1tDwJ5XUeRFMRJ9L0vQKGK0YhMjjPQh56trVhLhv1i1Mnc=
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id y2-20020a63fa02000000b005d880b41598sm5350014pgh.94.2024.02.04.08.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 08:45:09 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 1/4] appendix/whymb: Use \qco{} for quoted code
Date: Sun,  4 Feb 2024 08:44:59 -0800
Message-Id: <20240204164502.15124-2-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204164502.15124-1-sj38.park@gmail.com>
References: <20240204164502.15124-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

Some sentences in whymemorybarriers.tex are using native quotes for
quoted code.  Use \qco{} instead.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 190 +++++++++++++--------------
 1 file changed, 95 insertions(+), 95 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 68ff37af..1ca93f18 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -737,9 +737,9 @@ be addressed, which are covered in the next two sections.
 \label{sec:app:whymb:Store Forwarding}
 
 To see the first complication, a violation of self-consistency,
-consider the following code with variables ``a'' and ``b'' both initially
-zero, and with the cache line containing variable ``a'' initially
-owned by CPU~1 and that containing ``b'' initially owned by CPU~0:
+consider the following code with variables \qco{a} and \qco{b} both initially
+zero, and with the cache line containing variable \qco{a} initially
+owned by CPU~1 and that containing \qco{b} initially owned by CPU~0:
 
 \begin{VerbatimN}[fontsize=\footnotesize,samepage=true]
 a = 1;
@@ -755,28 +755,28 @@ one would be surprised.
 Such a system could potentially see the following sequence of events:
 \begin{sequence}
 \item	CPU~0 starts executing the \co{a = 1}.
-\item	CPU~0 looks ``a'' up in the cache, and finds that it is missing.
+\item	CPU~0 looks \qco{a} up in the cache, and finds that it is missing.
 \item	CPU~0 therefore sends a ``read invalidate'' message in order to
-	get exclusive ownership of the cache line containing ``a''.
-\item	CPU~0 records the store to ``a'' in its store buffer.
+	get exclusive ownership of the cache line containing \qco{a}.
+\item	CPU~0 records the store to \qco{a} in its store buffer.
 \item	CPU~1 receives the ``read invalidate'' message, and responds
 	by transmitting the cache line and removing that cacheline from
 	its cache.
 \item	CPU~0 starts executing the \co{b = a + 1}.
 \item	CPU~0 receives the cache line from CPU~1, which still has
-	a value of zero for ``a''.
-\item	CPU~0 loads ``a'' from its cache, finding the value zero.
+	a value of zero for \qco{a}.
+\item	CPU~0 loads \qco{a} from its cache, finding the value zero.
 	\label{item:app:whymb:Need Store Buffer}
 \item	CPU~0 applies the entry from its store buffer to the newly
-	arrived cache line, setting the value of ``a'' in its cache
+	arrived cache line, setting the value of \qco{a} in its cache
 	to one.
-\item	CPU~0 adds one to the value zero loaded for ``a'' above,
-	and stores it into the cache line containing ``b''
+\item	CPU~0 adds one to the value zero loaded for \qco{a} above,
+	and stores it into the cache line containing \qco{b}
 	(which we will assume is already owned by CPU~0).
 \item	CPU~0 executes \co{assert(b == 2)}, which fails.
 \end{sequence}
 
-The problem is that we have two copies of ``a'', one in the cache and
+The problem is that we have two copies of \qco{a}, one in the cache and
 the other in the store buffer.
 
 This example breaks a very important guarantee, namely that each CPU
@@ -798,8 +798,8 @@ subsequent loads, without having to pass through the cache.
 \end{figure}
 
 With store forwarding in place, item~\ref{item:app:whymb:Need Store Buffer}
-in the above sequence would have found the correct value of 1 for ``a'' in
-the store buffer, so that the final value of ``b'' would have been 2,
+in the above sequence would have found the correct value of 1 for \qco{a} in
+the store buffer, so that the final value of \qco{b} would have been 2,
 as one would hope.
 
 \subsection{Store Buffers and Memory Barriers}
@@ -807,7 +807,7 @@ as one would hope.
 
 To see the second complication, a violation of global memory ordering,
 consider the following code sequences
-with variables ``a'' and ``b'' initially zero:
+with variables \qco{a} and \qco{b} initially zero:
 
 \begin{VerbatimN}[fontsize=\footnotesize,samepage=true]
 void foo(void)
@@ -824,40 +824,40 @@ void bar(void)
 \end{VerbatimN}
 
 Suppose CPU~0 executes foo() and CPU~1 executes bar().
-Suppose further that the cache line containing ``a'' resides only in CPU~1's
-cache, and that the cache line containing ``b'' is owned by CPU~0.
+Suppose further that the cache line containing \qco{a} resides only in CPU~1's
+cache, and that the cache line containing \qco{b} is owned by CPU~0.
 Then the sequence of operations might be as follows:
 \begin{sequence}
 \item	CPU~0 executes \co{a = 1}.
 	The cache line is not in CPU~0's cache, so CPU~0 places the new
-	value of ``a'' in its store buffer and transmits a ``read
+	value of \qco{a} in its store buffer and transmits a ``read
 	invalidate'' message.
 	\label{seq:app:whymb:Store Buffers and Memory Barriers}
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
-	containing ``b'' is not in its cache.
+	containing \qco{b} is not in its cache.
 	It therefore transmits a ``read'' message.
 \item	CPU~0 executes \co{b = 1}.
 	It already owns this cache line (in other words, the cache line
 	is already in either the ``modified'' or the ``exclusive'' state),
-	so it stores the new value of ``b'' in its cache line.
+	so it stores the new value of \qco{b} in its cache line.
 \item	CPU~0 receives the ``read'' message, and transmits the
-	cache line containing the now-updated value of ``b''
+	cache line containing the now-updated value of \qco{b}
 	to CPU~1, also marking the line as ``shared'' in its own cache
-	(but only after writing back the line containing ``b'' to main
+	(but only after writing back the line containing \qco{b} to main
 	memory).
 	\label{seq:app:whymb:Store Buffers and Memory Barriers store}
-\item	CPU~1 receives the cache line containing ``b'' and installs
+\item	CPU~1 receives the cache line containing \qco{b} and installs
 	it in its cache.
 \item	CPU~1 can now finish executing \co{while (b == 0) continue},
-	and since it finds that the value of ``b'' is 1, it proceeds
+	and since it finds that the value of \qco{b} is 1, it proceeds
 	to the next statement.
 \item	CPU~1 executes the \co{assert(a == 1)}, and, since CPU~1 is
-	working with the old value of ``a'', this assertion fails.
+	working with the old value of \qco{a}, this assertion fails.
 \item	CPU~1 receives the ``read invalidate'' message, and
-	transmits the cache line containing ``a'' to CPU~0 and
+	transmits the cache line containing \qco{a} to CPU~0 and
 	invalidates this cache line from its own cache.
 	But it is too late.
-\item	CPU~0 receives the cache line containing ``a'' and applies
+\item	CPU~0 receives the cache line containing \qco{a} and applies
 	the buffered store just in time to fall victim to CPU~1's
 	failed assertion.
 	\label{seq:app:whymb:Store Buffers and Memory Barriers victim}
@@ -929,10 +929,10 @@ With this latter approach the sequence of operations might be as follows:
 \begin{sequence}
 \item	CPU~0 executes \co{a = 1}.
 	The cache line is not in CPU~0's cache, so CPU~0 places the new
-	value of ``a'' in its store buffer and transmits a ``read
+	value of \qco{a} in its store buffer and transmits a ``read
 	invalidate'' message.
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
-	containing ``b'' is not in its cache.
+	containing \qco{b} is not in its cache.
 	It therefore transmits a ``read'' message.
 \item	CPU~0 executes \co{smp_mb()}, and marks all current store-buffer
 	entries (namely, the \co{a = 1}).
@@ -940,55 +940,55 @@ With this latter approach the sequence of operations might be as follows:
 	It already owns this cache line (in other words, the cache line
 	is already in either the ``modified'' or the ``exclusive'' state),
 	but there is a marked entry in the store buffer.
-	Therefore, rather than store the new value of ``b'' in the
+	Therefore, rather than store the new value of \qco{b} in the
 	cache line, it instead places it in the store buffer (but
 	in an \emph{unmarked} entry).
 \item	CPU~0 receives the ``read'' message, and transmits the
-	cache line containing the original value of ``b''
+	cache line containing the original value of \qco{b}
 	to CPU~1.
 	It also marks its own copy of this cache line as ``shared''.
-\item	CPU~1 receives the cache line containing ``b'' and installs
+\item	CPU~1 receives the cache line containing \qco{b} and installs
 	it in its cache.
-\item	CPU~1 can now load the value of ``b'',
-	but since it finds that the value of ``b'' is still 0, it repeats
+\item	CPU~1 can now load the value of \qco{b},
+	but since it finds that the value of \qco{b} is still 0, it repeats
 	the \co{while} statement.
-	The new value of ``b'' is safely hidden in CPU~0's store buffer.
+	The new value of \qco{b} is safely hidden in CPU~0's store buffer.
 \item	CPU~1 receives the ``read invalidate'' message, and
-	transmits the cache line containing ``a'' to CPU~0 and
+	transmits the cache line containing \qco{a} to CPU~0 and
 	invalidates this cache line from its own cache.
-\item	CPU~0 receives the cache line containing ``a'' and applies
+\item	CPU~0 receives the cache line containing \qco{a} and applies
 	the buffered store, placing this line into the ``modified''
 	state.
-\item	Since the store to ``a'' was the only
+\item	Since the store to \qco{a} was the only
 	entry in the store buffer that was marked by the \co{smp_mb()},
-	CPU~0 can also store the new value of ``b''---except for the
-	fact that the cache line containing ``b'' is now in ``shared''
+	CPU~0 can also store the new value of \qco{b}---except for the
+	fact that the cache line containing \qco{b} is now in ``shared''
 	state.
 \item	CPU~0 therefore sends an ``invalidate'' message to CPU~1.
 \item	CPU~1 receives the ``invalidate'' message, invalidates the
-	cache line containing ``b'' from its cache, and sends an
+	cache line containing \qco{b} from its cache, and sends an
 	``acknowledgement'' message to CPU~0.
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
-	containing ``b'' is not in its cache.
+	containing \qco{b} is not in its cache.
 	It therefore transmits a ``read'' message to CPU~0.
 \item	CPU~0 receives the ``acknowledgement'' message, and puts
-	the cache line containing ``b'' into the ``exclusive'' state.
-	CPU~0 now stores the new value of ``b'' into the cache line.
+	the cache line containing \qco{b} into the ``exclusive'' state.
+	CPU~0 now stores the new value of \qco{b} into the cache line.
 \item	CPU~0 receives the ``read'' message, and transmits the
-	cache line containing the new value of ``b''
+	cache line containing the new value of \qco{b}
 	to CPU~1.
 	It also marks its own copy of this cache line as ``shared''.%
 	\label{seq:app:whymb:Store buffers: All copies shared}
-\item	CPU~1 receives the cache line containing ``b'' and installs
+\item	CPU~1 receives the cache line containing \qco{b} and installs
 	it in its cache.
-\item	CPU~1 can now load the value of ``b'',
-	and since it finds that the value of ``b'' is 1, it
+\item	CPU~1 can now load the value of \qco{b},
+	and since it finds that the value of \qco{b} is 1, it
 	exits the \co{while} loop and proceeds
 	to the next statement.
 \item	CPU~1 executes the \co{assert(a == 1)}, but the cache line containing
-	``a'' is no longer in its cache.
+	\qco{a} is no longer in its cache.
 	Once it gets this cache from CPU~0, it will be
-	working with the up-to-date value of ``a'', and the assertion
+	working with the up-to-date value of \qco{a}, and the assertion
 	therefore passes.
 \end{sequence}
 
@@ -997,7 +997,7 @@ With this latter approach the sequence of operations might be as follows:
 	in \cref{sec:app:whymb:Store Buffers and Memory Barriers} on
 	\cpageref{seq:app:whymb:Store buffers: All copies shared},
 	both CPUs might drop the cache line containing the new value of
-	``b''.
+	\qco{b}.
 	Wouldn't that cause this new value to be lost?
 }\QuickQuizAnswer{
 	It might, and that is why real hardware takes steps to avoid
@@ -1093,9 +1093,9 @@ This approach minimizes the \IXh{cache-invalidation}{latency} seen by CPUs
 doing stores, but can defeat memory barriers, as seen in the following
 example.
 
-Suppose the values of ``a'' and ``b'' are initially zero,
-that ``a'' is replicated read-only (MESI ``shared'' state),
-and that ``b''
+Suppose the values of \qco{a} and \qco{b} are initially zero,
+that \qco{a} is replicated read-only (MESI ``shared'' state),
+and that \qco{b}
 is owned by CPU~0 (MESI ``exclusive'' or ``modified'' state).
 Then suppose that CPU~0 executes \co{foo()} while CPU~1 executes
 function \co{bar()} in the following code fragment:
@@ -1122,36 +1122,36 @@ Then the sequence of operations might be as follows:
 \begin{sequence}
 \item	CPU~0 executes \co{a = 1}.
 	The corresponding cache line is read-only in CPU~0's cache, so
-	CPU~0 places the new value of ``a'' in its store buffer and
+	CPU~0 places the new value of \qco{a} in its store buffer and
 	transmits an ``invalidate'' message in order to flush the
 	corresponding cache line from CPU~1's cache.
 	\label{seq:app:whymb:Invalidate Queues and Memory Barriers}
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
-	containing ``b'' is not in its cache.
+	containing \qco{b} is not in its cache.
 	It therefore transmits a ``read'' message.
 \item	CPU~1 receives CPU~0's ``invalidate'' message, queues it, and
 	immediately responds to it.
 \item	CPU~0 receives the response from CPU~1, and is therefore free
 	to proceed past the \co{smp_mb()} on \clnref{mb} above, moving
-	the value of ``a'' from its store buffer to its cache line.
+	the value of \qco{a} from its store buffer to its cache line.
 \item	CPU~0 executes \co{b = 1}.
 	It already owns this cache line (in other words, the cache line
 	is already in either the ``modified'' or the ``exclusive'' state),
-	so it stores the new value of ``b'' in its cache line.
+	so it stores the new value of \qco{b} in its cache line.
 \item	CPU~0 receives the ``read'' message, and transmits the
-	cache line containing the now-updated value of ``b''
+	cache line containing the now-updated value of \qco{b}
 	to CPU~1, also marking the line as ``shared'' in its own cache.
-\item	CPU~1 receives the cache line containing ``b'' and installs
+\item	CPU~1 receives the cache line containing \qco{b} and installs
 	it in its cache.
 \item	CPU~1 can now finish executing \co{while (b == 0) continue},
-	and since it finds that the value of ``b'' is 1, it proceeds
+	and since it finds that the value of \qco{b} is 1, it proceeds
 	to the next statement.
 \item	CPU~1 executes the \co{assert(a == 1)}, and, since the
-	old value of ``a'' is still in CPU~1's cache,
+	old value of \qco{a} is still in CPU~1's cache,
 	this assertion fails.
 \item	Despite the assertion failure, CPU~1 processes the queued
 	``invalidate'' message, and (tardily)
-	invalidates the cache line containing ``a'' from its own cache.
+	invalidates the cache line containing \qco{a} from its own cache.
 \end{sequence}
 \end{fcvref}
 
@@ -1162,10 +1162,10 @@ Then the sequence of operations might be as follows:
 	why is an ``invalidate'' sent instead of a ''read invalidate''
 	message?
 	Doesn't CPU~0 need the values of the other variables that share
-	this cache line with ``a''?
+	this cache line with \qco{a}?
 }\QuickQuizAnswer{
 	CPU~0 already has the values of these variables, given that it
-	has a read-only copy of the cache line containing ``a''.
+	has a read-only copy of the cache line containing \qco{a}.
 	Therefore, all CPU~0 need do is to cause the other CPUs to discard
 	their copies of this cache line.
 	An ``invalidate'' message therefore suffices.
@@ -1263,41 +1263,41 @@ With this change, the sequence of operations might be as follows:
 \begin{sequence}
 \item	CPU~0 executes \co{a = 1}.
 	The corresponding cache line is read-only in CPU~0's cache,
-	so CPU~0 places the new value of ``a'' in its store buffer and
+	so CPU~0 places the new value of \qco{a} in its store buffer and
 	transmits an ``invalidate'' message in order to flush the
 	corresponding cache line from CPU~1's cache.
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
-	containing ``b'' is not in its cache.
+	containing \qco{b} is not in its cache.
 	It therefore transmits a ``read'' message.
 \item	CPU~1 receives CPU~0's ``invalidate'' message, queues it, and
 	immediately responds to it.
 \item	CPU~0 receives the response from CPU~1, and is therefore free
 	to proceed past the \co{smp_mb()} on \clnref{mb1} above, moving
-	the value of ``a'' from its store buffer to its cache line.
+	the value of \qco{a} from its store buffer to its cache line.
 \item	CPU~0 executes \co{b = 1}.
 	It already owns this cache line (in other words, the cache line
 	is already in either the ``modified'' or the ``exclusive'' state),
-	so it stores the new value of ``b'' in its cache line.
+	so it stores the new value of \qco{b} in its cache line.
 \item	CPU~0 receives the ``read'' message, and transmits the
-	cache line containing the now-updated value of ``b''
+	cache line containing the now-updated value of \qco{b}
 	to CPU~1, also marking the line as ``shared'' in its own cache.
-\item	CPU~1 receives the cache line containing ``b'' and installs
+\item	CPU~1 receives the cache line containing \qco{b} and installs
 	it in its cache.
 \item	CPU~1 can now finish executing \co{while (b == 0) continue},
-	and since it finds that the value of ``b'' is 1, it proceeds
+	and since it finds that the value of \qco{b} is 1, it proceeds
 	to the next statement, which is now a memory barrier.
 \item	CPU~1 must now stall until it processes all pre-existing
 	messages in its invalidation queue.
 \item	CPU~1 now processes the queued
 	``invalidate'' message, and
-	invalidates the cache line containing ``a'' from its own cache.
+	invalidates the cache line containing \qco{a} from its own cache.
 \item	CPU~1 executes the \co{assert(a == 1)}, and, since the
-	cache line containing ``a'' is no longer in CPU~1's cache,
+	cache line containing \qco{a} is no longer in CPU~1's cache,
 	it transmits a ``read'' message.
 \item	CPU~0 responds to this ``read'' message with the cache line
-	containing the new value of ``a''.
+	containing the new value of \qco{a}.
 \item	CPU~1 receives this cache line, which contains a value of 1 for
-	``a'', so that the assertion does not trigger.
+	\qco{a}, so that the assertion does not trigger.
 \end{sequence}
 \end{fcvref}
 
@@ -1496,7 +1496,7 @@ as we will see.\footnote{
 
 \Cref{lst:app:whymb:Memory Barrier Example 1}
 shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
-Each of ``a'', ``b'', and ``c'' are initially zero.
+Each of \qco{a}, \qco{b}, and \qco{c} are initially zero.
 
 \floatstyle{plaintop}
 \restylefloat{listing}
@@ -1524,13 +1524,13 @@ Each of ``a'', ``b'', and ``c'' are initially zero.
 Suppose CPU~0 recently experienced many cache misses, so that its
 message queue is full, but that CPU~1 has been running exclusively within
 the cache, so that its message queue is empty.
-Then CPU~0's assignment to ``a'' and ``b'' will appear in Node~0's cache
+Then CPU~0's assignment to \qco{a} and \qco{b} will appear in Node~0's cache
 immediately (and thus be visible to CPU~1), but will be blocked behind
 CPU~0's prior traffic.
-In contrast, CPU~1's assignment to ``c'' will sail through CPU~1's
+In contrast, CPU~1's assignment to \qco{c} will sail through CPU~1's
 previously empty queue.
-Therefore, CPU~2 might well see CPU~1's assignment to ``c'' before
-it sees CPU~0's assignment to ``a'', causing the assertion to fire,
+Therefore, CPU~2 might well see CPU~1's assignment to \qco{c} before
+it sees CPU~0's assignment to \qco{a}, causing the assertion to fire,
 despite the memory barriers.
 
 Therefore, portable code cannot rely on this assertion not firing,
@@ -1539,7 +1539,7 @@ the assertion.
 
 \QuickQuiz{
 	Could this code be fixed by inserting a memory barrier
-	between CPU~1's ``while'' and assignment to ``c''?
+	between CPU~1's \qco{while} and assignment to \qco{c}?
 	Why or why not?
 }\QuickQuizAnswer{
 	No.
@@ -1560,7 +1560,7 @@ the assertion.
 
 \Cref{lst:app:whymb:Memory Barrier Example 2}
 shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
-Both ``a'' and ``b'' are initially zero.
+Both \qco{a} and \qco{b} are initially zero.
 
 \begin{listing}
 \scriptsize
@@ -1584,13 +1584,13 @@ Both ``a'' and ``b'' are initially zero.
 Again, suppose CPU~0 recently experienced many cache misses, so that its
 message queue is full, but that CPU~1 has been running exclusively within
 the cache, so that its message queue is empty.
-Then CPU~0's assignment to ``a'' will appear in Node~0's cache
+Then CPU~0's assignment to \qco{a} will appear in Node~0's cache
 immediately (and thus be visible to CPU~1), but will be blocked behind
 CPU~0's prior traffic.
-In contrast, CPU~1's assignment to ``b'' will sail through CPU~1's
+In contrast, CPU~1's assignment to \qco{b} will sail through CPU~1's
 previously empty queue.
-Therefore, CPU~2 might well see CPU~1's assignment to ``b'' before
-it sees CPU~0's assignment to ``a'', causing the assertion to fire,
+Therefore, CPU~2 might well see CPU~1's assignment to \qco{b} before
+it sees CPU~0's assignment to \qco{a}, causing the assertion to fire,
 despite the memory barriers.
 
 In theory, portable code should not rely on this example code fragment,
@@ -1631,13 +1631,13 @@ All variables are initially zero.
 \restylefloat{listing}
 
 Note that neither CPU~1 nor CPU~2 can proceed to line~5 until they see
-CPU~0's assignment to ``b'' on line~3.
+CPU~0's assignment to \qco{b} on line~3.
 Once CPU~1 and~2 have executed their memory barriers on line~4, they
 are both guaranteed to see all assignments by CPU~0 preceding its memory
 barrier on line~2.
 Similarly, CPU~0's memory barrier on line~8 pairs with those of CPUs~1 and~2
-on line~4, so that CPU~0 will not execute the assignment to ``e'' on
-line~9 until after its assignment to ``b'' is visible to both of the
+on line~4, so that CPU~0 will not execute the assignment to \qco{e} on
+line~9 until after its assignment to \qco{b} is visible to both of the
 other CPUs.
 Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.
 
@@ -1656,7 +1656,7 @@ Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.
 	correctly, in other words, to prevent the assertion from firing?
 }\QuickQuizAnswerB{
 	The assertion must ensure that the load of
-	``e'' precedes that of ``a''.
+	\qco{e} precedes that of \qco{a}.
 	In the Linux kernel, the \co{barrier()} primitive may be used to
 	accomplish this in much the same way that the memory barrier was
 	used in the assertions in the previous examples.
@@ -1679,10 +1679,10 @@ assert(r1 == 0 || a == 1);
 	would this assert ever trigger?
 }\QuickQuizAnswerE{
 	The result depends on whether the CPU supports ``transitivity''.
-	In other words, CPU~0 stored to ``e'' after seeing CPU~1's
-	store to ``c'', with a memory barrier between CPU~0's load
-	from ``c'' and store to ``e''.
-	If some other CPU sees CPU~0's store to ``e'', is it also
+	In other words, CPU~0 stored to \qco{e} after seeing CPU~1's
+	store to \qco{c}, with a memory barrier between CPU~0's load
+	from \qco{c} and store to \qco{e}.
+	If some other CPU sees CPU~0's store to \qco{e}, is it also
 	guaranteed to see CPU~1's store?
 
 	All CPUs I am aware of claim to provide transitivity.
-- 
2.17.1

