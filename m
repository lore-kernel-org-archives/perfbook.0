Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18DA1758B
	for <perfbook@vger.kernel.org>; Tue,  7 Oct 2025 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848667; cv=none; b=RtkY0LowJjN6cNval70c6M4+DBVqr6p3N1QwMx7OlJD5xufTjE9QGKK1YNg/B+wBgtmhKZtkxlyVK77mvIFjzlZHF++EEhxOd6frof5UCcv9/mlyJMG+Mq6bYcf8v7ZelecBH3BOCi02JBXqZViZDaLPJexyTy9QJ7NNpTmU0PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848667; c=relaxed/simple;
	bh=Gk5PksAPFopdJXYA5wJIwZMbrcQk+/oABPZnCarknsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6WfjyDDahyHIwk1gdXouScIhiR1TLtmsySB46A8dtCOXRgidcybrltv26WImUXpAkJTKpv2ItYOoDlvD9cXxMjYxHbvbd/zAr1E1Z4ieCWHFaUrJZJWIFCi6LyJ6au8I/iplYKkbuM4MM70HGy75GOfc5WRBNzYUJkiAzxFB7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbBYuAr8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbBYuAr8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-279e2554c8fso62651235ad.2
        for <perfbook@vger.kernel.org>; Tue, 07 Oct 2025 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848665; x=1760453465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ooDHwpdhrRPdu0uv/8dGzzz0KxOjXK1fuT/K0XYZV/Q=;
        b=BbBYuAr8fAApJU2O6VoQ4L/g5TUE++ArdagQj1BsGZP8kKIdVTLihnkca1UvFpilWE
         6k7TXZbVUTs1Saq6L+Hc83bllbf4lW64FWvubwsBx+JYo7v6QmmmU+hnBhlY7X5EdXhx
         COz3a4OnOj8Og9VK2MA+0VbvL6w15+BiRwNt2OmEgvFAZ+9hTotSw5FzEiUyzHmk9W6Z
         +i/L4tNmae/7gPWiZs3rveD9E6Wg1wCM9PSu5ZjM2OYAkIltqMqoZTjWDoUKQzAfHdWa
         Bk7A64z4Ta1phnJGt+V8F0mp99pc7OSgxQeJxPX8dS2EF4X/KP9RjK0E2C31aTrL3ZXO
         9z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848665; x=1760453465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooDHwpdhrRPdu0uv/8dGzzz0KxOjXK1fuT/K0XYZV/Q=;
        b=btIu7LIBXpyAPCtQH+c0vytYIDYICASTURN4uHMtJyQ1w61ULWtjXnznfMnokZtzVB
         RFvy0uVRQPDx7RLJGrIIz5n3hTN45mCDa5zXlnp+r6IwCeF4s+ivST69S13R5S+9yDq4
         NYs84FnVZPNlnJSHzI3AyLNzFaRf3hLDr1J5Uf0zqAnzweT2BFm77QDIGO3VHnlDdzx5
         HmGWwYibndyP5LWJsJentOYCVZoK08yq4x2tkpqEedRl2Hb7Qx6x14e3q4YCvKiVL8UH
         zEW5iF9v8CIJYPsLk7sy000ATgpqpXGe4ijBCDFOYOs0ncZNIU1UHrrhv9wZ2++B+y8z
         UXqQ==
X-Gm-Message-State: AOJu0YxioxGoea3EzF3yNh31XWHbU93aWBH1u7llRLFQdmC1psfOjEaT
	gSftM2aP0CJNOK0QivIY1SoVSQodFx8CpQcesJ3QQDH6sbuv4EU0SD1x
X-Gm-Gg: ASbGncua3m1Chqk5M12o6Ty16aLA6QzVD8DFgthlbq+heNwHvniWLFaviXWdZmHsTii
	Jt/LQrhl9lxwAQaZLSh7jYh8yC2f8wj0frAVAa1zj71auSu6Tf56hSVt/dxP5D4bOhewGF7l1ax
	zTI7Zb5JUf/Nh2nawZm0UY3DYA/9qvFMxZVn2MPB5WrRpQ5mJwlhgHBUYmizVjH9jclOiyzbAYB
	Apa+ndvH3ArHqLze89UNDmNWt4yddKIbMdUY6TGBT38Y56roBicQ/TCmHbD70HUQRW5b/MTLn11
	ItFHQgoKc16Te3DHt5Jd8w3CIhCcWZQrKtyIDF2RzFhSLB0CB8WhAv5B2NWUzhGm1KSZnz3vZan
	wsAGtqXx6tkuhQAfDlChTZQSVyEJLWKVQrkfvVnMPF6teSsZ+kUcKl473/s4gksx+BT9RFMu7gQ
	MtOl8eg6mwUnPzVFsk
X-Google-Smtp-Source: AGHT+IF6G5l0OVl7GfUY6Kgw6qKschmetkAeTCgKaZlnwsCFc5a6BFWiT0OcdLh70WRagEQnIzYbWw==
X-Received: by 2002:a17:903:3c2c:b0:246:7a43:3f66 with SMTP id d9443c01a7336-29027213356mr575005ad.7.1759848664775;
        Tue, 07 Oct 2025 07:51:04 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1127c7sm169012905ad.28.2025.10.07.07.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:51:04 -0700 (PDT)
Message-ID: <8c6e94a4-55c1-4c74-8739-1cb663d1d952@gmail.com>
Date: Tue, 7 Oct 2025 23:51:05 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/5] together/applyrcu: Use \clnref{} and its
 friends in Section 13.5.9
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <50018985-d907-4028-b118-50c4c9fe894d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 ...usync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus | 26 ++++++++---------
 together/applyrcu.tex                         | 29 ++++++++++++-------
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
index 2f0de350..73859c24 100644
--- a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
@@ -5,7 +5,7 @@ C C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul
 	int a=1;
 	int b;
 	int c;
