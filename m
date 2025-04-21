Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3715234
	for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745229419; cv=none; b=MZskyXuTY5/L2hndzHkVuB0LvSEvDMyv0sCJ4xrIjq2Z4B/WYVTzxbqOnl8h5rxE5mqkKe1/IdAonz41fgV/pbR3ERxCz0RB13wxJFQ/Qu9N63sNXhNa4m3r8EQv7AFXKmzQ4D8JkX+5tzFM3pQHPZ3lxEWTIkkS+cBA2gGrR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745229419; c=relaxed/simple;
	bh=2R5IovpRs1c3x+QEdYVWZinhjAUpaS/GhI3PBYxfwk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7rm7y9KXMF7S1YiN2cUYCUUgbU38tD/5xGTGsug7rDujD5NOEUDd3wE705vWlPTlDjeACMqDGOMhjvarF4tPqri2UfAJZe17/GkgMWiDPc4rJc3TqCpjctzOoKHfRu4fVya8xVSNLOrBtuEu8gk1QixoUQStR4QtAB1T9tmKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6AEQOJt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6AEQOJt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227cf12df27so32898225ad.0
        for <perfbook@vger.kernel.org>; Mon, 21 Apr 2025 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745229416; x=1745834216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7tX9R66Y3e5oxaFa2o+50iM02kW0bzlilLygW6knZo=;
        b=b6AEQOJtxKEfcs8l+u2wASLA0caKaHbnqCfR+fRTJFsJffPEdzvvn0ayoHFSs/ZOuo
         hMgz5C5NNkYRQ7bVgifFUpHp/XW9G7fkjjlHlZX4ZGvAuerlNmhaQrMyZ1/cmzaHfIIl
         EdeeWnnrev9kpA559SVyXuiGT9+Uo8W8kTDKJWaoH7i3by/fBQSwwUXPCw/CvAZ4Kzpu
         M54Oo0DVtO96pnEIqE3fiWA0ONnUXjKlK41VX6LnpElxUz4ybrDqeOBMGTyafmG71duI
         uhCNMX50DnVETjd0XzvfTVAf13byeu57uk2YHp3YlIIywc35dH4xzL3Pe9IahesEL9zI
         ayRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745229416; x=1745834216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7tX9R66Y3e5oxaFa2o+50iM02kW0bzlilLygW6knZo=;
        b=fj6yeur8EXL8F2etsEYdZ1gYcJuQH0YPrxt5NMO12pWyrF3FhNt/7/41EJ71sYnMw9
         5epcb+aUUTd79vMlAwptPAx0k/oSsQytcbA6FqxWZB83qdfE1MotgN4EtdwsIs3ck8eZ
         nxbNUBiG1XYVi1ZgR0eHWABpBG2xxNxLGBJMy2qXdHEUcZeco/maT4s2T1P8KvlVYLSM
         qMkqX9GzV9GTuGaQK64Npt7vwjhEghtRBq8EujwwXwGHM3CiaBkQ/6xSmjKf8LGzBa9S
         w1l22j7wodjqQ2aI6znLmgvw2gVkEeS4U3oDWzVhXZ/Rvv4EncVpdQDlK2OTRT8vl85d
         CDLA==
X-Gm-Message-State: AOJu0YyKLXrcpOPF/IgdQSAtnQZ3AXkvFrkLiY2+/h+XACtpGxkvys9g
	GJRaAzUwDHkOerLqmj7GZoETZ0n2yCa+dLtybAbzz45Dv/RpcSYQ
X-Gm-Gg: ASbGncuqAKPVIQIOTrFEZdPG8PrBkK2PhejQNpyJkC3bRs652+iiL+XSKjFhbCFxG+u
	qz2sbRow760ojZa0nByg1GMGzc2sedPF2KdET+8rVN245Cqj6bBDTcQuwCtCGI8Y3UZpj9Mx39E
	1dMR/uWPcWhq99XD1fBOTxlItbajMt/3ItKTY4DhMqL9WFvQ7KCl6n/r+c77MEFukrf+BFOzBDZ
	zKbZujbvp5OGmrmTkD+hc3/YlVWUq8NAZUdQcq0BN+dSx9sp4YoTzsKMiB5Hg7tDrCvPq5FlwYP
	CTHt4ImU9PrtykY4wMzaWD7gpBsCKebU/HJuZKbXm9Ovp5SxCM/cCG7XR3FZdRCYWmX10ys84d5
	aEpM4EzcJjE0=
