Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45250 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751001AbdJ0XFy (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 27
 Oct 2017 19:05:54 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9RN52a6000721
 for <perfbook@vger.kernel.org>; Fri, 27 Oct 2017 19:05:53 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dv5smy1xa-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 27 Oct 2017 19:05:53 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 27 Oct
 2017 19:05:52 -0400
Date: Fri, 27 Oct 2017 16:05:49 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] typo at Chp 7.
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171027092317.GA8509@HP>
 <bf23f56f-b4e1-48fe-821d-721457cd469e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf23f56f-b4e1-48fe-821d-721457cd469e@gmail.com>
Message-Id: <20171027230549.GS3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 28, 2017 at 12:02:19AM +0900, Akira Yokosawa wrote:
> Hi Yubin,
> 
> On 2017/10/27 18:23, Yubin Ruan wrote:
> > Hi paul,
> > 
> > I finish chapter 7 and find some typo. Fixed in the patch below.
> > 
> > Yubin
> > 
> > diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> > index 9fcbbf9..c7c4ae8 100644
> > --- a/locking/locking-existence.tex
> > +++ b/locking/locking-existence.tex
> > @@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
> >  figure, it can be problematic if a given data element can be a member
> >  of multiple hash tables or given more-complex data structures such
> >  as trees or graphs.
> > -These problems can be solved, in fact, such solutions form the basis
> > +These problems can be solved. In fact, such solutions form the basis
> 
> I'd suggest the following:
> 
> +These problems can be solved, in fact, and such solutions form the basis

How about this?

	Not only can these problems be solved, but the solutions also
	form the basis of lock-based software transactional memory [...].

> >  of lock-based software transactional memory
> >  implementations~\cite{Shavit95,DaveDice2006DISC}.
> >  However,
> > --
> > To unsubscribe from this list: send the line "unsubscribe perfbook" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > .
> > 
> 
> And please refer to Section 1.5 of perfbook for the process of contributing
> patches.
> 
> Here is what Paul told me when I submitted my first patch back in April 2016.
> 
> On 2016/04/13 1:00, Paul E. McKenney wrote:
> > Akira, in the future, please do use "git format-patch" and also please
> > use the Linux-kernel preferred format for referencing commits, as shown
> > in the updated commit below.  The idea is to use the first 12 digits of
> > the SHA-1 commit ID, followed by the subject line in both quotes and
> > parentheses.
> 
> You can see the archive of the thread at:
> 
>     http://www.spinics.net/lists/perfbook/msg00148.html

Please do use this approach if you can, but the delay was instead due
to it taking some time for me to see that the sentence could in fact
be confusing.

							Thanx, Paul

