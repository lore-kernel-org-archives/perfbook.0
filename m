Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54600 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726769AbfAOBdi (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 14 Jan 2019 20:33:38 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x0F1SuoN087330
        for <perfbook@vger.kernel.org>; Mon, 14 Jan 2019 20:33:37 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2q15nmgka9-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 14 Jan 2019 20:33:37 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 15 Jan 2019 01:33:36 -0000
Date: Mon, 14 Jan 2019 17:33:37 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/6] Simplify hash_resize.c
Reply-To: paulmck@linux.ibm.com
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
 <20190114021024.GP1215@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190114021024.GP1215@linux.ibm.com>
Message-Id: <20190115013337.GA25108@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 13, 2019 at 06:10:24PM -0800, Paul E. McKenney wrote:
> On Mon, Jan 14, 2019 at 08:28:27AM +0900, Akira Yokosawa wrote:
> > >From 7b69a9b37ba9a73a50aad5cbb097235ddfe75870 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Mon, 14 Jan 2019 07:25:14 +0900
> > Subject: [PATCH 0/6] Simplify hash_resize.c
> > 
> > Hi Paul,
> > 
> > This patch set updates hash_resize.c, which you suggested for me to
> > take over, and the related text.
> > 
> > I added a couple of Quick Quizzes as well, and in one of them,
> > I included your version of hash_resize.c.
> > 
> > Patch #1 updates hash_resize.c in the way I suggested. Note that
> > in this update, "#ifndef FCV_SNIPPET" blocks are used to hide
> > code for debugging (hash value checks) in code snippets.
> > This code can actually be compiled with "-DFCV_SNIPPET" to see
> > the performance without hash value checks.
> > 
> > Patch #2 adds a couple of Quick Quizzes. Your version of hash_resize.c
> > is added as hash_resize_s.c.
> > 
> > Patch #3 removes unnecessary folding in a code snippet.
> > 
> > Patch #4 adjusts a few sentence to the simpler approach.
> > 
> > Patch #5 adds another Quick Quiz.
> > 
> > Patch #6 adds an "#error" directive for the lack of rcu_barrier().
> > 
> > All of the updates in text would need your native eyes to be polished.
> 
> Nice!  Queued and pushed, thank you!  I will review and send any
> needed update by end of tomorrow, Pacific Time.

Here is a summary of changes:

o	Move the ht_lock_state structure definition to follow the ht
	structure, matching the order of discussion in the text.
	Everything seems to build and run OK with this change.
	Also illustrates the advantages of line labels!  ;-)

o	I considered inlining ht_search_bucket() into its only caller
	in hashtab_lookup(), but decided against it.  More flexibility
	for change with it as is.

o	I added ht_search_bucket() to the in-text list of things
	permitting lookups and modifications to run concurrently with
	a resize operation.

o	I tweaked the description of hashtab_lock_mod(), hashtab_unlock_mod(),
	hashtab_add(), and hashtab_del().

o	I tweaked the QQ asking about searches missing adds during resizes.

o	English is strange, so "Less Changes" must become "Fewer Changes".

o	I put the long labels on a single line out of paranoia.

I pushed these out on a working branch named paulmck.2019.01.14a.  Please
let me know whether I messed anything up, and once it looks good to you,
I will pull these two commits into the master branch.

							Thanx, Paul

