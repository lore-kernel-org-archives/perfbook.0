Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB51397E64
	for <perfbook@vger.kernel.org>; Sun,  2 Aug 2026 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785666771; cv=none; b=QsbugjtqanMCNnBP1zetXvBXrdeyBJOksjZ9Y8Ihg62UiBfII4+jVCcJN+KpWJDWiny0KgjH2cJ7m3i1/IwLAT4GbvtmYksln0SHMcMM+Wk60Z0w5qISqIOqaNT+CwxLPMacv2/NDfC75OZM0mFSGsLBfL2ZTBBfJdsfZT+CQpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785666771; c=relaxed/simple;
	bh=lMpb+fw967CpgK0gapAQ/ixAVCkZGWLM3lU3f/x8upI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=l9HCz2rP9GsnM0jX6KRT5V8dwnhanIUTDixjWwOxVi9qyz3AlFf+hgTjLFuJ0cW73IQGUDabAb/ylI5zLVdvysQFEVUwZ14sLOWaezukU28CMmAs4wSL666zAuXn7IcH4vniROBN3QUqzX8nbwMzlXY5WZQFhr6StIhSBF7+IoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/WkNhNl; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/WkNhNl"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cad8076b01so27471735ad.2
        for <perfbook@vger.kernel.org>; Sun, 02 Aug 2026 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785666769; x=1786271569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bifCMRT6b9O84TzQ/qIkktcv7OjZz5S0vYh5Kwe4AkU=;
        b=N/WkNhNlYfXPSZ2p0WhR0Ca1v2H4f2ub/sivZr+bFZqHbzn9RjJ4ZX4Uo4O0sTXkru
         5hs13Xa4eYc043nW8BBbMfDNd4hy5oOL+hHwOnCVkpvAaz98RTCKCPwb9gtIMINbVjry
         Rc8CUTeXxkbC7IzM6eLs0kzIbiuAHWRZ4smNz3io1iYhY8tIeOz4nqplIgL+f+pNyRPO
         IINagliEn1PRy6eCUm0yBklDn96JaVwuSx8UnKg5mpxy+oQmAUKequE5sp/UpgAMBxcf
         y3ReaxC3sDbP428rmvop/5ri6J0zkx1xs5JEhqm3t90DSi1zvdTLe6X1U/ALFEzR2DKv
         OPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666769; x=1786271569;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bifCMRT6b9O84TzQ/qIkktcv7OjZz5S0vYh5Kwe4AkU=;
        b=pFe55s/H0SBdEuX8bB7FU4BQzCV4SlR1wALxsrt6SxLMbdhxyaIarL5uX53FrCjh4W
         93Ez7zsSZR/rS+XYo4rwZVGbwQUdV0BX6trIR9SAN7pbYWXjUksKYeyB4BGEvQDOXPIM
         AzbaUOt7AkEsaQKtdmsXmAEjs8/oSDGVc4GiS1AOaIzazQm+VRCGhlkSUE/sJ+7IsxDS
         0DexzTu9p/yDJcZ0IX7+Lw7AQf/ydEmNtDXBtuYY5wtosL8P268EMg3ynCluSkUrvbel
         s2NJfkHgEqBSzQEV7vr3dUiQXVbWljDJFm3oBZbPLJkqx4TaOt1UTxyg3RSi/FOMqT5d
         T8lg==
X-Gm-Message-State: AOJu0Yyt9FocFBhLzuEuELoC0hkz8iQkvm7iR98DRr46VO1vTVKi90U0
	tUBzV7colTI6UTLpbgq1BrEZZRzm8taifuCJFHXOINUdwnzZOIhyPpUV
X-Gm-Gg: AR+sD12r3fEPXbPS7Fv5vKKm+IyGTLvbaJ8uPXVUWhVeOM/2GMZqa1oUHHvMhOkSqMt
	U993a//gP5TO5lLn3RUmY7NXBFHQjGZKqLa0JVkiAU5v9zzLXpsbEvsuwnFnLMqlCseLzADqkSp
	sclbn8bQdwKNP4fNdD+COkU2rl5KK0oGISjEcTsr6ofcY7FllVsoLfmeGfiwmD8h+gWm6VyRAtn
	6PpXPHoy/59fuzD7yAr1Ra2EgAD1Q1z2K5e193PLtIXB8kKojYhuQOO9DC1bx29okco0bcriAcK
	g7LIJKvu5Iz3vQIY+u7B1XkCStOH+q21CzhSXuGtff1KR1DokrrDthOMiPYOyCp2s+y+Ehq7ige
	x4gt3oBlAfITEM+bxm7xPAEcMVTDTBSob8vepcea+Xqz4AO7C14aN4Sv2Q14sKPkMtYCws1dGQA
	cVzL58NzAndLTvWC8h94oQ7ZRcHbYR7kEo0s9h5Tx8428aM2DZi/Uj1YkgJCSsipzlj5takCqQi
	6JhzPwf8nrk3A+uq/VhDdGELxOWOk8JaAXqIKUebWwKwQ==
