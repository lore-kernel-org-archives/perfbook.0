Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46664 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbeJ0FhY (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 Oct 2018 01:37:24 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9QKsqmZ030049
        for <perfbook@vger.kernel.org>; Fri, 26 Oct 2018 16:58:51 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nca158ut6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 26 Oct 2018 16:58:51 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 26 Oct 2018 16:58:49 -0400
Date: Fri, 26 Oct 2018 13:58:45 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/7] count, toolsoftrade: Employ new code-snippet scheme
 (cont.)
Reply-To: paulmck@linux.ibm.com
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
 <5342e889-ee54-cb5d-c498-b887bcb79863@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5342e889-ee54-cb5d-c498-b887bcb79863@gmail.com>
Message-Id: <20181026205845.GZ4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 27, 2018 at 12:35:10AM +0900, Akira Yokosawa wrote:
> On 2018/10/27 00:22:37 +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > This is a set of simple conversions of code snippets to the new scheme
> > in count and toolsoftrade.  There is no change in the code under CodeSamples,
> > but there are a few visual changes in the pdf output which reflect the
> > actual code samples.
> 
> I forgot to mention that Patch #3 contains minor changes in the code to
> reduce width of code snippets.
> 
>         Thanks, Akira
> 
> > 
> > Patch #7 fixes an unintended change in indent width made in the previous
> > patch set.
> > 
> >         Thanks, Akira

I applied and pushed this series, thank you!

							Thanx, Paul

> > --
> > Akira Yokosawa (7):
> >   count: Employ new scheme for inline code snippets
> >   toolsoftrade: Use 'VerbatimU' for inline snippets
> >   toolsoftrade: Employ new scheme for snippets of lock.c
> >   toolsoftrade: Employ new scheme for snippet of rwlockscale.c
> >   toolsoftrade: Employ new scheme for snippet of compiler barriers
> >   toolsoftrade: Employ new scheme for snippets of threadcreate.c
> >   count: Fix indent in count_lim_atomic.c
> > 
> >  CodeSamples/api-pthreads/api-pthreads.h |   7 +-
> >  CodeSamples/count/count_lim_atomic.c    |   2 +-
> >  CodeSamples/intro/threadcreate.c        |  20 +-
> >  CodeSamples/toolsoftrade/lock.c         |  76 +++---
> >  CodeSamples/toolsoftrade/rwlockscale.c  |  54 ++--
> >  count/count.tex                         |  89 +++---
> >  toolsoftrade/toolsoftrade.tex           | 460 ++++++++------------------------
> >  7 files changed, 253 insertions(+), 455 deletions(-)
> > 
> 

