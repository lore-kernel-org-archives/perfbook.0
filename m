Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgCOBeO (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 14 Mar 2020 21:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584227265;
        bh=Ahrl2wBozKyIr5oiWvSscoQY+VxnMQjk1DhfC0uAh/s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=EBIzwaiAVe1g+NXbtCJDhbHwSlZ0DI8VPj5SO7ftckGQsZtIxI6L5vxrtQST5JdLI
         asu2RxAFBDYs/KSM2symATodLKL9La5BLebsFg/thZsNcY1GZuZr6aGBy4YlwPhH80
         52vWIBJJVPg+oaZgU/2nxtB5x6sMRwn925cphr1g=
Date: Sat, 14 Mar 2020 16:07:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/4] Use 'Arm' as text trademark of Arm architecture
Message-ID: <20200314230745.GQ3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 15, 2020 at 12:14:01AM +0900, Akira Yokosawa wrote:
> >From d90bfe96b76995a125c9ba0f8461d5f0acc138ec Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 14 Mar 2020 00:06:33 +0900
> Subject: [PATCH 1/4] Use 'Arm' as text trademark of Arm architecture
> 
> Substitute "Arm" for "ARM" to respect the decision of Arm Limited.
> Instead of direct substitutions, define macros \ARM and \ARMv.
> This should help us easily catch up in case Arm changes its mind.
> 
> Note that as far as an argument of a macro is a single digit,
> enclosing it by "{}" is not necessary.
> For example, \ARMv{8} CPU" and "\ARMv8 CPU" will generate the same
> result: "Armv8".
> 
> Some of "ARM" in ppcmem.tex are kept unchanged as the PPCMEM site
> stilluses "ARM" as its interface choice.
> 
> Also update the legal page to mention trademarks of Arm, MIPS,
> and SPARC.  Update the notice on Intel trademarks as well.
> "x386" is not a trademark of Intel anymore.
> 
> While we are here, get rid of \mytexttrademark and \mytextregistered
> as they have been empty ever since they were introduced in commit
> eecdeac7367c ("Remove trademark and registered symbols in text").
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed all four, thank you!

							Thanx, Paul

