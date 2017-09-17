Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56896 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751452AbdIQVzM (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 17 Sep 2017 17:55:12 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8HLsKp0033780
 for <perfbook@vger.kernel.org>; Sun, 17 Sep 2017 17:55:11 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d1qyk1g4a-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 17 Sep 2017 17:55:11 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 17 Sep
 2017 17:55:11 -0400
Date: Sun, 17 Sep 2017 14:55:08 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Is WRITE_ONCE() enough to prevent invention of stores?
Reply-To: paulmck@linux.vnet.ibm.com
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
 <20170917010730.GY3521@linux.vnet.ibm.com>
 <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
Message-Id: <20170917215508.GD3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 17, 2017 at 08:04:21PM +0900, Akira Yokosawa wrote:
> On 2017/09/16 18:07:30 -0700, Paul E. McKenney wrote:
> > On Sat, Sep 16, 2017 at 08:01:45PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> I'm a bit disturbed by the description in Section 14.3.1 "Memory-Reference
> >> Restrictions" quoted below:
> >>
> >>> Oddly enough, the compiler is within its rights to use a variable
> >>> as temporary storage just before a store to that variable, thus
> >>> inventing stores to that variable.
> >>> Fortunately, most compilers avoid this sort of thing, at least outside
> >>> of stack variables.
> >>> Nevertheless, using WRITE_ONCE() (or declaring the variable
> >>> volatile) should prevent this sort of thing.
> >>> But take care: If you have a translation unit that uses that variable,
> >>> and never makes a volatile access to it, the compiler has no way of
> >>> knowing that it needs to be careful.
> >>
> >> I'm wondering if using WRITE_ONCE() in a translation unit is really
> >> enough to prevent invention of stores.
> >>
> >> Accessing via a volatile-cast pointer guarantees the access is not
> >> optimized out (and hopefully the referenced value is respected).
> >>
> >> But I suspect that it has any effect in preventing invention of extra
> >> loads/stores.
> >>
> >> Isn't declaring the variable volatile necessary for the guarantee?
> >>
> >> In practice, as is described in the above quote: "Fortunately, most
> >> compilers avoid this sort of thing, at least outside of stack variables",
> >> we can assume non-volatile shared variables are not spilled out to
> >> the variables themselves as far as GCC/LLVM is concerned.
> >> But this is compiler dependent, I suppose.
> > 
> > I suspect that it will turn out to be impossible for the compiler to
> > actually invent these stores in the general case.  For example, it might
> > be that there is some lock held or other synchronization mechanism unknown
> > to the compiler that prevents this behavior.  But I haven't fully worked
> > this out yet.
> 
> You mean the invented stores wouldn't be visible from other threads anyway?
> In a meaningful parallel code, that can be the case.

I mean that it is very hard to prove that inventing a store isn't introducing
a data race, which would be a violation of the standard.  The one case I know
of where the compiler can be sure that it is within its rights to invent the
store is before a normal store to a variable.

Otherwise, it might be (for example) that one must hold a lock to legally
update a given variable, and that lock might or might not be held at a given
point in the code.  But if the compiler sees a plain store, the compiler
knows that it is OK to update at that point.  So the compiler can invent
a store prior to the existing store, as long as there is no memory barrier,
compiler barrier, lock acquisition/release, atomic operation, etc., between
the original store and the compiler's invented store.

> > But I do know that if you just do plain stores, the compiler is fully
> > within its rights to invent stores preceding any given plain store.
> 
> So, the rules to use WRITE_ONCE() is something like the following?
> 
> ---
> 1) Declare the variable without volatile.

Agreed.

> 2) READ_ONCE() and plain loads can be mixed. A plain load will see
>    a value at least newer than or equal to the one obtained at the
>    program-order most recent READ_ONCE().

I am not entirely sure of this one.  But if there is a barrier() or
stronger between the READ_ONCE() and the plain load, then yes.

> 3) WRITE_ONCE() should not be mixed with plain stores when invention
>    of stores is to be avoided.

Agreed.

> Invention of stores is the opposite of fusing stores.
> Suppose you don't want to update progress in the while loop:
> 
> 	while (!am_done()) {
> 	  do_something(p);
> 	  tmp++;
> 	}
> 	progress = tmp;
> 
> The compiler might transform this to
> 
> 	while (!am_done()) {
> 	  do_something(p);
> 	  progress++;
> 	}

But only as long as the compiler knows that do_something() doesn't
contain any ordering directives.

> if it wants to avoid allocation of a register/stack to tmp for whatever
> reason. WRITE_ONCE() prevents the unintended accesses of progress:
> 
> 	while (!am_done()) {
> 	  do_something(p);
> 	  tmp++;
> 	}
> 	WRITE_ONCE(progress, tmp);

Agreed, this would prevent the update to "progress" from being pulled
into the loop.

> ---
> Adding this example in the text might be too verbose.
> Would a Quick Quiz be reasonable?

Might be good in the section on protecting memory references, and putting
it into a quick quiz or two makes a lot of sense.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > 
> 

