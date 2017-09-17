Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57096 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751198AbdIQBHf (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 16 Sep 2017 21:07:35 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8H149hh123945
 for <perfbook@vger.kernel.org>; Sat, 16 Sep 2017 21:07:34 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d0yy52gmr-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 16 Sep 2017 21:07:34 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 16 Sep
 2017 21:07:34 -0400
Date: Sat, 16 Sep 2017 18:07:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Is WRITE_ONCE() enough to prevent invention of stores?
Reply-To: paulmck@linux.vnet.ibm.com
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
Message-Id: <20170917010730.GY3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Sep 16, 2017 at 08:01:45PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I'm a bit disturbed by the description in Section 14.3.1 "Memory-Reference
> Restrictions" quoted below:
> 
> > Oddly enough, the compiler is within its rights to use a variable
> > as temporary storage just before a store to that variable, thus
> > inventing stores to that variable.
> > Fortunately, most compilers avoid this sort of thing, at least outside
> > of stack variables.
> > Nevertheless, using WRITE_ONCE() (or declaring the variable
> > volatile) should prevent this sort of thing.
> > But take care: If you have a translation unit that uses that variable,
> > and never makes a volatile access to it, the compiler has no way of
> > knowing that it needs to be careful.
> 
> I'm wondering if using WRITE_ONCE() in a translation unit is really
> enough to prevent invention of stores.
> 
> Accessing via a volatile-cast pointer guarantees the access is not
> optimized out (and hopefully the referenced value is respected).
> 
> But I suspect that it has any effect in preventing invention of extra
> loads/stores.
> 
> Isn't declaring the variable volatile necessary for the guarantee?
> 
> In practice, as is described in the above quote: "Fortunately, most
> compilers avoid this sort of thing, at least outside of stack variables",
> we can assume non-volatile shared variables are not spilled out to
> the variables themselves as far as GCC/LLVM is concerned.
> But this is compiler dependent, I suppose.

I suspect that it will turn out to be impossible for the compiler to
actually invent these stores in the general case.  For example, it might
be that there is some lock held or other synchronization mechanism unknown
to the compiler that prevents this behavior.  But I haven't fully worked
this out yet.

But I do know that if you just do plain stores, the compiler is fully
within its rights to invent stores preceding any given plain store.

							Thanx, Paul