> ---
>  SMPdesign/beyond.tex      |  6 ++--
>  datastruct/datastruct.tex |  5 ++-
>  formal/axiomatic.tex      |  2 +-
>  formal/ppcmem.tex         | 22 ++++++-------
>  future/formalregress.tex  |  2 +-
>  legal.tex                 | 12 +++++--
>  memorder/memorder.tex     | 66 +++++++++++++++++++--------------------
>  perfbook.tex              |  6 ++--
>  8 files changed, 61 insertions(+), 60 deletions(-)
> 
> diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
> index 12e9237a..2eac3150 100644
> --- a/SMPdesign/beyond.tex
> +++ b/SMPdesign/beyond.tex
> @@ -218,8 +218,7 @@ attempts to record cells in the \co{->visited[]} array.
>  \end{fcvref}
>  
>  This approach does provide significant speedups on a dual-CPU
> -Lenovo\mytexttrademark\ W500
> -running at 2.53\,GHz, as shown in
> +Lenovo W500 running at 2.53\,GHz, as shown in
>  Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ and PWQ},
>  which shows the cumulative distribution functions (CDFs) for the solution
>  times of the two algorithms, based on the solution of 500 different square
> @@ -602,8 +601,7 @@ the solution line.
>  This disappointing performance compared to results in
>  Figure~\ref{fig:SMPdesign:Varying Maze Size vs. COPART}
>  is due to the less-tightly integrated hardware available in the
> -larger and older Xeon\mytextregistered\
> -system running at 2.66\,GHz.
> +larger and older Xeon system running at 2.66\,GHz.
>  
>  \subsection{Future Directions and Conclusions}
>  \label{sec:SMPdesign:Future Directions and Conclusions}
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index e21952bc..ad9a80f2 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -319,9 +319,8 @@ The \co{hashtab_free()} function on
>  \end{figure}
>  
>  The performance results for an eight-CPU 2\,GHz
> -Intel\mytextregistered\
> -Xeon\mytextregistered\
> -system using a bucket-locked hash table with 1024 buckets are shown in
> +Intel Xeon system using a bucket-locked hash table
> +with 1024 buckets are shown in
>  Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo}.
>  The performance does scale nearly linearly, but is not much more than half
>  of the ideal performance level, even at only eight CPUs.
> diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
> index 10bb33e9..26e3f1ac 100644
> --- a/formal/axiomatic.tex
> +++ b/formal/axiomatic.tex
> @@ -419,7 +419,7 @@ in the \co{herd} output.
>  	\begin{fcvref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
>  	That is an excellent question.
>  	As of late 2018, the answer is ``no one knows''.
> -	Much depends on the semantics of ARMv8's conditional-move
> +	Much depends on the semantics of \ARMv8's conditional-move
>  	instruction.
>  	While awaiting clarity on these semantics, \co{smp_store_release()}
>  	is the safe choice.
> diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
> index 184cdd0d..d88e16c2 100644
> --- a/formal/ppcmem.tex
> +++ b/formal/ppcmem.tex
> @@ -29,9 +29,9 @@ Peter Sewell and Susmit Sarkar at the University of Cambridge, Luc
>  Maranget, Francesco Zappa Nardelli, and Pankaj Pawan at INRIA, and Jade
>  Alglave at Oxford University, in cooperation with Derek Williams of
>  IBM~\cite{JadeAlglave2011ppcmem}.
> -This group formalized the memory models of Power, ARM, x86, as well
> +This group formalized the memory models of Power, \ARM, x86, as well
>  as that of the C/C++11 standard~\cite{PeteBecker2011N3242}, and
> -produced the PPCMEM tool based on the Power and ARM formalizations.
> +produced the PPCMEM tool based on the Power and \ARM\ formalizations.
>  
>  \QuickQuiz{}
>  	But x86 has strong memory ordering!  Why would you need to
> @@ -60,7 +60,7 @@ discusses the implications.
>  
>  An example PowerPC litmus test for PPCMEM is shown in
>  \cref{lst:formal:PPCMEM Litmus Test}.
> -The ARM interface works exactly the same way, but with ARM instructions
> +The ARM interface works exactly the same way, but with \ARM\ instructions
>  substituted for the Power instructions and with the initial ``PPC''
>  replaced by ``ARM''. You can select the ARM interface by clicking on
>  ``Change to ARM Model'' at the web page called out above.
> @@ -164,7 +164,7 @@ runs tests on actual hardware. Perhaps more importantly, a large number of
>  pre-existing litmus tests are available with the online tool (available
>  via the ``Select ARM Test'' and ``Select POWER Test'' buttons). It is
>  quite likely that one of these pre-existing litmus tests will answer
> -your Power or ARM memory-ordering question.
> +your Power or \ARM\ memory-ordering question.
>  
>  \subsection{What Does This Litmus Test Mean?}
>  \label{sec:formal:What Does This Litmus Test Mean?}
> @@ -173,8 +173,8 @@ P0's \clnref{reginit,stw} are equivalent to the C statement \co{x=1}
>  because \clnref{init:0} defines P0's register \co{r2} to be the address
>  of \co{x}. P0's \clnref{P0lwarx,P0stwcx} are the mnemonics for
>  load-linked (``load register
> -exclusive'' in ARM parlance and ``load reserve'' in Power parlance)
> -and store-conditional (``store register exclusive'' in ARM parlance),
> +exclusive'' in \ARM\ parlance and ``load reserve'' in Power parlance)
> +and store-conditional (``store register exclusive'' in \ARM\ parlance),
>  respectively. When these are used together, they form an atomic
>  instruction sequence, roughly similar to the compare-and-swap sequences
>  exemplified by the x86 \co{lock;cmpxchg} instruction. Moving to a higher
> @@ -319,9 +319,9 @@ Therefore, the model predicts that the offending execution sequence
>  cannot happen.
>  
>  \QuickQuiz{}
> -	Does the ARM Linux kernel have a similar bug?
> +	Does the \ARM\ Linux kernel have a similar bug?
>  \QuickQuizAnswer{
> -	ARM does not have this particular bug because that it places
> +	\ARM\ does not have this particular bug because it places
>  	\co{smp_mb()} before and after the \co{atomic_add_return()}
>  	function's assembly-language implementation.
>  	PowerPC no longer has this bug; it has long since been
> @@ -363,12 +363,12 @@ cannot happen.
>  \label{sec:formal:PPCMEM Discussion}
>  
>  These tools promise to be of great help to people working on low-level
> -parallel primitives that run on ARM and on Power. These tools do have
> +parallel primitives that run on \ARM\ and on Power. These tools do have
>  some intrinsic limitations:
>  
>  \begin{enumerate}
>  \item	These tools are research prototypes, and as such are unsupported.
> -\item	These tools do not constitute official statements by IBM or ARM
> +\item	These tools do not constitute official statements by IBM or \ARM\
>  	on their respective CPU architectures. For example, both
>  	corporations reserve the right to report a bug at any time against
>  	any version of any of these tools. These tools are therefore not a
> @@ -383,7 +383,7 @@ some intrinsic limitations:
>  	may vary. In particular, the tool handles only word-sized accesses
>  	(32 bits), and the words accessed must be properly aligned. In
>  	addition, the tool does not handle some of the weaker variants
> -	of the ARM memory-barrier instructions, nor does it handle arithmetic.
> +	of the \ARM\ memory-barrier instructions, nor does it handle arithmetic.
>  \item	The tools are restricted to small loop-free code fragments
>  	running on small numbers of threads. Larger examples result
>  	in state-space explosion, just as with similar tools such as
> diff --git a/future/formalregress.tex b/future/formalregress.tex
> index 9bfcdd2d..1677c722 100644
> --- a/future/formalregress.tex
> +++ b/future/formalregress.tex
> @@ -125,7 +125,7 @@ good match for modern computer systems, as was seen in
>  \cref{chp:Advanced Synchronization: Memory Ordering}.
>  In contrast, one of the great strengths of PPCMEM and \co{herd}
>  is their detailed modeling of various CPU families memory models,
> -including x86, ARM, Power, and, in the case of \co{herd},
> +including x86, \ARM, Power, and, in the case of \co{herd},
>  even a Linux-kernel memory model~\cite{Alglave:2018:FSC:3173162.3177156},
>  which has been accepted into version 4.17 of
>  the Linux kernel.
> diff --git a/legal.tex b/legal.tex
> index 21b9263f..d4648c7f 100644
> --- a/legal.tex
> +++ b/legal.tex
> @@ -13,8 +13,16 @@ Trademarks:
>  	of International Business Machines Corporation in the United
>  	States, other countries, or both.
>  \item	Linux is a registered trademark of Linus Torvalds.
> -\item	i386 is a trademark of Intel Corporation or its subsidiaries
> -	in the United States, other countries, or both.
> +\item	Intel, Itanium, Intel Core, and Intel Xeon are trademarks
> +	of Intel Corporation or its subsidiaries in the United States,
> +	other countries, or both.
> +\item	Arm is a registered trademark of Arm Limited (or its subsidiaries)
> +	in the US and/or elsewhere.
> +\item	MIPS is a registered trademark of Wave, Inc. in the United States
> +	and other countries.
> +\item	SPARC is a registered trademark of SPARC International, Inc.
> +	Products bearing SPARC trademarks are based on an architecture
> +	developed by Sun Microsystems, Inc.
>  \item	Other company, product, and service names may be trademarks or
>  	service marks of such companies.
>  \end{itemize}
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 01355730..63f1474b 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -330,7 +330,7 @@ synchronization primitives (such as locking and RCU)
>  that are responsible for maintaining the illusion of ordering through use of
>  \emph{memory barriers} (for example, \co{smp_mb()} in the Linux kernel).
>  These memory barriers can be explicit instructions, as they are on
> -ARM, \Power{}, Itanium, and Alpha, or they can be implied by other instructions,
> +\ARM, \Power{}, Itanium, and Alpha, or they can be implied by other instructions,
>  as they often are on x86.
>  Since these standard synchronization primitives preserve the illusion of
>  ordering, your path of least resistance is to simply use these primitives,
> @@ -1332,7 +1332,7 @@ in pre-v4.15 Linux kernels.
>  	To sum up, current platforms either respect address dependencies
>  	implicitly, as is the case for TSO platforms (x86, mainframe,
>  	SPARC,~...), have hardware tracking for address dependencies
> -	(ARM, PowerPC, MIPS,~...), have the required memory barriers
> +	(\ARM, PowerPC, MIPS,~...), have the required memory barriers
>  	supplied by \co{READ_ONCE()} (DEC Alpha in Linux kernel v4.15 and
>  	later), or require the memory barriers supplied by
>  	\co{rcu_dereference()} (DEC Alpha in Linux kernel v4.14 and earlier).
> @@ -1582,7 +1582,7 @@ instead provided the slightly weaker
>  \emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
>  which excludes the CPU doing a given store from the requirement that all
>  CPUs agree on the order of all stores.\footnote{
> -	As of late 2018, ARMv8 and x86 provide other-multicopy atomicity,
> +	As of late 2018, \ARMv8 and x86 provide other-multicopy atomicity,
>  	IBM mainframe provides fully multicopy atomicity, and PPC does
>  	not provide multicopy atomicity at all. More detail is shown in
>  	\cref{tab:memorder:Summary of Memory Ordering}.}
> @@ -2071,7 +2071,7 @@ This should not come as a surprise to anyone who carefully examined
>  	\cref{lst:memorder:2+2W Litmus Test With Write Barriers}
>  	(\path{C-2+2W+o-wmb-o+o-wmb-o.litmus}),
>  	research shows that the cycle is prohibited, even in weakly
> -	ordered systems such as ARM and Power~\cite{test6-pdf}.
> +	ordered systems such as \ARM\ and Power~\cite{test6-pdf}.
>  	Given that, are store-to-store really \emph{always}
>  	counter-temporal???
>  \QuickQuizAnswer{
> @@ -3720,8 +3720,8 @@ to what can be done based on individual memory accesses.
>  	\cmidrule{3-11}
>  	\multicolumn{2}{c}{\raisebox{.5ex}{Property}}
>  	& \cpufml{Alpha}
> -	& \cpufml{ARMv7-A/R}
> -	& \cpufml{ARMv8}
> +	& \cpufml{\ARMv7-A/R}
> +	& \cpufml{\ARMv8}
>  	& \cpufml{Itanium}
>  	& \cpufml{MIPS}
>  	& \cpufml{\Power{}}
> @@ -4041,7 +4041,7 @@ in Alpha's heyday.
>  One could place an \co{smp_rmb()} primitive
>  between the pointer fetch and dereference in order to force Alpha
>  to order the pointer fetch with the later dependent load.
> -However, this imposes unneeded overhead on systems (such as ARM,
> +However, this imposes unneeded overhead on systems (such as \ARM,
>  Itanium, PPC, and SPARC) that respect data dependencies on the read side.
>  A \co{smp_read_barrier_depends()} primitive has therefore been added to the
>  Linux kernel to eliminate overhead on these systems, and was also added
> @@ -4150,13 +4150,13 @@ an \co{smp_mb()} rather than a no-op.
>  
>  For more on Alpha, see its reference manual~\cite{ALPHA2002}.
>  
> -\subsection{ARMv7-A/R}
> +\subsection{\ARMv7-A/R}
>  \label{sec:memorder:ARMv7-A/R}
>  
> -The ARM family of CPUs is extremely popular in embedded applications,
> +The \ARM\ family of CPUs is extremely popular in embedded applications,
>  particularly for power-constrained applications such as cellphones.
>  Its memory model is similar to that of \Power{}
> -(see \cref{sec:memorder:POWER / PowerPC}), but ARM uses a
> +(see \cref{sec:memorder:POWER / PowerPC}), but \ARM\ uses a
>  different set of memory-barrier instructions~\cite{ARMv7A:2010}:
>  
>  \begin{description}
> @@ -4166,7 +4166,7 @@ different set of memory-barrier instructions~\cite{ARMv7A:2010}:
>  	The ``type'' of operations can be all operations or can be
>  	restricted to only writes (similar to the Alpha \co{wmb}
>  	and the \Power{} \co{eieio} instructions).
> -	In addition, ARM allows cache coherence to have one of three
> +	In addition, \ARM\ allows cache coherence to have one of three
>  	scopes: single processor, a subset of the processors
>  	(``inner'') and global (``outer'').
>  \item	[\tco{DSB}] (data synchronization barrier) causes the specified
> @@ -4175,7 +4175,7 @@ different set of memory-barrier instructions~\cite{ARMv7A:2010}:
>  	The ``type'' of operations is the same as that of \co{DMB}.
>  	The \co{DSB} instruction was called \co{DWB} (drain write buffer
>  	or data write barrier, your choice) in early versions of the
> -	ARM architecture.
> +	\ARM\ architecture.
>  \item	[\tco{ISB}] (instruction synchronization barrier) flushes the CPU
>  	pipeline, so that all instructions following the \co{ISB}
>  	are fetched only after the \co{ISB} completes.
> @@ -4194,7 +4194,7 @@ stronger than
>  \cref{sec:memorder:Cumulativity}'s
>  variant of cumulativity.
>  
> -ARM also implements control dependencies, so that if a conditional
> +\ARM\ also implements control dependencies, so that if a conditional
>  branch depends on a load, then any store executed after that conditional
>  branch will be ordered after the load.
>  However, loads following the conditional branch will \emph{not}
> @@ -4218,7 +4218,7 @@ r3 = z;			\lnlbl[z2]
>  In this example, load-store control dependency ordering causes
>  the load from \co{x} on \clnref{x} to be ordered before the store to
>  \co{y} on \clnref{y}.
> -However, ARM does not respect load-load control dependencies, so that
> +However, \ARM\ does not respect load-load control dependencies, so that
>  the load on \clnref{x} might well happen \emph{after} the
>  load on \clnref{z1}.
>  On the other hand, the combination of the conditional branch on \clnref{if}
> @@ -4228,7 +4228,7 @@ Note that inserting an additional \co{ISB} instruction somewhere between
>  \clnref{nop,y} would enforce ordering between \clnref{x,z1}.
>  \end{fcvref}
>  
> -\subsection{ARMv8}
> +\subsection{\ARMv8}
>  
>  \begin{figure}[tb]
>  \centering
> @@ -4237,29 +4237,29 @@ Note that inserting an additional \co{ISB} instruction somewhere between
>  \ContributedBy{Figure}{fig:memorder:Half Memory Barrier}{Melissa Brossard}
>  \end{figure}
>  
> -ARMv8 is ARM's new CPU family~\cite{ARMv8A:2017}
> +\ARMv8 is \ARM's new CPU family~\cite{ARMv8A:2017}
>  which includes 64-bit capabilities,
>  in contrast to their 32-bit-only CPU described in
>  \cref{sec:memorder:ARMv7-A/R}.
> -ARMv8's memory model closely resembles its ARMv7 counterpart,
> +\ARMv8's memory model closely resembles its \ARMv7 counterpart,
>  but adds load-acquire (\co{LDLARB}, \co{LDLARH}, and \co{LDLAR})
>  and store-release (\co{STLLRB}, \co{STLLRH}, and \co{STLLR})
>  instructions.
>  These instructions act as ``half memory barriers'', so that
> -ARMv8 CPUs can reorder previous accesses with a later \co{LDLAR}
> +\ARMv8 CPUs can reorder previous accesses with a later \co{LDLAR}
>  instruction, but are prohibited from reordering an earlier \co{LDLAR}
>  instruction with later accesses, as fancifully depicted in
>  \cref{fig:memorder:Half Memory Barrier}.
> -Similarly, ARMv8 CPUs can reorder an earlier \co{STLLR} instruction with
> +Similarly, \ARMv8 CPUs can reorder an earlier \co{STLLR} instruction with
>  a subsequent access, but are prohibited from reordering
>  previous accesses with a later \co{STLLR} instruction.
>  As one might expect, this means that these instructions directly support
>  the C11 notion of load-acquire and store-release.
>  
> -However, ARMv8 goes well beyond the C11 memory model by mandating that
> +However, \ARMv8 goes well beyond the C11 memory model by mandating that
>  the combination of a store-release and load-acquire act as a full
>  barrier under many circumstances.
> -For example, in ARMv8, given a store followed by a store-release followed
> +For example, in \ARMv8, given a store followed by a store-release followed
>  a load-acquire followed by a load, all to different variables and all from
>  a single CPU, all CPUs
>  would agree that the initial store preceded the final load.
> @@ -4267,12 +4267,12 @@ Interestingly enough, most TSO architectures (including x86 and the
>  mainframe) do not make this guarantee, as the two loads could be
>  reordered before the two stores.
>  
> -ARMv8 is one of only two architectures that needs the
> +\ARMv8 is one of only two architectures that needs the
>  \co{smp_mb__after_spinlock()} primitive to be a full barrier,
>  due to its relatively weak lock-acquisition implementation in
>  the Linux kernel.
>  
> -ARMv8 also has the distinction of being the first CPU whose vendor publicly
> +\ARMv8 also has the distinction of being the first CPU whose vendor publicly
>  defined its memory ordering with an executable formal model~\cite{ARMv8A:2017}.
>  
>  \subsection{Itanium}
> @@ -4287,7 +4287,7 @@ instructions~\cite{IntelItanium02v3}.
>  The {\tt acq} modifier prevents subsequent memory-reference instructions
>  from being reordered before the {\tt acq}, but permits
>  prior memory-reference instructions to be reordered after the {\tt acq},
> -similar to the ARMv8 load-acquire instructions.
> +similar to the \ARMv8 load-acquire instructions.
>  Similarly, the {\tt rel} modifier prevents prior memory-reference
>  instructions from being reordered after the {\tt rel}, but allows
>  subsequent memory-reference instructions to be reordered before
> @@ -4329,12 +4329,12 @@ CPU, including those to the same variable.
>  \subsection{MIPS}
>  
>  The MIPS memory model~\cite[page~479]{MIPSvII-A-2017}
> -appears to resemble that of ARM, Itanium, and \Power{},
> +appears to resemble that of \ARM, Itanium, and \Power{},
>  being weakly ordered by default, but respecting dependencies.
>  MIPS has a wide variety of memory-barrier instructions, but ties them
>  not to hardware considerations, but rather to the use cases provided
>  by the Linux kernel and the C++11 standard~\cite{RichardSmith2015N4527}
> -in a manner similar to the ARMv8 additions:
> +in a manner similar to the \ARMv8 additions:
>  
>  \begin{description}[style=nextline]
>  \item[\tco{SYNC}]
> @@ -4377,7 +4377,7 @@ in a manner similar to the ARMv8 additions:
>  
>  Informal discussions with MIPS architects indicates that MIPS has a
>  definition of transitivity or cumulativity similar to that of
> -ARM and \Power{}.
> +\ARM\ and \Power{}.
>  However, it appears that different MIPS implementations can have
>  different memory-ordering properties, so it is important to consult
>  the documentation for the specific MIPS implementation you are using.
> @@ -4385,8 +4385,7 @@ the documentation for the specific MIPS implementation you are using.
>  \subsection{\Power{} / PowerPC}
>  \label{sec:memorder:POWER / PowerPC}
>  
> -The \Power{} and PowerPC\mytextregistered\
> -CPU families have a wide variety of memory-barrier
> +The \Power{} and PowerPC CPU families have a wide variety of memory-barrier
>  instructions~\cite{PowerPC94,MichaelLyons05a}:
>  \begin{description}
>  \item	[\tco{sync}] causes all preceding operations to {\em appear to have}
> @@ -4448,11 +4447,11 @@ fragment itself saw.
>  Much more detail is available from
>  McKenney and Silvera~\cite{PaulEMcKenneyN2745r2009}.
>  
> -\Power{} respects control dependencies in much the same way that ARM
> +\Power{} respects control dependencies in much the same way that \ARM\
>  does, with the exception that the \Power{} \co{isync} instruction
> -is substituted for the ARM \co{ISB} instruction.
> +is substituted for the \ARM\ \co{ISB} instruction.
>  
> -Like ARMv8, \Power{} requires \co{smp_mb__after_spinlock()} to be
> +Like \ARMv8, \Power{} requires \co{smp_mb__after_spinlock()} to be
>  a full memory barrier.
>  In addition, \Power{} is the only architecture requiring
>  \co{smp_mb__after_unlock_lock()} to be a full memory barrier.
> @@ -4595,8 +4594,7 @@ it~\cite[Section 8.1.3]{Intel64IA32v3A2011}.
>  
>  \subsection{z Systems}
>  
> -The z~Systems machines make up the IBM\mytexttrademark\
> -mainframe family, previously
> +The z~Systems machines make up the IBM mainframe family, previously
>  known as the 360, 370, 390 and zSeries~\cite{IBMzSeries04a}.
>  Parallelism came late to z~Systems, but given that these mainframes first
>  shipped in the mid 1960s, this is not saying much.
> diff --git a/perfbook.tex b/perfbook.tex
> index a5ac180b..f5b57058 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -269,16 +269,14 @@
>  \DeclareRobustCommand{\euler}{\ensuremath{\mathrm{e}}}
>  \DeclareRobustCommand{\O}[1]{\ensuremath{\mathcal{O}\left(#1\right)}}
>  \newcommand{\Power}[1]{POWER#1}
> +\newcommand{\ARM}[1]{Arm{#1}}
> +\newcommand{\ARMv}[1]{Armv{#1}}
>  \newcommand{\GNUC}{GNU~C}
>  \newcommand{\GCC}{GCC}
>  %\newcommand{\GCC}{\co{gcc}} % For those who prefer "gcc"
>  \newcommand{\IRQ}{IRQ}
>  %\newcommand{\IRQ}{irq}      % For those who prefer "irq"
>  \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
> -\newcommand{\mytexttrademark}{}
> -\newcommand{\mytextregistered}{}
> -%\newcommand{\mytexttrademark}{\textsuperscript\texttrademark}
> -%\newcommand{\mytextregistered}{\textsuperscript\textregistered}
>  
>  \newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}
>  
> -- 
> 2.17.1
> 
