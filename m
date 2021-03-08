Return-Path: <SRS0=utkl=IG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u1kIEhcE8zqmEG59Bsxfzx8y2boF5b6ZNmTpXQ7LROU=;
        b=rERvREf1j6zVbQVgx6Hk7s1CYQ7/2huD9+w4UXqg+cSBTV/MCpvDpG7AV5FJI6p/eM
         qZ4YIzqkE17HcZ9Mwfjbwad2TIAwF85Nv05mmrWhnhBpIQ0L8wyCERDK2W+5QrN5ZWle
         X1T5N++mwVf0EkKuffjXy0ZUPTLQDWEORCECc8nn/BZ9w7JTXH7hu2SlQ2XhKvya3ct+
         K0nCM8F99uQntzIrcpw8I5b+jOKGiAFSefyo1aDskZzt+0Z8R4cRAnu2v8uoIw79S2A/
         +aNUbpxuT6aW0W2ayrAwcQgkI+fF4BAujSAZ5FGyD3Pte3B+hJ1MfFNlu6xDw8O99FWH
         ZcjA==
Subject: [PATCH 2/4] howto: Cite recent editions of textbooks
References: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9fe43416-713b-3f7a-3a05-827b575f03a0@gmail.com>
Date: Mon, 8 Mar 2021 10:55:34 +0900
MIME-Version: 1.0
In-Reply-To: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also fix usage of indexing macros for people's name.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/cpu.tex     |  2 +-
 howto/howto.tex | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index 5a5c9d49..44b470a4 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -16,7 +16,7 @@ This chapter therefore looks at the cost of synchronization and communication
 within a shared-memory system.
 These few pages can do no more than scratch the surface of shared-memory
 parallel hardware design; readers desiring more detail would do well
-to start with a recent edition of \pplsur{John L.}{Hennessy} and
+to start with a recent edition of \pplsur{John L.}{Hennessy}'s and
 \pplsur{David A.}{Patterson}'s classic
 text~\cite{Hennessy2017,Hennessy95a}.
 
diff --git a/howto/howto.tex b/howto/howto.tex
index 38606625..4558aaba 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -300,7 +300,7 @@ Fortunately, there are many alternatives available to you:
 \item	If you prefer a more academic and rigorous treatment of
 	parallel programming,
 	you might like \pplsur{Maurice P.}{Herlihy}'s and \pplsur{Nir}{Shavit}'s
-	textbook~\cite{HerlihyShavit2008Textbook}.
+	textbook~\cite{HerlihyShavit2008Textbook,HerlihyShavit2020Textbook}.
 	This book starts with an interesting combination
 	of low-level primitives at high levels of abstraction
 	from the hardware, and works its way through locking
@@ -316,7 +316,7 @@ Fortunately, there are many alternatives available to you:
 	programming from a programming\-/language\-/pragmatics viewpoint,
 	you might be interested in the concurrency chapter from
 	\pplsur{Michael}{Scott}'s
-	textbook~\cite{MichaelScott2006Textbook}
+	textbook~\cite{MichaelScott2006Textbook,MichaelScott2015Textbook}
 	on programming-language pragmatics.
 \item	If you are interested in an object-oriented patternist
 	treatment of parallel programming focussing on C++,
@@ -353,18 +353,18 @@ Fortunately, there are many alternatives available to you:
 \item	If you are interested in POSIX Threads, you might take
 	a look at \pplmdl{David R.}{Butenhof}'s book~\cite{Butenhof1997pthreads}.
 	In addition,
-	\ppl{W.~Richard}{Stevens}'s book~\cite{WRichardStevens1992}
+	\ppl{W.~Richard}{Stevens}'s book~\cite{WRichardStevens1992,WRichardStevens2013}
 	covers UNIX and POSIX, and \ppl{Stewart}{Weiss}'s lecture
 	notes~\cite{StewartWeiss2013UNIX} provide an
 	thorough and accessible introduction with a good set of
 	examples.
 \item	If you are interested in C++11, you might like
 	\ppl{Anthony}{Williams}'s ``C++ Concurrency in Action: Practical
-	Multithreading''~\cite{AnthonyWilliams2012}.
+	Multithreading''~\cite{AnthonyWilliams2012,AnthonyWilliams2019}.
 \item	If you are interested in C++, but in a Windows environment,
 	you might try \ppl{Herb}{Sutter}'s ``Effective Concurrency''
 	series in
-	Dr. Dobbs Journal~\cite{HerbSutter2008EffectiveConcurrency}.
+	Dr.~Dobbs Journal~\cite{HerbSutter2008EffectiveConcurrency}.
 	This series does a reasonable job of presenting a
 	commonsense approach to parallelism.
 \item	If you want to try out Intel Threading Building Blocks,
@@ -375,14 +375,15 @@ Fortunately, there are many alternatives available to you:
 	cache organizations affect the implementation of kernel
 	internals should take a look at \ppl{Curt}{Schimmel}'s classic
 	treatment of this subject~\cite{Schimmel:1994:USM:175689}.
-\item	If you are looking for a hardware view, \ppl{John}{Hennessy}'s and
-	\ppl{David}{Patterson}'s classic
+\item	If you are looking for a hardware view, \pplsur{John L.}{Hennessy}'s and
+	\pplsur{David A.}{Patterson}'s classic
 	textbook~\cite{Hennessy2017,Hennessy2011} is well worth a read.
 	If you are looking for an academic textbook on memory ordering,
-	that of \ppl{Daniel}{Sorin} et al.~\cite{DanielJSorin2011MemModel}
+	that of \ppl{Daniel}{Sorin} et al.~\cite{DanielJSorin2011MemModel,%
+	VijayNagarajan2020MemModel}
 	is highly recommended.
 	For a memory-ordering tutorial from a Linux-kernel viepwpoint,
-	{Paolo}{Bonzini}'s LWN series is a good place to
+	\ppl{Paolo}{Bonzini}'s LWN series is a good place to
 	start~\cite{PaoloBonzini2021lockless1,PaoloBonzini2021lockless2}.
 \item	Finally, those using Java might be well-served by \ppl{Doug}{Lea}'s
 	textbooks~\cite{DougLea1997Textbook,Goetz2007Textbook}.
-- 
2.17.1