X-Received: by 2002:a05:6a21:696:b0:3c3:a7ab:135a with SMTP id adf61e73a8af0-3c92a749b53mr5682333637.20.1785666768603;
        Sun, 02 Aug 2026 03:32:48 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ebec19sm2346867a12.31.2026.08.02.03.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 03:32:47 -0700 (PDT)
Message-ID: <277da031-ffc7-4b19-a632-5e3ba7d5dbec@gmail.com>
Date: Sun, 2 Aug 2026 19:32:46 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] toolsoftrade: Apply scheme of enhanced \clnref
 (2nd batch)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Following commit e3dcd91d7351 ("Enhance \clnref for multi-part listing
and employ it"), apply the enhanced scheme in listings converted since.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 254 ++++++++++++++++++++--------------
 1 file changed, 149 insertions(+), 105 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9c0bf4db..d6146b47 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1850,19 +1850,20 @@ first store.
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
 \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-in_progress = 1;
-do_something();
-in_progress = 2;
-do_something_else();
-in_progress = 0;
+\begin{fcvlabel}[ln:toolsoftrade:Fusing Stores]
+\begin{VerbatimT}[commandchars=\\\[\]]
+in_progress = 1;		\lnlbl[A1]
+do_something();			\lnlbl[A2]
+in_progress = 2;		\lnlbl[A3]
+do_something_else();		\lnlbl[A4]
+in_progress = 0;		\lnlbl[A5]
 \end{VerbatimT}
 Might be transformed to:
 \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-do_something();
-do_something_else();
-in_progress = 0;
+\begin{VerbatimT}[commandchars=\\\[\]]
+do_something();			\lnlbl[B1]
+do_something_else();		\lnlbl[B2]
+in_progress = 0;		\lnlbl[B3]
 \end{VerbatimT}
 Because this code stores to \co{in_progress}, the compiler is
 allowed so assume that there are neither concurrent loads nor
@@ -1871,14 +1872,15 @@ This permits the compiler to drop the first store to this variable, which
 might frustrate those expecting it to sometimes have a non-zero value.
 Prevent this by using \co{WRITE_ONCE()} and \co{barrier()} as follows:
 \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-WRITE_ONCE(in_progress, 1);
-do_something();
-WRITE_ONCE(in_progress, 2);
-do_something_else();
-WRITE_ONCE(in_progress, 0);
-in_progress = false;
+\begin{VerbatimT}[commandchars=\\\[\]]
+WRITE_ONCE(in_progress, 1);	\lnlbl[C1]
+do_something();			\lnlbl[C2]
+WRITE_ONCE(in_progress, 2);	\lnlbl[C3]
+do_something_else();		\lnlbl[C4]
+WRITE_ONCE(in_progress, 0);	\lnlbl[C5]
+in_progress = false;		\lnlbl[C6]
 \end{VerbatimT}
+\end{fcvlabel}
 \end{adjustwidth}
 \caption{Fusing Stores}
 \label{lst:toolsoftrade:Fusing Stores}
@@ -1886,22 +1888,26 @@ in_progress = false;
 
 However, there are exceptions, for example as shown in
 \cref{lst:toolsoftrade:Fusing Stores}.
-The code on line~A1 sets the variable \co{in_progress} to the value~1
-to indicate that \co{do_something()} is executing, line~A3 sets it to~2
-to indicate that \co{do_something_else()} is executing, and line~A5 sets
+\begin{fcvref}[ln:toolsoftrade:Fusing Stores]
+\setlnpref{A}
+The code on \clnref{A1} sets the variable \co{in_progress} to the value~1
+to indicate that \co{do_something()} is executing, \clnref{A3} sets it to~2
+to indicate that \co{do_something_else()} is executing, and \clnref{A5} sets
 it to~0 to indicate that neither is executing.
 
 Except that these are normal stores to a normal variable, which allows the
 compiler to assume that this variable is not subject to concurrent loads.
-As noted above, this in turn means that the stores on lines~A1 and~A3
-may be dropped, as shown on lines~B1-B3.
+As noted above, this in turn means that the stores on \clnref{A1,A3}
+\setlnpref{B}
+may be dropped, as shown on \clnrefrange{B1}{B3}.
 This in turn means that the value of \co{in_progress} is always zero,
 which might confuse and frustrate users expecting its value to indicate
 whether either of \co{do_something()} or \co{do_something_else()} is
 currently executing.
 
+\setlnpref{C}
 This problem can  be avoided by using \co{WRITE_ONCE()}, as shown
-on lines~C1, C3, and~C5.
+on \clnref{C1,C3,C5}.
 This use of \co{WRITE_ONCE()} informs the compiler that there might
 be concurrent loads and stores, preventing it from dropping the
 first two stores.
@@ -1910,48 +1916,54 @@ Unfortunately, there are additional problems with the code in
 \cref{lst:toolsoftrade:Fusing Stores},
 that those \co{WRITE_ONCE()} calls do not solve, including code
 reordering.
+\end{fcvref}
 
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
+\begin{fcvlabel}[ln:toolsoftrade:Reordering Code]
 \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-WRITE_ONCE(in_progress, 1);
-do_something();
-WRITE_ONCE(in_progress, 2);
-do_something_else();
-WRITE_ONCE(in_progress, 0);
+\begin{VerbatimT}[commandchars=\\\[\]]
+WRITE_ONCE(in_progress, 1);		\lnlbl[A1]
+do_something();				\lnlbl[A2]
+WRITE_ONCE(in_progress, 2);		\lnlbl[A3]
+do_something_else();			\lnlbl[A4]
+WRITE_ONCE(in_progress, 0);		\lnlbl[A5]
 \end{VerbatimT}
 Might be transformed to:
 \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-do_something();
-do_something_else();
-WRITE_ONCE(in_progress, 1);
-WRITE_ONCE(in_progress, 2);
-WRITE_ONCE(in_progress, 0);
+\begin{VerbatimT}[commandchars=\\\[\]]
+do_something();				\lnlbl[B1]
+do_something_else();			\lnlbl[B2]
+WRITE_ONCE(in_progress, 1);		\lnlbl[B3]
+WRITE_ONCE(in_progress, 2);		\lnlbl[B4]
+WRITE_ONCE(in_progress, 0);		\lnlbl[B5]
 \end{VerbatimT}
 This can happen if neither \co{do_something()} nor
 \co{do_something_else()} contain atomic or volatile operations.
+\begin{fcvref}[ln:toolsoftrade:Fusing Stores]
 The compiler is permitted to reorder these functions past both
 \co{WRITE_ONCE()} invocations, obtaining close to the same
-frustrating results as shown on lines~B1-B3 of
+\setlnpref{B}
+frustrating results as shown on \clnrefrange{B1}{B3} of
 \cref{lst:toolsoftrade:Fusing Stores}.
+\end{fcvref}
 Prevent this by using \co{barrier()} as follows:
 \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-WRITE_ONCE(in_progress, 1);
-barrier();
-do_something();
-barrier();
-WRITE_ONCE(in_progress, 2);
-barrier();
-do_something_else();
-barrier();
-WRITE_ONCE(in_progress, 0);
-barrier();
-in_progress = false;
+\begin{VerbatimT}[commandchars=\\\[\]]
+WRITE_ONCE(in_progress, 1);		\lnlbl[C1]
+barrier();				\lnlbl[C2]
+do_something();				\lnlbl[C3]
+barrier();				\lnlbl[C4]
+WRITE_ONCE(in_progress, 2);		\lnlbl[C5]
+barrier();				\lnlbl[C6]
+do_something_else();			\lnlbl[C7]
+barrier();				\lnlbl[C8]
+WRITE_ONCE(in_progress, 0);		\lnlbl[C9]
+barrier();				\lnlbl[C10]
+in_progress = false;			\lnlbl[C11]
 \end{VerbatimT}
+\end{fcvlabel}
 \end{adjustwidth}
 \caption{Reordering Code}
 \label{lst:toolsoftrade:Reordering Code}
@@ -1961,9 +1973,11 @@ in_progress = false;
 combine common subexpressions, reduce register pressure, and
 improve utilization of the many functional units available on
 modern superscalar microprocessors.
+\begin{fcvref}[ln:toolsoftrade:Reordering Code]
+\setlnpref{A}
 It is also another reason why the code in
 \cref{lst:toolsoftrade:Fusing Stores}
-is buggy, as shown on lines~A1-A3 of
+is buggy, as shown on \clnrefrange{A1}{A3} of
 \cref{lst:toolsoftrade:Reordering Code}.
 
 If the functions \co{do_something()} and \co{do_something_else()} are free
@@ -1971,11 +1985,12 @@ of volatile and atomic operations, the compiler will assume that there
 are no conflicting accesses to variables accessed by these two functions.
 Here, conflicting accesses to a variable are a set of concurrent accesses
 to that variable, at least one of which is a store.
+\setlnpref{B}
 Yes, the \co{WRITE_ONCE()} calls prevent the compiler from dropping
 any of the stores, but the compiler is under no obligation to maintain
-ordering of other code with those stores, as shown on lines~B1-B3.
+ordering of other code with those stores, as shown on \clnrefrange{B1}{B3}.
 Because the three stores execute in quick succession, for most purposes,
-the first two stores (lines~B3 and~B4) might as well have been dropped!
+the first two stores (\clnref{B3,B4}) might as well have been dropped!
 
 It might seem futile to prevent the compiler from changing the order of
 accesses in cases where the underlying hardware is free to reorder them.
@@ -1992,11 +2007,13 @@ independent of the ordering provided by the underlying hardware.\footnote{
 	you use atomics or variables of type \apic{sig_atomic_t}, instead
 	of \apik{READ_ONCE()} and \apik{WRITE_ONCE()}.}
 
+\setlnpref{C}
 And this problem can be solved by inserting \co{barrier()}
-calls on lines~C2, C4, C6, C6, C8, and~C10.
+calls on \clnref{C2,C4,C6,C8,C10}.
 See
 \cref{sec:toolsoftrade:Assembling the Rest of a Solution}
 for more detail on \co{barrier()}.
+\end{fcvref}
 
 \QuickQuiz{
 	This is ridiculous!!!
@@ -2034,10 +2051,12 @@ increases in cache misses, and thus significant degradation of
 both performance and scalability.
 
 \item[Invented stores] can occur in a number of situations.
-For example, a compiler emitting code for lines~B1--B3 of
+\begin{fcvref}[ln:toolsoftrade:Fusing Stores]
+\setlnpref{B}
+For example, a compiler emitting code for \clnrefrange{B1}{B3} of
 \cref{lst:toolsoftrade:Fusing Stores}
 might notice that \co{in_progress} is not accessed by either
-\co{do_something()} or \co{do_something_else()}, and is stored to on line~B3.
+\co{do_something()} or \co{do_something_else()}, and is stored to on \clnref{B3}.
 If either function was a complex and inline, it might be
 necessary to do a register spill, in which case one attractive
 place to use for temporary storage is \co{in_progress}.
@@ -2046,25 +2065,27 @@ After all, there are no accesses to it, so what is the harm?
 Of course, a store of any value outside the range 0--2 to this variable
 could confuse and frustrate any user who would naturally be expecting
 its value to remain in this range.
+\end{fcvref}
 
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
 \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-if (condition)
-	a = 1;
-else
-	do_a_bunch_of_stuff(&a);
+\begin{fcvlabel}[ln:toolsoftrade:Inventing Stores]
+\begin{VerbatimT}[commandchars=\\\[\]]
+if (condition)				\lnlbl[A1]
+	a = 1;				\lnlbl[A2]
+else					\lnlbl[A3]
+	do_a_bunch_of_stuff(&a);	\lnlbl[A4]
 \end{VerbatimT}
 Might be transformed to:
 \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-a = 1;
-if (!condition) {
-	a = 0;
-	do_a_bunch_of_stuff(&a);
-}
+\begin{VerbatimT}[commandchars=\\\[\]]
+a = 1;					\lnlbl[B1]
+if (!condition) {			\lnlbl[B2]
+	a = 0;				\lnlbl[B3]
+	do_a_bunch_of_stuff(&a);	\lnlbl[B4]
+}					\lnlbl[B5]
 \end{VerbatimT}
 If \co{do_a_bunch_of_stuff()} uses a normal store to modify \co{a}, then
 there is a store to \co{a} on both legs of the \co{if} statement.
@@ -2072,12 +2093,13 @@ This permits compiler to insert an unconditional store and a compensating
 store, reducing an if-then-else to an if-then.
 Prevent this by using \co{WRITE_ONCE()} as follows:
 \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-if (condition)
-	WRITE_ONCE(a, 1);
-else
-	do_a_bunch_of_stuff(&a);
+\begin{VerbatimT}[commandchars=\\\[\]]
+if (condition)				\lnlbl[C1]
+	WRITE_ONCE(a, 1);		\lnlbl[C2]
+else					\lnlbl[C3]
+	do_a_bunch_of_stuff(&a);	\lnlbl[C4]
 \end{VerbatimT}
+\end{fcvlabel}
 \end{adjustwidth}
 \caption{Inventing Stores}
 \label{lst:toolsoftrade:Inventing Stores}
@@ -2089,16 +2111,20 @@ Nevertheless, readers might be justified in wanting a less
 outlandish example, which is provided by
 \cref{lst:toolsoftrade:Inventing Stores}.
 
-A compiler emitting code for lines~A1--A4 of
+\begin{fcvref}[ln:toolsoftrade:Inventing Stores]
+\setlnpref{A}
+A compiler emitting code for \clnrefrange{A1}{A4} of
 \cref{lst:toolsoftrade:Inventing Stores}
 might know that the value of \co{a} is initially zero and that
 \co{do_a_bunch_of_stuff()} modifies the variable referenced by its
 argument (in this case, \co{a}).
+\setlnpref{B}
 Such a compiler might be strongly tempted to optimize away one branch
-by transforming this code to that shown in lines~B1--B5.
-Here, line~B1 unconditionally stores \co{1} to \co{a}, then resets the
-value back to zero on line~B3 if the value of \co{condition} was zero.
+by transforming this code to that shown in \clnrefrange{B1}{B5}.
+Here, \clnref{B1} unconditionally stores \co{1} to \co{a}, then resets the
+value back to zero on \clnref{B3} if the value of \co{condition} was zero.
 This transforms the if-then-else into an if-then, saving one branch.
+\end{fcvref}
 
 \QuickQuiz{
 	Ouch!
@@ -2125,8 +2151,11 @@ This transforms the if-then-else into an if-then, saving one branch.
 	By inventing the store, the compiler might be introducing a
 	data race, which it is not permitted to do.
 
-	Furthermore, on line C4 of
+\begin{fcvref}[ln:toolsoftrade:Inventing Stores]
+\setlnpref{C}
+	Furthermore, on \clnref{C4} of
 	\cref{lst:toolsoftrade:Inventing Stores},
+\end{fcvref}
 	the address of that variable is passed to
 	\co{do_a_bunch_of_stuff()}.
 	If the compiler can see this function's definition, and
@@ -2148,38 +2177,43 @@ against compiler optimizations that invent data races.
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
+\begin{fcvlabel}[ln:toolsoftrade:Store-to-Load Conversion]
 \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-r1 = p;
-if (unlikely(r1))
-	do_something_with(r1);
-barrier();
-p = NULL;
+\begin{VerbatimT}[commandchars=\\\[\]]
+r1 = p;					\lnlbl[A1]
+if (unlikely(r1))			\lnlbl[A2]
+	do_something_with(r1);		\lnlbl[A3]
+barrier();				\lnlbl[A4]
+p = NULL;				\lnlbl[A5]
 \end{VerbatimT}
 Might be transformed to:
 \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-r1 = p;
-if (unlikely(r1))
-	do_something_with(r1);
-barrier();
-if (p != NULL)
-	p = NULL;
+\begin{VerbatimT}[commandchars=\\\[\]]
+r1 = p;					\lnlbl[B1]
+if (unlikely(r1))			\lnlbl[B2]
+	do_something_with(r1);		\lnlbl[B3]
+barrier();				\lnlbl[B4]
+if (p != NULL)				\lnlbl[B5]
+	p = NULL;			\lnlbl[B6]
 \end{VerbatimT}
+\begin{fcvref}[ln:toolsoftrade:Store-to-Load Conversion]
+\setlnpref{A}
 Although the \co{barrier()} prevents the compiler from using the value
-loaded from \co{p} on line~A1, profile-guided optimization might tell
+loaded from \co{p} on \clnref{A1}, profile-guided optimization might tell
 the compiler that the value of \co{p} was almost always \co{NULL}.
+\end{fcvref}
 Checking the value before storing might be an attractive optimization,
 destructive though it might be to ordering in the case where
 \co{do_something_with()} contains an \co{smp_wmb()}.
 Prevent this by using \co{READ_ONCE()} and \co{WRITE_ONCE()} as follows:
 \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
-\begin{VerbatimT}
-r1 = READ_ONCE(p);
-if (unlikely(r1))
-	do_something_with(r1);
-WRITE_ONCE(p, NULL);
+\begin{VerbatimT}[commandchars=\\\[\]]
+r1 = READ_ONCE(p);			\lnlbl[C1]
+if (unlikely(r1))			\lnlbl[C2]
+	do_something_with(r1);		\lnlbl[C3]
+WRITE_ONCE(p, NULL);			\lnlbl[C4]
 \end{VerbatimT}
+\end{fcvlabel}
 \end{adjustwidth}
 \caption{Store-to-Load Conversion}
 \label{lst:toolsoftrade:Store-to-Load Conversion}
@@ -2189,21 +2223,23 @@ WRITE_ONCE(p, NULL);
 that a plain store might not actually change the value in memory.
 For example, consider
 \cref{lst:toolsoftrade:Store-to-Load Conversion}.
-Line~A1 fetches \co{p}, but the \qco{if} statement on
-line~A2 also tells the compiler that the developer thinks that
+\begin{fcvref}[ln:toolsoftrade:Store-to-Load Conversion]\setlnpref{A}
+\Clnref{A1} fetches \co{p}, but the \qco{if} statement on
+\clnref{A2} also tells the compiler that the developer thinks that
 \co{p} is usually \co{NULL}.\footnote{
 	The \apik{unlikely()} function provides this hint to the compiler,
 	and different compilers provide different ways of implementing
 	\co{unlikely()}.}
-The \apik{barrier()} statement on line~A4 forces the compiler to forget
+The \apik{barrier()} statement on \clnref{A4} forces the compiler to forget
 the value of \co{p}, but one could imagine a (perhaps buggy) compiler
 choosing to remember the hint---or getting a replacement hint via
 profile-guided optimization.
-Doing so could cause the compiler to realize that line~A5 is often an
+Doing so could cause the compiler to realize that \clnref{A5} is often an
 expensive no-op.
 
+\setlnpref{B}
 Such a compiler might therefore guard the store of \co{NULL}
-with a check, as shown on lines~B5--B6.
+with a check, as shown on \clnrefrange{B5}{B6}.
 Although this transformation is often desirable, it could be problematic
 if the actual store was required for ordering.
 For example, if \co{do_something_with()} contained a write memory barrier
@@ -2211,25 +2247,33 @@ For example, if \co{do_something_with()} contained a write memory barrier
 check load.
 This situation might suggest use of \apik{smp_store_release()} over
 \apik{smp_wmb()}.
+\setlnpref{C}
 Or alternatively, use of \co{READ_ONCE()} and \co{WRITE_ONCE()} combined
-with the assumed \co{smp_wmb()}, as shown on lines~C1 and~C4.
+with the assumed \co{smp_wmb()}, as shown on \clnref{C1,C4}.
+\end{fcvref}
 
 \QuickQuiz{
-	But doesn't the \co{if} statement on line~C2 provide a control
+\begin{fcvref}[ln:toolsoftrade:Store-to-Load Conversion]
+	\setlnpref{C}
+	But doesn't the \co{if} statement on \clnref{C2} provide a control
 	dependency that makes the \co{smp_wmb} unnecessary?
+\end{fcvref}
 }\QuickQuizAnswer{
 	No, and for two reasons.
 
+\begin{fcvref}[ln:toolsoftrade:Store-to-Load Conversion]
+	\setlnpref{C}
 	First, in the Linux-kernel memory model, the control dependency
-	does not extend beyond the end of the \co{if} on line~C3, and
-	thus does not extend to the store on line~C4.
+	does not extend beyond the end of the \co{if} on \clnref{C3}, and
+	thus does not extend to the store on \clnref{C4}.
 
 	Second, even if the control dependency did somehow extend to
-	line~C4 (perhaps due to C4 being moved into the body of the
+	\clnref{C4} (perhaps due to \clnref{C4} being moved into the body of the
 	\co{if} statement), that dependency would order the load on
-	line~C1 with the store on line~C4.
+	line~C1 with the store on \clnref{C4}.
 	It would \emph{not} order any stores prior to the assumed
 	\co{smp_wmb()} in \co{do_something_with()}.
+\end{fcvref}
 
 	So there is a control dependency, but it does not extend far
 	enough and it also might not order the prior writes that the

base-commit: 6fa444b92d1158310a43074b6d680055e93fbbca
-- 
2.43.0

