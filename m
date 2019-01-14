Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39548 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726659AbfANCK1 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 13 Jan 2019 21:10:27 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x0E24ito137824
        for <perfbook@vger.kernel.org>; Sun, 13 Jan 2019 21:10:25 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pyxjaq21n-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 13 Jan 2019 21:10:25 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 14 Jan 2019 02:10:25 -0000
Date: Sun, 13 Jan 2019 18:10:24 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/6] Simplify hash_resize.c
Reply-To: paulmck@linux.ibm.com
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Message-Id: <20190114021024.GP1215@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 14, 2019 at 08:28:27AM +0900, Akira Yokosawa wrote:
> >From 7b69a9b37ba9a73a50aad5cbb097235ddfe75870 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 14 Jan 2019 07:25:14 +0900
> Subject: [PATCH 0/6] Simplify hash_resize.c
> 
> Hi Paul,
> 
> This patch set updates hash_resize.c, which you suggested for me to
> take over, and the related text.
> 
> I added a couple of Quick Quizzes as well, and in one of them,
> I included your version of hash_resize.c.
> 
> Patch #1 updates hash_resize.c in the way I suggested. Note that
> in this update, "#ifndef FCV_SNIPPET" blocks are used to hide
> code for debugging (hash value checks) in code snippets.
> This code can actually be compiled with "-DFCV_SNIPPET" to see
> the performance without hash value checks.
> 
> Patch #2 adds a couple of Quick Quizzes. Your version of hash_resize.c
> is added as hash_resize_s.c.
> 
> Patch #3 removes unnecessary folding in a code snippet.
> 
> Patch #4 adjusts a few sentence to the simpler approach.
> 
> Patch #5 adds another Quick Quiz.
> 
> Patch #6 adds an "#error" directive for the lack of rcu_barrier().
> 
> All of the updates in text would need your native eyes to be polished.

Nice!  Queued and pushed, thank you!  I will review and send any
needed update by end of tomorrow, Pacific Time.

Just FYI, this also pushed out a couple of commits starting my rework
of Section 9.5.1.

>         Thanks, Akira
> 
> PS:
> 
> I couldn't make out your concern of "if we ever want to iterate over
> the hash table". Can you elaborate it?

Consider a hash_iterate() function that takes a pointer to a function.
Then hash_iterate() would invoke this function on each element currently
in the hash table, for a relatively relaxed definition of "currently".
With your hash table, a naive implementation might iterate over some
data items twice due to their being in both the old and the new tables.

But this is not hard to fix, for example, by creating some sort of list
of elements and the eliminating duplicates, then invoking the specified
function on each of them.  Of course, this entire process would need to
be carried out within an RCU read-side critical section.

This assumes that iteration over the entire hash table is rare, which
I would certainly expect it to be, given how expensive it is.

Plus, we currently don't support iteration, so it isn't currently a
problem anyway.  ;-)

							Thanx, Paul

> --
> Akira Yokosawa (6):
>   datastruct/hash: Simplify hash_resize.c
>   datastruct/hash: Add a couple of Quick Quizzes regarding hash_resize.c
>   datastruct/hash: Fix unnecessary folding in code snippet
>   datastruct/hash: Adjust context to updated code in hash_resize.c
>   datastruct/hash: Add Quick Quiz on READ_ONCE/WRITE_ONCE in
>     hash_resize.c
>   datastruct/hash: Display error msg if rcu_barrier() is not available
> 
>  CodeSamples/datastruct/hash/Makefile        |   5 +-
>  CodeSamples/datastruct/hash/hash_resize.c   |  62 +++--
>  CodeSamples/datastruct/hash/hash_resize_s.c | 365 ++++++++++++++++++++++++++++
>  CodeSamples/datastruct/hash/hashtorture.h   |  11 +-
>  datastruct/datastruct.tex                   | 146 +++++++----
>  5 files changed, 513 insertions(+), 76 deletions(-)
>  create mode 100644 CodeSamples/datastruct/hash/hash_resize_s.c
> 
> -- 
> 2.7.4
> 

