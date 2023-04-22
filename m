Return-Path: <SRS0=vYjJ=AN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682142991; x=1684734991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLhBQqpfDsAvrg0/fNvj9WMS3O808423puajqeobfCc=;
        b=modI+5KkAGwlerUI6KYAhoYVj1IedA4s/CAgoMmLZh3nzdv0lqU7KlN7l0ls4oAA02
         Uf8FTDXjcA0hOJ0snVvOV1i02RHo8gtaZerwAm0jBCka4Hg/HEavCf2cPxnQ91W4VOBB
         xn68vIBCxZAAVGgQazXfzLfs8et9FiWyUNoE4uuIjZyMN/QoOt3LbPiYNXyue8f8VkGO
         f6h+CDLl7ZqJeon4Cl9cqIiELKzZc0gTBxjmsx5aSu2bQD8+lB/ffnZYGS9hxhjWfr6q
         Vr6eFC7JApgGAslsiqHmVAjRCw0s7JF7RytmmVVkL9FUDkcVlstnCeo0HTyIlwPFoCc4
         X7/A==
Message-ID: <07f95142-2631-e0aa-f5a3-dbf669d5fcec@gmail.com>
Date: Sat, 22 Apr 2023 14:56:26 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] memorder: Use desctiption list for PowerPC
 terminology
Content-Language: en-US
References: <23dea7ea-6dda-bfdc-c0b5-50e0e841677b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <23dea7ea-6dda-bfdc-c0b5-50e0e841677b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Using \paragraph under subsection level breaks normal document
structure.

A description list should be a better fit for the purpose of
presenting PowerPC terminology.

As a bonus, this change makes the end of the list of terminology
becomes obvious to your eyes.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I think this is what you wanted do.
I changed the periods at the end of terms into colons.
Do they look good to you?

        Thanks, Akira
--
 memorder/memorder.tex | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 7d6153a1a67e..cbd772e4fde4 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2571,15 +2571,17 @@ later \co{lwz} from \co{x} must precede \co{P0()}'s \co{stw} to \co{x}.
 Seeing how this can happen requires a rough understanding of the
 following PowerPC terminology.
 
-\paragraph{Instruction commit.}
+\begin{description}[style=nextline]
+
+\item[Instruction commit:]
 This can be thought of as the execution of that instruction as opposed
 to the memory-system consequences of having executed that instruction.
 
-\paragraph{Write reaching coherence point.}
+\item[Write reaching coherence point:]
 This can be thought of as the value written being deposited into the
 corresponding cache line.
 
-\paragraph{Partial coherence commit.}
+\item[Partial coherence commit:]
 This can be thought of as the system having worked out the order in which
 a pair of values written will be deposited into the corresponding cache
 line, but potentially well before that cache line arrives.
@@ -2589,7 +2591,7 @@ suggests that real PowerPC hardware does in fact use partial coherence
 commits to handle concurrent stores by multiple hardware threads within
 a single core.
 
-\paragraph{Write propagate to thread.}
+\item[Write propagate to thread:]
 This occurs when a second hardware thread becomes aware of the first
 hardware thread's write.
 The time at which a write propagates to a given thread might not have
@@ -2601,11 +2603,11 @@ the first thread's write's value might have been deposited into the
 corresponding cache line long before the second thread learns of that
 write.
 
-\paragraph{Barrier propagate to thread.}
+\item[Barrier propagate to thread:]
 Hardware threads make each other aware of memory-barrier instructions
 as needed by propagating them to each other.
 
-\paragraph{Acknowledge \co{sync}.}
+\item[Acknowledge \tco{sync}:]
 The PowerPC \co{sync} instruction implements the Linux kernel's
 \co{smp_mb()} full barrier.
 And one reason that the \co{sync} instruction provides such strong
@@ -2614,6 +2616,8 @@ threads, but these other threads must also acknowledge each \co{sync}.
 This two-way communication allows the hardware threads to cooperate
 to produce the required strong global ordering.
 
+\end{description}
+
 \begin{figure*}[tbp]
 \centering
 \resizebox{\textwidth}{!}{\includegraphics{memorder/PPCMEM0.png}}
-- 
2.25.1


