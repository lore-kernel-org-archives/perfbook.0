Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46982 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751839AbdJ2TVp (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 29
 Oct 2017 15:21:45 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9TJJBVP128380
 for <perfbook@vger.kernel.org>; Sun, 29 Oct 2017 15:21:44 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dwj6pnwsh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 29 Oct 2017 15:21:44 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 29 Oct
 2017 15:21:43 -0400
Date: Sun, 29 Oct 2017 12:21:40 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Listing 9.2: actual free(3) will probably cause problem
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171028092932.GG5742@HP>
 <20171028131227.GV3659@linux.vnet.ibm.com>
 <1751f079-4a3f-5046-4103-9e5c672e611b@gmail.com>
 <d800cd74-a7af-8390-79e9-65cf15d7dc3f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d800cd74-a7af-8390-79e9-65cf15d7dc3f@gmail.com>
Message-Id: <20171029192140.GL3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org

On Sun, Oct 29, 2017 at 08:42:02PM +0900, Akira Yokosawa wrote:
> On 2017/10/29 09:19:07 +0800, Yubin Ruan wrote:
> > [Off list...]
> 
> Well, this was on the list. I'm keeping the CC.
> 
> > 
> > On 10/28/2017 09:12 PM, Paul E. McKenney wrote:
> >> On Sat, Oct 28, 2017 at 05:29:34PM +0800, Yubin Ruan wrote:
> >>> Hi Paul,
> >>>
> >>> I would suggest the following patch for defer/route_refcnt.c (as in Listing
> >>> 9.2). For the change in re_free, if we actually call free(3) on `rep', we will
> >>> lose that piece of memory so that the READ_ONCE() at line 36 might see garbage
> >>> value and will probably will not call abort(3), i.e., that is implementation
> >>> specific behavior. And I don't see why will we have `old <=0`.
> >>>
> >>> I think I understand what that code mean but you might mean some other?
> >>> Hopefully I will not be too picky.
> >>
> >> Yes, this code is buggy and fixing it is on my list.  I would be happy to
> >> accept a patch doing a real fix, but it is not simple.
> >>
> >> One place to start is Anthony Williams's atomic shared pointer code.
> >> The idea would be to translate that from C++ to C.
> > 
> > Can you provide some references?

https://bitbucket.org/anthonyw/atomic_shared_ptr

And, for completeness, a few others:

http://en.cppreference.com/w/cpp/experimental/atomic_shared_pt

https://isocpp.org/files/papers/N4162.pdf

Not so much a fan of this one because there really are already workloads
out there that need more than 48 bits of address space, but here you go:

https://github.com/facebook/folly/blob/master/folly/concurrency/AtomicSharedPtr.h

There have been quite a few papers published on this topic over the
past 20 years, most of which have at least one bug.  :-/

> >> But please be aware that this is a non-trivial problem.  If you try to
> >> hack together a solution, it -will- have subtle bugs.  So validating
> >> your solution (even if you start from Anthony's approach) will be
> >> non-trivial.  I suggest using cbmc or something similar in addition to
> >> perfbook's stress tests.
> >>
> >> So, are you up for it?  ;-)
> > 
> > Akira, can you provide some comments? I not sure what is wrong with my
> > suggestions. 
> 
> I think Paul didn't mean your suggestion was wrong. He wants formal
> verification of its correctness. And he might have noticed other issues
> in the code.
> 
> Paul, correct me if I'm guessing wrong.

You got it -- for this level of complexity and subtlety, formal verification
really is needed.

> > And I currently don't know use those test. I will work on it.
> 
> The update of perfbook pushed earlier today contains relevant topics
> in the "formal" chapter and bibliography.
> 
> This looks to me a good opportunity for you.

That indeed was one of my motivations for expanding on this chapter.  ;-)

I suggest starting with CBMC and Nidhugg.  CBMC is easier to use, so I
would start with that, but you might need Nidhugg for larger scenarios.

							Thanx, Paul

> Akira
> 
> > 
> > Yubin
> > 
> >>>
> >>> ----------------------------------------
> >>> diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
> >>> index 8a48faf..0d24e9d 100644
> >>> --- a/CodeSamples/defer/route_refcnt.c
> >>> +++ b/CodeSamples/defer/route_refcnt.c
> >>> @@ -36,7 +36,8 @@ DEFINE_SPINLOCK(routelock);
> >>>  static void re_free(struct route_entry *rep)
> >>>  {
> >>>  	WRITE_ONCE(rep->re_freed, 1);
> >>> -	free(rep);
> >>> +    /* Will not actually free it. Just use the `re_freed' as a flag */
> >>> +	/*free(rep);*/
> >>>  }
> >>>
> >>>  /*
> >>> @@ -50,7 +51,6 @@ unsigned long route_lookup(unsigned long addr)
> >>>  	struct route_entry **repp;
> >>>  	unsigned long ret;
> >>>
> >>> -retry:
> >>>  	repp = &route_list.re_next;
> >>>  	rep = NULL;
> >>>  	do {
> >>> @@ -65,8 +65,6 @@ retry:
> >>>  			if (READ_ONCE(rep->re_freed))
> >>>  				abort();
> >>>  			old = atomic_read(&rep->re_refcnt);
> >>> -			if (old <= 0)
> >>> -				goto retry;
> >>>  			new = old + 1;
> >>>  		} while (atomic_cmpxchg(&rep->re_refcnt, old, new) != old);
> >>>
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> >>> the body of a message to majordomo@vger.kernel.org
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>>
> >>
> > 
> > 
> 