X-Google-Smtp-Source: AGHT+IF8eZCph4dLtdvV24R4OfOPGUyODZ3jCOTNdqDWTcVnmm8ODX4EihARMVGS/JKFpsfyib3MNg==
X-Received: by 2002:a17:903:1b2d:b0:224:3d:2ffd with SMTP id d9443c01a7336-22c50d4525bmr172675995ad.17.1745229416217;
        Mon, 21 Apr 2025 02:56:56 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm6180275a91.19.2025.04.21.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 02:56:55 -0700 (PDT)
Message-ID: <b169a1d8-2593-4afc-8da5-a2dfc5b86b23@gmail.com>
Date: Mon, 21 Apr 2025 18:56:54 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 1/5] Refactor index markers of "memory
 consistency"-related terms
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

Commit f24ccfbd345e ("index: Reform indexing tags related to 'memory
consistency'") preferred "Sequential consistency", "Process consistency",
and "Weak consistency" to "Sequential memory consistency", "Process
memory consistency", and "Weak memory consistency" in single level
Index pages.  As a result, two-level Index pages have the following:

   - Consistency
      - memory
      - sequential
      - process
      - weak

However, the latter three terms talk about varieties of "memory
consistency" models.  Having "memory" and the other three at the
same level is confusing.

So revert the change in the commit and add a couple of redirections
to "Memory consistency" in both single- and two-level Index pages.

Also add index markers for "Memory model".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex     |  2 +-
 formal/ppcmem.tex        |  4 ++--
 formal/spinhint.tex      |  4 +++-
 future/formalregress.tex | 11 ++++++-----
 glossary.tex             |  6 +++---
 indexsee.tex             | 16 ++++++++++------
 memorder/memorder.tex    | 27 ++++++++++++++++-----------
 together/seqlock.tex     |  4 +++-
 8 files changed, 44 insertions(+), 30 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 42fd5fb0..7d2fb0e7 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -67,7 +67,7 @@ suggests that an approach that treated similar traces as one might
 improve performace.
 One such approach is the axiomatic approach of
 \pplsur{Jade}{Alglave} et al.~\cite{Alglave:2014:HCM:2594291.2594347},
-which creates a set of axioms to represent the memory model and then
+which creates a set of axioms to represent the \IX{memory model} and then
 converts litmus tests to theorems that might be proven or disproven
 over this set of axioms.
 The resulting tool, called \qco{herd},  conveniently takes as input the
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 9d7704fa..0ca9dfb0 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -9,7 +9,7 @@
 
 Although Promela and Spin allow you to verify pretty much any (smallish)
 algorithm, their very generality can sometimes be a curse.
-For example, Promela does not understand memory models or any sort
+For example, Promela does not understand \IX{memory model}s or any sort
 of reordering semantics.
 This section therefore describes some state-space search tools that
 understand memory models used by production systems, greatly simplifying the
@@ -256,7 +256,7 @@ The next section describes how to run this litmus test.
 
 As noted earlier, litmus tests may be run interactively via
 \url{https://www.cl.cam.ac.uk/~pes20/ppcmem/}, which can help build an
-understanding of the memory model.
+understanding of the \IX{memory model}.
 However, this approach requires that the user manually carry out the
 full state-space search.
 Because it is very difficult to be sure that you have checked every
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 9e68198e..cc092bcf 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -521,7 +521,9 @@ full ordering.
 In any given Promela state, all processes agree on both the current
 state and the order of state changes that caused us to arrive at
 the current state.
-This is analogous to the ``sequentially consistent'' memory model
+This is analogous to the
+``\IXalth{sequentially consistent}{sequential}{memory consistency}''
+\IX{memory model}
 used by a few computer systems (such as 1990s MIPS and PA-RISC\@).
 As noted earlier, and as will be seen in a later example,
 weak memory ordering must be explicitly coded.
diff --git a/future/formalregress.tex b/future/formalregress.tex
index 63c9021f..b674d616 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -154,9 +154,9 @@ testing, which is in fact the topic of this section.
 
 It is critically important that formal-verification tools correctly
 model their environment.
-One all-too-common omission is the memory model, where a great
+One all-too-common omission is the \IX{memory model}, where a great
 many formal-verification tools, including Promela/\co{spin}, are
-restricted to \IXh{sequential}{consistency}.
+restricted to \IXalth{sequential consistency}{sequential}{memory consistency}.
 The QRCU experience related in
 \cref{sec:formal:Is QRCU Really Correct?}
 is an important cautionary tale.
@@ -624,8 +624,9 @@ shows a rough-and-ready scorecard for the formal-verification tools
 covered in this chapter.
 Shorter wavelengths are better than longer wavelengths.
 
-Promela requires hand translation and supports only sequential
-consistency, so its first two cells are red.
+Promela requires hand translation and supports only
+\IXalth{sequential consistency}{sequential}{memory consistency},
+so its first two cells are red.
 It has reasonable overhead (for formal verification, anyway)
 and provides a traceback, so its next two cells are yellow.
 Despite requiring hand translation, Promela handles assertions
@@ -633,7 +634,7 @@ in a natural way, so its fifth cell is green.
 
 PPCMEM usually requires hand translation due to the small size of litmus
 tests that it supports, so its first cell is orange.
-It handles several memory models, so its second cell is green.
+It handles several \IX{memory model}s, so its second cell is green.
 Its overhead is quite high, so its third cell is red.
 It provides a graphical display of relations among operations, which
 is not as helpful as a traceback, but is still quite useful, so its
diff --git a/glossary.tex b/glossary.tex
index bc7ebed1..4184529c 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -445,7 +445,7 @@
 	instructions that executed before the memory barrier to precede
 	those that will execute following that memory barrier.
 	(See also ``read memory barrier'' and ``write memory barrier''.)
-\item[\IXGh{Memory}{Consistency}:]
+\item[\IXG{Memory Consistency}:]
 	A set of properties that impose constraints on the order in
 	which accesses to groups of variables appear to occur.
 	Memory consistency models range from sequential consistency,
@@ -576,7 +576,7 @@
 	A source-code memory access that simply mentions the name of
 	the object being accessed.
 	(See ``Marked access''.)
-\item[\IXGh{Process}{Consistency}:]
+\item[\IXGalth{Process Consistency}{process}{memory consistency}:]
 	A memory-consistency model in which each CPU's stores appear to
 	occur in program order, but in which different CPUs might see
 	accesses from more than one CPU as occurring in different orders.
@@ -711,7 +711,7 @@
 \item[\IXGh{Sequence}{Lock}:]
 	A reader-writer synchronization mechanism in which readers
 	retry their operations if a writer was present.
-\item[\IXGh{Sequential}{Consistency}:]
+\item[\IXGalth{Sequential Consistency}{sequential}{memory consistency}:]
 	A memory-consistency model where all memory references appear to occur
 	in an order consistent with
 	a single global order, and where each CPU's memory references
diff --git a/indexsee.tex b/indexsee.tex
index bd80b56a..9f949378 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -1,5 +1,6 @@
-% effecive in both single- and two- level index
+% effective in both single- and two- level index
 \index{Full(y) multi-copy atomic|see{Multi-copy atomic}}
+\index{Memory consistency model|see{Memory model}}
 \IfIndexHier{ % effective only in two-level index
 \index{Address dependency|see{Dependency, address}}
 \index{Anti-heisenbug|see{Heisenbug, anti-}}
@@ -20,23 +21,26 @@
 \index{Full memory barrier|see{Memory barrier, full}}
 \index{Fully associative cache|see{Cache, fully associative}}
 \index{Grace-period latency|see{Latency, grace-period}}
-\index{Memory consistency|see{Consistency, memory}}
 \index{Memory latency|see{Latency, memory}}
 \index{Memory-barrier latency|see{Latency, memory-barrier}}
 \index{Memory-barrier overhead|see{Overhead, memory-barrier}}
 \index{Message latency|see{Latency, message}}
 \index{Non-multi-copy atomic|see{Multi-copy atomic, non-}}
 \index{Other-multi-copy atomic|see{Multi-copy atomic, other-}}
-\index{Process consistency|see{Consistency, process}}
+\index{Process consistency|see{Memory consistency, process}}
 \index{RCU read-side critical section|see{Critical section, RCU read-side}}
 \index{Read memory barrier|see{Memory barrier, read}}
 \index{Read-side critical section|see{Critical section, read-side}}
 \index{Reader-writer lock|see{Lock, reader-writer}}
 \index{Scheduling latency|see{Latency, scheduling}}
 \index{Sequence lock|see{Lock, sequence}}
-\index{Sequential consistency|see{Consistency, sequential}}
-\index{Weak consistency|see{Consistency, weak}}
+\index{Sequential consistency|see{Memory consistency, sequential}}
+\index{Weak consistency|see{Memory consistency, weak}}
 \index{Write memory barrier|see{Memory barrier, write}}
 \index{Write miss|see{Cache miss, write}}
 \index{Write-side critical section|see{Critical section, write-side}}
-}{}
+}{ % effective for single-level index
+\index{Process consistency|see{Process memory consistency}}
+\index{Sequential consistency|see{Sequential memory consistency}}
+\index{Weak consistency|see{Weak memory consistency}}
+}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 3fab79a5..ee2dc324 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -425,7 +425,7 @@ set of rules of thumb.
 \label{sec:memorder:Rules of Thumb}
 
 The transitive intuitions presented in the previous section are
-very appealing, at least as memory models go.
+very appealing, at least as \IX{memory model}s go.
 Unfortunately, hardware is under no obligation to provide temporal
 cause-and-effect illusions when one thread's store overwrites a value either
 loaded or stored by some other thread.
@@ -509,7 +509,8 @@ This rule underlies the release-acquire intuitions presented in
 \cref{sec:memorder:Release-Acquire Intuitions}.
 
 You can replace a given acquire with a dependency in environments permitting
-this, keeping in mind that the C11 standard's memory model does \emph{not}
+this, keeping in mind that the
+\IXalthmr{C11 standard's memory model}{C11}{memory model} does \emph{not}
 fully respect dependencies.
 Therefore, a dependency leading to a load must be headed by
 a \co{READ_ONCE()} or an \co{rcu_dereference()}:
@@ -599,7 +600,8 @@ will be discussed in
 \cref{sec:memorder:Hardware Specifics},
 but these guarantees may only be relied upon in code that runs only for
 that architecture.
-In addition, more accurate memory models~\cite{Alglave:2018:FSC:3173162.3177156}
+In addition, more accurate
+\IX{memory model}s~\cite{Alglave:2018:FSC:3173162.3177156}
 may give stronger guarantees with lower-overhead operations than do
 these rules of thumb, albeit at the expense of greater complexity.
 In these more formal memory-ordering papers, a store-to-load link is an
@@ -5467,14 +5469,15 @@ semaphores, RCU, \ldots) include any needed ordering primitives.
 So if you are working with code that uses these primitives properly,
 you need not worry about Linux's memory-ordering primitives.
 
-That said, deep knowledge of each CPU's memory-consistency model
+That said, deep knowledge of each CPU's
+\IXalt{memory-consistency model}{memory model}
 can be very helpful when debugging, to say nothing of when writing
 architecture-specific code or synchronization primitives.
 
 Besides, they say that a little knowledge is a very dangerous thing.
 Just imagine the damage you could do with a lot of knowledge!
 For those who wish to understand more about individual CPUs'
-\IXh{memory}{consistency} models, the next sections describe those of a few
+memory consistency models, the next sections describe those of a few
 popular and prominent CPUs.
 Although there is no substitute for actually reading a given CPU's
 documentation, these sections do give a good overview.
@@ -5707,7 +5710,7 @@ For more on Alpha, see its reference manual~\cite{ALPHA2002}.
 
 The \ARM\ family of CPUs is popular in deep embedded applications,
 particularly for power-constrained microcontrollers.
-Its memory model is similar to that of \Power{}
+Its \IXalthmr{memory model}{Armv7}{memory model} is similar to that of \Power{}
 (see \cref{sec:memorder:POWER / PowerPC}), but \ARM\ uses a
 different set of memory-barrier instructions~\cite{ARMv7A:2010}:
 
@@ -5795,7 +5798,8 @@ Note that inserting an additional \co{ISB} instruction somewhere between
 includes 64-bit capabilities,
 in contrast to their 32-bit-only CPU described in
 \cref{sec:memorder:ARMv7-A/R}.
-\ARMv8's memory model closely resembles its \ARMv7 counterpart,
+\IXalthmr{\ARMv8's memory model}{Armv8}{memory model}
+closely resembles its \ARMv7 counterpart,
 but adds load-acquire (\co{LDLARB}, \co{LDLARH}, and \co{LDLAR})
 and store-release (\co{STLLRB}, \co{STLLRH}, and \co{STLLR})
 instructions.
@@ -5832,8 +5836,8 @@ defined its memory ordering with an executable formal model~\cite{ARMv8A:2017}.
 \subsection{Itanium}
 \label{sec:memorder:Itanium}
 
-Itanium offers a \IXh{weak}{consistency}
-model, so that in absence of explicit
+Itanium offers a \IXalth{weak consistency}{weak}{memory consistency}
+\IXalthmr{model}{Itanium}{memory model}, so that in absence of explicit
 memory-barrier instructions or dependencies, Itanium is within its rights
 to arbitrarily reorder memory references~\cite{IntelItanium02v2}.
 Itanium has a memory-fence instruction named \co{mf}, but also has
@@ -5997,7 +6001,7 @@ CPU, including those to the same variable.
 
 \subsection{MIPS}
 
-The MIPS memory model~\cite[page~479]{MIPSvII-A-2016}
+The \IXhmr{MIPS}{memory model}~\cite[page~479]{MIPSvII-A-2016}
 appears to resemble that of \ARM, Itanium, and \Power{},
 being weakly ordered by default, but respecting dependencies.
 MIPS has a wide variety of memory-barrier instructions, but ties them
@@ -6227,7 +6231,8 @@ the \co{smp_mb()} and \co{smp_rmb()} primitives expanded to \co{lock;addl}.
 This atomic instruction acts as a barrier to both loads and stores.
 
 But those were ancient times.
-More recently, Intel has published a memory model for
+More recently, Intel has published a
+\IXalthmr{memory model}{x86}{memory model} for
 x86~\cite{Intelx86MemoryOrdering2007}.
 It turns out that Intel's modern CPUs enforce tighter ordering than was
 claimed in the previous specifications, so this model simply mandates
diff --git a/together/seqlock.tex b/together/seqlock.tex
index b77b5184..7083e232 100644
--- a/together/seqlock.tex
+++ b/together/seqlock.tex
@@ -132,7 +132,9 @@ notably in the dcache subsystem~\cite{NeilBrown2015RCUwalk}.
 Note that it is likely that similar schemes also work with hazard
 pointers.
 
-This approach provides \IXh{sequential}{consistency} to successful readers,
+This approach provides
+\IXalth{sequential consistency}{sequential}{memory consistency}
+to successful readers,
 each of which will either see the effects of a given update or not,
 with any partial updates resulting in a read-side retry.
 Sequential consistency is an extremely strong guarantee, incurring equally
-- 
2.43.0


