Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229646AbhCTE1w (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 20 Mar 2021 00:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616214472;
        bh=l3zMj4bXh7WxP9Z1WRnWCmXfa+DB2AiEcSlrbJS0nr8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jjElrzUVoicop2rYwojLLmNLT/M5aIeAAnUoNE8siE9h70JlmQFWaSt7lzq2LHLGC
         43uzzeMEjKKE/PlPVh6o2LvZCksixTI9aZmMkbt6DAfpSLyeXYnhjDHnc7LrvUkiXC
         7cQbQnj3+ehY+nqOmGgE8/R87Ab0jnZzaCrEwS6b2qgLb62NhO7DiQsuDQMt8UmQmV
         DQWwXmt4GCmD8rJtuEa9AaOdwN8JZbE8uxCNGSdO4zmRD2N1pVcPkaCCZyyCGrg5gZ
         3sTN8K0E7wv/nvdwySqXxBe96S3YjUKps2ziBr3VFBIggRenxnMIRIUXuIQLk/f16+
         /skUFZ29/BR/Q==
Date: Fri, 19 Mar 2021 21:27:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Possible update candidate in whymb
Message-ID: <20210320042751.GZ2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <aaa92b9c-2d25-df1c-8229-64b3fb06ab53@gmail.com>
 <20210320041117.GY2696@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320041117.GY2696@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 19, 2021 at 09:11:17PM -0700, Paul E. McKenney wrote:
> On Sat, Mar 20, 2021 at 11:23:36AM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > In Appendix C, which you have not updated for a while,
> > there is a statement made in commit bb869fd89bfd ("Add
> > caution about cache coherence and I/O for new-to-SMP
> > architectures") more than a decade ago, which might
> > be an update candidate.
> > 
> > Thoughts?
> > 
> >         Thanks, Akira
> > 
> > ------
> > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > index 868758a4..284d48f4 100644
> > --- a/appendix/whymb/whymemorybarriers.tex
> > +++ b/appendix/whymb/whymemorybarriers.tex
> > @@ -1639,7 +1639,7 @@ future such problems:
> >         It is my painful duty to inform you that as embedded systems
> >         move to multicore architectures, we will no doubt see a fair
> >         number of such problems arise.
> > -       Hopefully these problems will clear up by the year 2015.
> > +       Hopefully these problems will clear up by the year 202x.
> 
> Good catch!  I queued the commit shown below.

And while on the topic...

							Thanx, Paul

------------------------------------------------------------------------

commit 5a9744a1c0ff1857d954af5558ab6b585aa8f195
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Fri Mar 19 21:26:14 2021 -0700

    treewide: Address outdated commentary
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 790a242..600f2d2 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -597,7 +597,7 @@ is quite similar.
 	suffer (albeit hopefully rarely) from whatever concurrency
 	limitations that these locking solutions suffer from.
 
-	Therefore, as of last 2017, all practical solutions to the
+	Therefore, as of 2021, all practical solutions to the
 	concurrent double-ended queue problem fail to provide full
 	concurrency in at least some circumstances, including the
 	compound double-ended queue.
diff --git a/advsync/rt.tex b/advsync/rt.tex
index d66ada5..94469f0 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1951,8 +1951,8 @@ on \clnrefrange{upd:b}{upd:e}.
 	forbidden in many safety-critical situations, what is with
 	the call to \co{malloc()}???
 }\QuickQuizAnswerB{
-	In early 2016, situations forbidding runtime memory were
-	also not at all interested in multithreaded computing.
+	In early 2016, projects forbidding runtime memory allocation
+	were also not at all interested in multithreaded computing.
 	So the runtime memory allocation is not an additional
 	obstacle to safety criticality.
 
diff --git a/count/count.tex b/count/count.tex
index 74f0b56..cafbcaf 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -3014,7 +3014,7 @@ operator will not work for you.
 	In the C++ language, you might well be able to use \co{++}
 	on a 1,000-digit number, assuming that you had access to a
 	class implementing such numbers.
-	But as of 2010, the C language does not permit operator overloading.
+	But as of 2021, the C language does not permit operator overloading.
 }\QuickQuizEnd
 
 This problem is not specific to arithmetic.
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index a3345e5..663863d 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -126,8 +126,8 @@ The weaknesses of the herd tool are similar to those of PPCMEM, which
 were described in
 Section~\ref{sec:formal:PPCMEM Discussion}.
 There are some obscure (but very real) cases for which the PPCMEM and
-herd tools disagree, and as of late 2014 resolving these disagreements
-was ongoing.
+herd tools disagree, and as of 2021 many but not all of these disagreements
+was resolved.
 
 It would be helpful if the litmus tests could be written in C
 (as in Listing~\ref{lst:formal:Meaning of PPCMEM Litmus Test})
@@ -425,7 +425,7 @@ in the \co{herd} output.
 }\QuickQuizAnswerE{
 	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	That is an excellent question.
-	As of late 2018, the answer is ``no one knows''.
+	As of late 2021, the answer is ``no one knows''.
 	Much depends on the semantics of \ARMv8's conditional-move
 	instruction.
 	While awaiting clarity on these semantics, \co{smp_store_release()}
diff --git a/future/formalregress.tex b/future/formalregress.tex
index 75652c5..6898b91 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -663,7 +663,7 @@ so they are all yellow with question marks.
 	Perhaps in geologic time.
 
 	But if your code is running on 20~billion systems,
-	like the Linux kernel was said to in late 2017,
+	like the Linux kernel was said to be by late 2017,
 	Murphy can be a real jerk!
 	Everything that can go wrong, will, and it can go wrong
 	really quickly!!!
diff --git a/future/htm.tex b/future/htm.tex
index 84ea5ec..cf222e5 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -814,7 +814,7 @@ the cache misses associated with the lock variable, which has resulted
 in tens of percent performance increases in large real-world software
 systems as of early 2015.
 We can therefore expect to see substantial use of this technique on
-hardware supporting it.
+hardware providing reliable support for it.
 
 \QuickQuiz{
 	So a bunch of people set out to supplant locking, and they
diff --git a/howto/howto.tex b/howto/howto.tex
index 03bc4d6..8f06d3f 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -248,8 +248,7 @@ Here are a few possible strategies:
 	of understanding.
 \end{enumerate}
 
-Note that as of mid-2016 the quick quizzes are hyperlinked
-to the answers and vice versa.
+Note that the quick quizzes are hyperlinked to the answers and vice versa.
 Click either the ``Quick Quiz'' heading or the small black square
 to move to the beginning of the answer.
 From the answer, click on the heading or the small black square to
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c2076d1..1f667e0 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1077,7 +1077,7 @@ intrinsic \apialtg{__atomic_store_n(&x, v, __ATOMIC_RELAXED)}{__atomic_store_n()
 \QuickQuiz{
 	What happened to \apikh{ACCESS_ONCE()}?
 }\QuickQuizAnswer{
-	As of early 2018, the Linux kernel's \apikh{ACCESS_ONCE()} is being
+	In the 2018 v4.15 release, the Linux kernel's \apikh{ACCESS_ONCE()} was
 	replaced by \apik{READ_ONCE()} and \apik{WRITE_ONCE()} for reads and
 	writes, respectively~\cite{JonCorbet2012ACCESS:ONCE,
 	JonathanCorbet2014ACCESS:ONCEcompilerBugs,
