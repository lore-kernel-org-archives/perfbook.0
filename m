Return-Path: <SRS0=vlOG=Z6=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AhBCc9NHZWuQbLd2MQkxjL0BeoY0v/GSOpC16rhoWvU=;
        b=fpJJub2ftCV6jusywGRU3NrMjLq7kzW1msKTw3ccdn9xVsfzEESV2/hzmzt6zuWbqj
         mHu4BDCDKqwxD192Vv5pGoUbhi9SDCtnKfp0DURTDodQMom3an6edIbgkRvosTPqGoTD
         2vx49J3ieIsFVF/l5RQ+7VZVtRgfKs4gUPe7slgBEEHk1yXr/wpYDWP4n52501k5VBTq
         NN8JV9VlaKmLHmVj08LUbSrgxzQJHT+Uj+TYtSbs3qavDphpUsgd6bF9Rl+8uOLf9+lR
         zcsOKXObhKvuSKcfZpZPTHcoPjR/R7/IMzRaA3JnlvP9vzHTWfK5BRAiD2yQ5agYpAHT
         5xYQ==
Subject: Re: [PATCH 0/2] Minor updates
References: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
 <20191207164308.GP2889@paulmck-ThinkPad-P72>
 <881ccdd8-1d59-649e-38d1-b65601262f0d@gmail.com>
 <20191208011550.GT2889@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8023af83-480f-00ab-7d96-7c975fd039c8@gmail.com>