-	int *p=a;
+	int *p=a;			//\lnlbl[init:p]
 }
 
 P0(int *a, int *b, int *c, int **p)
@@ -13,9 +13,9 @@ P0(int *a, int *b, int *c, int **p)
 	int *r1;
 
 	*b = 1;
-	r1 = xchg(p, b);
-	synchronize_rcu();
-	*r1 = 0; // Emulate kfree();
+	r1 = xchg(p, b);		//\lnlbl[P0:xchg]
+	synchronize_rcu();		//\lnlbl[P0:sync]
+	*r1 = 0; // Emulate kfree();	//\lnlbl[P0:free]
 }
 
 P1(int *a, int *b, int *c, int **p)
@@ -23,9 +23,9 @@ P1(int *a, int *b, int *c, int **p)
 	int *r1;
 
 	*c = 1;
-	r1 = xchg(p, c);
-	synchronize_rcu();
-	*r1 = 0; // Emulate kfree();
+	r1 = xchg(p, c);		//\lnlbl[P1:xchg]
+	synchronize_rcu();		//\lnlbl[P1:sync]
+	*r1 = 0; // Emulate kfree();	//\lnlbl[P1:free]
 }
 
 P2(int *a, int *b, int *c, int **p)
@@ -33,15 +33,15 @@ P2(int *a, int *b, int *c, int **p)
 	int *r1;
 	int r2;
 
-	rcu_read_lock();
-	r1 = rcu_dereference(*p);
-	r2 = *r1;
-	rcu_read_unlock();
+	rcu_read_lock();		//\lnlbl[P2:lock]
+	r1 = rcu_dereference(*p);	//\lnlbl[P2:load]
+	r2 = *r1;			//\lnlbl[P2:deref]
+	rcu_read_unlock();		//\lnlbl[P2:unlock]
 }
 
 //\end[snippet]
 locations [0:r1; 1:r1; 2:r1; 2:r2; a; b; c; p]
 (* Better not be freed!!! *)
-exists (2:r2=0 \/ a=1 \/
+exists (2:r2=0 \/ a=1 \/			(* \lnlbl[ex:1] *)
 	(* Better be only one in use! *)
-	(b=1 /\ c=1) \/ (b=0 /\ c=0))
+	(b=1 /\ c=1) \/ (b=0 /\ c=0))		(* \lnlbl[ex:2] *)
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index ff1a276b..48eaa685 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -877,25 +877,30 @@ they use \co{rcu_assign_pointer()}.
 However, if we have concurrent lockless updates, one update's
 \co{rcu_assign_pointer()} can be silently overwritten by the next update,
 resulting in a memory leak.
+\begin{fcvref}[ln:formal:C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul:whole]
 One way to avoid this is to use an atomic \co{xchg()} instruction,
-as shown on lines~15 and~25 of
+as shown on \clnref{P0:xchg, P1:xchg} of
 \cref{lst:formal:Configuration-Update Example}.
 This way, the pointer from the overwritten \co{xchg()} is returned by
 the next \co{xchg()}, allowing the caller to free it after an RCU
-grace period (lines~16 and 26).
+grace period (\clnref{P0:sync, P1:sync}).
 Because the Linux-kernel memory model does not support dynamic allocation,
 this code emulates freeing by storing the value zero.
+\end{fcvref}
 
 \QuickQuiz{
 	Wait!!!
-	Isn't it necessary for lines~17 and~27 of
+	\begin{fcvref}[ln:formal:C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul:whole]
+	Isn't it necessary for \clnref{P0:free, P1:free} of
 	\cref{lst:formal:Configuration-Update Example}
-	to check for a \co{NULL} pointer returned from lines~15
-	and~25?
+	to check for a \co{NULL} pointer returned from
+	\clnref{P0:xchg, P1:xchg}?
+	\end{fcvref}
 }\QuickQuizAnswer{
 	In this textbook example, no.
 
-	This is because line~7 initialized pointer \co{p} to point to
+	\begin{fcvref}[ln:formal:C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul:whole]
+	This is because \clnref{init:p} initialized pointer \co{p} to point to
 	variable \co{a}, so that this pointer will never be \co{NULL}.
 	However, this is a very good question to ask because in most
 	production-quality code, a \co{NULL} check would indeed be
@@ -903,19 +908,23 @@ this code emulates freeing by storing the value zero.
 	On top of that, the first sentence of this section suggested
 	that the pointer might in fact be \co{NULL}.
 	Adding the NULL checks is left as an exercise for the reader.
+	\end{fcvref}
 }\QuickQuizEnd
 
+\begin{fcvref}[ln:formal:C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul:whole]
 The reader can then be written as a straightforward RCU reader
-(lines~35 and~38), loading the current pointer on line~36 and
-dereferencing it on line~37.
+(\clnrefrange{P2:lock}{P2:unlock}),
+loading the current pointer on \clnref{P2:load} and
+dereferencing it on \clnref{P2:deref}.
 
 Running this example
 (\path{CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus})
 through \co{herd}
 (see \cref{sec:formal:Axiomatic Approaches})
-verifies that this algorithm avoid use-after-free errors (line~43) and that it
+verifies that this algorithm avoid use-after-free errors (\clnref{ex:1}) and that it
 emulates freeing of all but one of the objects \co{a}, \co{b}, and \co{c}
-(line~45), thus also avoiding memory leaks.
+(\clnref{ex:2}), thus also avoiding memory leaks.
+\end{fcvref}
 
 \subsection{Lockless Double-Checked Locking}
 \label{sec:together:Lockless Double-Checked Locking}
-- 
2.43.0


