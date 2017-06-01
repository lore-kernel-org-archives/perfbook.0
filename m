Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51398 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751033AbdFAAFu (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 31
 May 2017 20:05:50 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5103RXQ091083
 for <perfbook@vger.kernel.org>; Wed, 31 May 2017 20:05:49 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2at7u10hd8-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 31 May 2017 20:05:49 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 31 May
 2017 20:05:48 -0400
Date: Wed, 31 May 2017 17:05:46 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
 <20170531184655.GR3956@linux.vnet.ibm.com>
 <907f9e98-05b5-ab60-c854-e19deab39629@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <907f9e98-05b5-ab60-c854-e19deab39629@gmail.com>
Message-Id: <20170601000546.GV3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jun 01, 2017 at 06:19:16AM +0900, Akira Yokosawa wrote:
> On 2017/05/31 11:46:55 -0700, Paul E. McKenney wrote:
> > On Tue, May 30, 2017 at 09:05:15PM +0900, Akira Yokosawa wrote:
> >> >From 489b5e3bdeba2f9b733dbe3d85390368dd159174 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Tue, 30 May 2017 20:44:52 +0900
> >> Subject: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
> >>
> >> Hi Paul,
> >>
> >> This is the respin of the latter two patches of v1. I'm keeping RFC
> >> because of some questions.
> >>
> >> "long" -> "intptr_t" changes in Patch 1 have no effect on a platform
> >> where "long" and "intptr_t" have the same width, but I think they
> >> are good in portability POV.
> >>
> >> WRITE_ONCE() in Patch 2 is placed under the assignment to the array
> >> because I could not translate post increment in any other way.
> >> Does the WRITE_ONCE() ensure the outer "while" capture the value?
> > 
> > Wow, that loop is old code!!!  My current compiler creates an infinite
> > loop for it, so yes, there is more required.
> 
> You mean on GCC for ppc64?

No, x86 GCC on the code before you changed it.  ;-)

Which reminds me...  How about if I get you direct access to some ppc64
machines?  If you are at all interested, please let me know and also
please sign up here:

	http://osuosl.org/services/powerdev/request_hosting/

I believe that there is also similar access to ARM systems, so please
let me know if you are interested.

> >                                               Plus there are confusing
> > and redundant comparisons, so that it is not entirely clear to me that
> > the loop is guaranteed to terminate properly
> > 
> > So I took both patches, but rewrote the loop in the second patch as
> > shown below.
> > 
> > If you are OK with this rewrite, I will push them.
> 
> I'm OK with this, but it is a whole rewrite of the code, so
> 
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> 
> looks appropriate in this case.
> It's up to you which tag to use.

I will stick with what I have.  Lazy and all that.  ;-)

							Thanx, Paul

>                   Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 8a54d9aeeeefa1909db062dc893705ff8fefd702
> > Author: Akira Yokosawa <akiyks@gmail.com>
> > Date:   Tue May 30 20:40:04 2017 +0900
> > 
> >     CodeSamples/defer: Rework loop in gettimestampmp.c
> >     
> >     Add READ_ONCE() and WRITE_ONCE() ensure curtimestamp is read and written
> >     once in every iteration.  The READ_ONCE() is not optional, as modern
> >     compilers can (and do) emit an infinite loop for the earlier code.
> >     
> >     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >     [ paulmck: Rework loop to eliminate redundant fetches and comparisons. ]
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > 
> > diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
> > index 2abade42e233..8780b71f33d7 100644
> > --- a/CodeSamples/defer/gettimestampmp.c
> > +++ b/CodeSamples/defer/gettimestampmp.c
> > @@ -30,16 +30,19 @@ long curtimestamp = 0;
> >  void *collect_timestamps(void *mask_in)
> >  {
> >  	long mask = (intptr_t)mask_in;
> > +	long cts;
> >  
> > -	while (curtimestamp < MAX_TIMESTAMPS) {
> > -		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
> > -			continue;
> > -		if (curtimestamp >= MAX_TIMESTAMPS)
> > +	for (;;) {
> > +		cts = READ_ONCE(curtimestamp);
> > +		if (cts >= MAX_TIMESTAMPS)
> >  			break;
> > +		if ((cts & CURTIMESTAMP_MASK) != mask)
> > +			continue;
> >  
> >  		/* Don't need memory barrier -- no other shared vars!!! */
> >  
> > -		ts[curtimestamp++] = get_timestamp();
> > +		ts[cts] = get_timestamp();
> > +		WRITE_ONCE(curtimestamp, cts + 1);
> >  	}
> >  	smp_mb();
> >  	return (NULL);
> > 
> > 
> 

