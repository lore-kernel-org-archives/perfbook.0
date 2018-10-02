Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46736 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725951AbeJCBGG (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 2 Oct 2018 21:06:06 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w92IK7CZ065534
        for <perfbook@vger.kernel.org>; Tue, 2 Oct 2018 14:21:25 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2mvdhf902p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 02 Oct 2018 14:21:25 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 2 Oct 2018 14:21:24 -0400
Date: Tue, 2 Oct 2018 11:21:23 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 2/2] count: Adjust type of variable 'counter' with code
 snippet
Reply-To: paulmck@linux.ibm.com
References: <afb11222-c68a-22e6-a95c-bfb4d4b9344d@gmail.com>
 <549dac1f-17b7-5225-7d91-e7cd83b8b63b@gmail.com>
 <a06d09f0-7c87-c0ed-f695-b25778aa4bfa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a06d09f0-7c87-c0ed-f695-b25778aa4bfa@gmail.com>
Message-Id: <20181002182123.GK4222@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 03, 2018 at 12:24:17AM +0900, Akira Yokosawa wrote:
> On 2018/10/03 00:16:12 +0900, Akira Yokosawa wrote:
> > From a9c276c3da87ed327d003a70d60777f41999b4fc Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Wed, 3 Oct 2018 00:08:49 +0900
> > Subject: [PATCH 2/2] count: Adjust type of variable 'counter' with code snippet
> > 
> > In the actual code of count_stat.c, the per-thread variable
> > "counter" has the type "unsigned long".

Looks good, so I applied and pushed both patches, thank you!

> And the other description on Listing 5.3 in the text needs some reworking
> to reflect the changes in the snippet. Paul, can you have a look into
> this?

How does the patch below look?

							Thanx, Paul

------------------------------------------------------------------------

commit cc0409cfb0581924b05744a15fa3ebd5c1e298af
Author: Paul E. McKenney <paulmck@linux.ibm.com>
Date:   Tue Oct 2 11:19:33 2018 -0700

    count: Update code description and QQ based on {READ,WRITE}_ONCE()
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/count/count.tex b/count/count.tex
index 9f9fd0f64838..c36e7d826a7b 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -495,23 +495,22 @@ show a function that increments the counters, using the
 thread's element of the \co{counter} array.
 Because this element is modified only by the corresponding thread,
 non-atomic increment suffices.
-
-Lines~\lnref{read:b}-\lnref{read:e}
-show a function that reads out the aggregate value of the counter,
-using the \co{for_each_thread()} primitive to iterate over the list of
-currently running threads, and using the \co{per_thread()} primitive
-to fetch the specified thread's counter.
-Because the hardware can fetch and store a properly aligned \co{unsigned long}
-atomically, and because \GCC\ is kind enough to make use of this capability,
-normal loads suffice, and no special atomic instructions are required.
-\end{lineref}
+However, this code uses \co{WRITE_ONCE()} to prevent destructive compiler
+optimizations.
+For but one example, the compiler is within its rights to use a
+to-be-stored-to location as temporary storage, thus writing what
+would be for all intents and purposes garbage to that location
+just before doing the desired store.
+This could of course be rather confusing to anything attempting to
+read out the count.
+The use of \co{WRITE_ONCE()} prevents this optimization and others besides.
 
 \QuickQuiz{}
-	What other choice does \GCC\ have, anyway???
+	What other nasty optimizations could \GCC\ apply?
 \QuickQuizAnswer{
-	According to the C standard, the effects of fetching a variable
-	that might be concurrently modified by some other thread are
-	undefined.
+	According to the C standard, the effects of doing a normal store
+	to a variable that might be concurrently loaded by some other
+	thread are undefined.
 	It turns out that the C standard really has no other choice,
 	given that C must support (for example) eight-bit architectures
 	which are incapable of atomically loading a \co{long}.
@@ -540,8 +539,10 @@ normal loads suffice, and no special atomic instructions are required.
 	It is therefore reasonable to expect that any Linux-kernel
 	adoption of C11 atomics will be incremental at best.
 
-	So why not just use plain old C-language assignment statements
-	to access shared variables?
+	But if the code is doing loads and stores that the underlying
+	hardware can implement with single instructions, why not just
+	use plain old C-language assignment statements to access shared
+	variables?
 	The problem is that the compiler is within its rights to assume
 	that no other thread is modifying the variable being accessed.
 	Given a plain old C-language load, the compiler would therefore
@@ -581,6 +582,22 @@ normal loads suffice, and no special atomic instructions are required.
 	coding standards.
 } \QuickQuizEnd
 
+Lines~\lnref{read:b}-\lnref{read:e}
+show a function that reads out the aggregate value of the counter,
+using the \co{for_each_thread()} primitive to iterate over the list of
+currently running threads, and using the \co{per_thread()} primitive
+to fetch the specified thread's counter.
+This code also uses \co{READ_ONCE()} to ensure that the compiler doesn't
+optimize these loads into oblivion.
+For but one example, a pair of consecutive calls to \co{read_count()}
+might be inlined, and an intrepid optimizer might notice that the same
+locations were being summed and thus incorrectly conclude that it would
+be simply wonderful to sum them once and use the resulting value twice.
+This sort of optimization might be rather frustrating to people expecting
+later \co{read_count()} calls to return larger values.
+The use of \co{READ_ONCE()} prevents this optimization and others besides.
+\end{lineref}
+
 \QuickQuiz{}
 	How does the per-thread \co{counter} variable in
 	Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}

