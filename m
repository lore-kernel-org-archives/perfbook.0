Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55104 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726173AbfDVLKs (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 22 Apr 2019 07:10:48 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3MB8txj077595
        for <perfbook@vger.kernel.org>; Mon, 22 Apr 2019 07:10:47 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2s17vjsb6a-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 22 Apr 2019 07:10:47 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 22 Apr 2019 12:10:46 +0100
Date: Mon, 22 Apr 2019 04:10:43 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [Not a patch] Possible incomplete sentence/clause in defer/hazptr
Reply-To: paulmck@linux.ibm.com
References: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
 <d4dbe4e8-0f2f-49ff-8f40-09be23795e00@gmail.com>
 <20190421184506.GD24840@linux.ibm.com>
 <24979174-47b3-a087-ecd1-0c2d0ba12397@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24979174-47b3-a087-ecd1-0c2d0ba12397@gmail.com>
Message-Id: <20190422111042.GD8363@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 22, 2019 at 07:19:36AM +0900, Akira Yokosawa wrote:
> On Sun, 21 Apr 2019 11:45:06 -0700, Paul E. McKenney wrote:
> > On Mon, Apr 22, 2019 at 12:25:00AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> The sentence shown below as a diff looks incomplete to me.
> >> What is your intention here?
> > 
> > Not that!  Thank you for catching this!!!  Please see below for an
> > attempted fix.  Thoughts?
> > 
> > I have queued your four patches.  My problems are (1) force of habit
> > and (2) failing to remember that comment-only lines are discarded.
> 
> And please remember the option "keepcomment=yes" can change the
> behavior.  This reminds me that I need to update style guide.

Ah, good point!  And please do!

> > I am not all that happy with the #ifdef, but it beats the alternative.
> > But what I did in this case was to just remove the fprintf() in favor
> > of the BUG_ON().  ;-)
> 
> Yes, that sounds reasonable.

Very good, I have pushed these changes.

							Thanx, Paul

> > ------------------------------------------------------------------------
> > 
> > commit 72e774fda87eaead9637d887426b701ec229664d
> > Author: Paul E. McKenney <paulmck@linux.ibm.com>
> > Date:   Sun Apr 21 11:33:49 2019 -0700
> > 
> >     defer/hazptr: Fix broken statement of restart location constraints
> >     
> >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> > 
> > diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> > index 4b61d34d334c..b491c590ae2d 100644
> > --- a/defer/hazptr.tex
> > +++ b/defer/hazptr.tex
> > @@ -239,9 +239,12 @@ Which is a very good thing, because B's successor is the now-freed
> >  element~C, which means that Thread~0's subsequent accesses might have
> >  resulted in arbitrarily horrible memory corruption, especially if the
> >  memory for element~C had since been re-allocated for some other purpose.
> > -Therefore, statically allocated global variables), hazard-pointer
> > -readers must typically restart the full traversal in the face of a
> > -concurrent deletion.
> > +Therefore, hazard-pointer readers must typically restart the full
> > +traversal in the face of a concurrent deletion.
> > +Often the restart must go back to some global (and thus immortal) pointer,
> > +but it is sometimes possible to restart at some intermediate location
> > +if that location is guaranteed to still be live, for example, due to
> > +the current thread holding a lock, a reference count, etc.
> 
> Looks good to me!
> 
>         Thanks, Akira
> 
> >  
> >  \QuickQuiz{}
> >  	Readers must ``typically'' restart?
> > 
> 