Date: Mon, 9 Dec 2019 00:54:46 +0900
MIME-Version: 1.0
In-Reply-To: <20191208011550.GT2889@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 7 Dec 2019 17:15:50 -0800, Paul E. McKenney wrote:
> On Sun, Dec 08, 2019 at 08:41:45AM +0900, Akira Yokosawa wrote:
>> On Sat, 7 Dec 2019 08:43:08 -0800, Paul E. McKenney wrote:
>>> On Sat, Dec 07, 2019 at 01:05:17PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> This patch set fixes minor issues I noticed while reading your
>>>> recent updates.
>>>
>>> Queued and pushed, along with a fix to another of my typos, thank
>>> you very much!
>>>
>>>> Apart from the changes, I'd like you to mention in the answer to
>>>> Quick Quiz 9.43 that modern Intel CPUs don't execute x86_64
>>>> instructions directly, but decode them into uOPs (via MOP) and
>>>> keep them in a uOP cache [1].
>>>> So the execution cycle is not necessarily corresponds to instruction
>>>> count, but heavily depends on the behavior of the microarch, which
>>>> is not predictable without actually running the code. 
>>>>
>>>> [1]: https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(server)
>>>
>>> My thought is that I should review the "Hardware and it Habits" chapter,
>>> add this information if it is not already present, and then make the
>>> answer to this Quick Quiz refer back to that.  Does that seem reasonable?
>>
>> Yes, it sounds quite reasonable!
>>
>> (Skimming through the chapter...)
>>
>> So Section 3.1.1 lightly touches pipelining. Section 3.2 mostly discusses
>> memory sub-systems.
>>
>> Modern Intel architectures can be thought of as superscalar RISC
>> processors which emulate x86 ISA. The transformation of x86 instructions
>> into uOPs can be thought of as another layer of optimization
>> (sometimes "de-optimization" from compiler writer's POV) ;-).
>>
>> But deep-diving this topic would cost you another chapter/appendix.
>> I'm not sure if it's worthwhile for perfbook.
>> Maybe it would suffice to lightly touch the difficulty of
>> predicting execution cycles of particular instruction streams
>> on modern microprocessors (not limited to Intel's), and put
>> a few citations of textbooks/reference manuals.
> 
> What I did was to add a rough diagram and a paragraph or two of
> explanation to Section 3.1.1, then add a reference to that section
> in the Quick Quiz.

I'd like to see a couple of more keywords to be mentioned here other
than "pipeline".  "Super-scalar" is present in Glossary, but
"Superscalar" looks much common these days. Appended below is
a tentative patch I made to show you my idea. Please feel free
to edit as you'd like before applying it.

Another point I'd like to suggest.
Figure 9.23 and the following figures still show the result on
a 16 CPU system. Looks like it is difficult to make plots of 448-thread
system corresponding to them. Can you add info on the HW system
where those 16 CPU results were obtained in the beginning of
Section 9.5.4.2?

        Thanks, Akira

-------------8<-------------------
From 7e5c17a2e816a23bb12aa23f18ed96d5e820fc3a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 9 Dec 2019 00:23:59 +0900
Subject: [TENTATIVE PATCH] cpu/overview: Mention approaches other than 'pipelining'

Also remove "-" from "Super-scaler" in Glossary.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overview.tex   | 22 ++++++++++++++--------
 defer/rcuusage.tex |  2 +-
 glossary.tex       |  4 ++--
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/cpu/overview.tex b/cpu/overview.tex
index b80f47c1..191c1c68 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -42,11 +42,13 @@ In the early 1980s, the typical microprocessor fetched an instruction,
 decoded it, and executed it, typically taking \emph{at least} three
 clock cycles to complete one instruction before proceeding to the next.
 In contrast, the CPU of the late 1990s and of the 2000s execute
-many instructions simultaneously, using a deep \emph{pipeline} to control
+many instructions simultaneously, using a combination of approaches
+including \emph{pipeline}, \emph{superscalar}, \emph{out-of-order},
+and \emph{speculative} execution, to control
 the flow of instructions internally to the CPU.
 Some cores have more than one hardware thread, which is variously called
 \emph{simultaneous multithreading} (SMT) or \emph{hyperthreading}
-(HT)~\cite{JFennel1973SMT}.
+(HT)~\cite{JFennel1973SMT},
 each of which appears as
 an independent CPU to software, at least from a functional viewpoint.
 These modern hardware features can greatly improve performance, as
@@ -96,14 +98,17 @@ Figure~\ref{fig:cpu:CPU Meets a Pipeline Flush}.
 \end{figure}
 
 This gets even worse in the increasingly common case of hyperthreading
-(or SMT, if you prefer).
+(or SMT, if you prefer).\footnote{
+	Superscalar is involved in most cases, too.
+}
 In this case, all the hardware threads sharing a core also share that
 core's resources, including registers, cache, execution units, and so on.
-The instruction streams are decoded into micro-operations, and use of the
-shared execution units and the hundreds of hardware registers is coordinated
+The instruction streams might be decoded into micro-operations,
+and use of the shared execution units and the hundreds of hardware
+registers can be coordinated
 by a micro-operation scheduler.
-A rough diagram of a two-threaded core is shown in
-\Cref{fig:cpu:Rough View of Modern Micro-Architecture},
+A rough diagram of such a two-threaded core is shown in
+\cref{fig:cpu:Rough View of Modern Micro-Architecture},
 and more accurate (and thus more complex) diagrams are available in
 textbooks and scholarly papers.\footnote{
 	Here is one example for a late-2010s Intel CPU:
@@ -123,7 +128,8 @@ of clairvoyance.
 In particular, adding an instruction to a tight loop can sometimes
 actually speed up execution, counterintuitive though that might be.
 
-Unfortunately, pipeline flushes are not the only hazards in the obstacle
+Unfortunately, pipeline flushes and shared-resource contentions
+are not the only hazards in the obstacle
 course that modern CPUs must run.
 The next section covers the hazards of referencing memory.
 
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 7fe633c3..fa04ddb6 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -139,7 +139,7 @@ that of the ideal synchronization-free workload.
 	are long gone.
 
 	But those of you who read
-	\Cref{sec:cpu:Pipelined CPUs}
+	\cref{sec:cpu:Pipelined CPUs}
 	carefully already knew all of this!
 
 	These counter-intuitive results of course means that any
diff --git a/glossary.tex b/glossary.tex
index c10ffe4e..4a3aa796 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -382,11 +382,11 @@
 	as well as its cache so as to ensure that the software sees
 	the memory operations performed by this CPU as if they
 	were carried out in program order.
-\item[Super-Scalar CPU:]
+\item[Superscalar CPU:]
 	A scalar (non-vector) CPU capable of executing multiple instructions
 	concurrently.
 	This is a step up from a pipelined CPU that executes multiple
-	instructions in an assembly-line fashion---in a super-scalar
+	instructions in an assembly-line fashion---in a superscalar
 	CPU, each stage of the pipeline would be capable of handling
 	more than one instruction.
 	For example, if the conditions were exactly right,
-- 
2.17.1

