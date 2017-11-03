Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50842 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752458AbdKCXzI (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 3
 Nov 2017 19:55:08 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA3NsBBU066902
 for <perfbook@vger.kernel.org>; Fri, 3 Nov 2017 19:55:08 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2e0yybdf7p-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 03 Nov 2017 19:55:08 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 3 Nov 2017
 19:55:06 -0400
Date: Fri, 3 Nov 2017 16:55:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Invalid compilation without -fno-strict-aliasing
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
 <20171103122719.GH3624@linux.vnet.ibm.com>
 <CAJYFCiPhiFLBjPCjS5DcpcbYphs6bGqwbG94idiDqSVfVsNF8g@mail.gmail.com>
 <20171103140342.GK3624@linux.vnet.ibm.com>
 <CAJYFCiNcZZeAvhLZAj=wxwuEvqGyv7QH9S5r-ehK0eYt+bmy0g@mail.gmail.com>
 <20171103143823.GL3624@linux.vnet.ibm.com>
 <CAJYFCiO3BLYG12vPjMipRAmYFdOgHK19rri1PnR1K9jnfHSARQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiO3BLYG12vPjMipRAmYFdOgHK19rri1PnR1K9jnfHSARQ@mail.gmail.com>
Message-Id: <20171103235504.GT3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Nov 04, 2017 at 07:26:27AM +0800, Yubin Ruan wrote:
> Thanks Paul,
> 
> 2017-11-03 22:38 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> > On Fri, Nov 03, 2017 at 10:12:48PM +0800, Yubin Ruan wrote:
> >> 2017-11-03 22:03 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> >> > On Fri, Nov 03, 2017 at 09:33:48PM +0800, Yubin Ruan wrote:
> >> >> Thanks Paul,
> >> >>
> >> >> 2017-11-03 20:27 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> >> >> > On Fri, Nov 03, 2017 at 09:54:15AM +0800, Yubin Ruan wrote:
> >> >> >> Does anyone have any idea why this thread
> >> >> >>
> >> >> >>     https://lkml.org/lkml/2003/2/25/270
> >> >> >
> >> >> > Hmmm...  This is quite the blast from the past.  Compilers have changed
> >> >> > a bit in the last 14 years.  Nevertheles...
> >> >>
> >> >> Unfortunately I got several old servers with GCC 3.x so I have to keep
> >> >> an eye on these things (and worse, I am one of those guys who like to
> >> >> home-brew some locking primitives...)
> >> >>
> >> >> >> is related to strict-aliasing? To me, a compiler barrier like this will fix it:
> >> >> >>
> >> >> >>     if((stream + event_len) < ends) {
> >> >> >>         iwe->len = event_len;
> >> >> >>         barrier();
> >> >> >>         memcpy(stream, (char *) iwe, event_len);
> >> >> >>         stream += event_len;
> >> >> >>     }
> >> >> >
> >> >> > As with many bugs, there are a number of ways to fix this one.  I suggest taking
> >> >> > a look at the documentation for -no-strict-alias.  This stackoverflow URL might
> >> >> > not be a bad place to start:
> >> >> >
> >> >> > https://stackoverflow.com/questions/23848188/strict-aliasing-rule-and-char-pointers
> >> >>
> >> >> Basically I understand what aliasing means (for the C/C++ Languages)
> >> >> and I know what a strict aliasing rule it is. I just cannot see why a
> >> >> strict aliasing rule will cause this reordering problem...
> >> >
> >> > OK.  Then please tell me why exactly you believe that strict aliasing does
> >> > not allow the compiler to reverse the order of the first two statements
> >> > in the body of the above "if" statement.
> 
> I think I understand your point now: if two pointers of different
> types might reference the same location, then the compiler cannot
> reverse the statements (just as it is not allowed to reverse the above
> "iwe->len " and "memcpy" statements).
> 
> But why is this? After all, the compiler does not know the context.

It is just part of the contract between the compiler and the
developer.

1.	If you don't specify -no-strict-alias, then you as the developer
	are responsible for making sure that no two pointers of different
	types reference the same location at the same time.  If you fail
	in this responsibility, as the above example code failed, then
	the compiler is within its rights to assume that two pointers
	of different type cannot possibly reference the same location.
	The compiler is thus free to reorder any such references.
	(And there is one exception to this rule to allow certain I/O
	functions to work correctly.)

2.	If you -do- specify -no-strict-alias, then the responsibility
	falls on the compiler.	If the compiler cannot prove that a given
	pair of pointers reference different locations, then the compiler
	if forced to assume that they might reference the same location.
	In this case, the compiler is forbidden from reordering the
	above code.

Why have two approaches?

If you are writing heavy-duty numerical/vector/matrix code, #1 works
really well, allowing pointers to overlapping portions of matrices
but still allowing the compiler to undertake valuable optimizations
that reorder code rather freely.

If you are writing the Linux kernel, there is so much use of pointers
to different types referencing the same data that it the optimizations
are often destructive.

So that is one reason why both options are available.  There are
probably others.

							Thanx, Paul

> Thanks,
> Yubin
> 
> >> Indeed, the compiler is free to reorder those two statements and
> >> strict aliasing does not prevent the compiler from doing so. But, from
> >> my perspective, this reordering issue might just come from some other
> >> optimization rules (so we have to use barrier()), not because of the
> >> strict aliasing rule.
> >>
> >> Hmm... am I missing anything?
> >
> > When you tell gcc -no-strict-aliasing (which is a non-standard extension,
> > not part of the C language), the compiler is required to allow for the
> > fact that two pointers of different types might well reference the same
> > location(s).  In this case, the compiler cannot reverse the statements,
> > just as it would not be allowed to reverse the order of equivalent
> > non-pointer statements.
> >
> >                                                         Thanx, Paul
> >
> 

