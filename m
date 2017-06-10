Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60611 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751943AbdFJRIT (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 10 Jun 2017 13:08:19 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5AH3vDj024015
 for <perfbook@vger.kernel.org>; Sat, 10 Jun 2017 13:08:19 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2b0c7tgjvn-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 10 Jun 2017 13:08:18 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 10 Jun
 2017 13:08:18 -0400
Date: Sat, 10 Jun 2017 10:08:15 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] Update on Chapter Deferred Processing
Reply-To: paulmck@linux.vnet.ibm.com
References: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
 <CABoNC8005C3wF7vv_y_6mnkTUwAKZ+hr9cgL1-RjJfXo9VHZDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABoNC8005C3wF7vv_y_6mnkTUwAKZ+hr9cgL1-RjJfXo9VHZDg@mail.gmail.com>
Message-Id: <20170610170815.GT3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 10, 2017 at 10:35:25PM +0800, Junchang Wang wrote:
>  Hi Paul,
> 
> The fourth patch is a false alarm. So I won't send it out. Please
> review and apply patches 1 - 3. Thanks.

Applied and pushed, thank you!

Please see note below.

> --Jason
> 
> On Sat, Jun 10, 2017 at 10:28 PM, Junchang Wang <junchangwang@gmail.com> wrote:
> > Hi Paul,
> >
> > I'm reading Chapter Deferred Processing, and following are some patches. Please
> > take a look.
> >
> > --Jason
> >
> > Junchang Wang (4):
> >   Figure Storage Hazard-Pointer Storage and Erasure: Switch from
> >     ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()

When changing text, it suffices to give the chapter's top-level
directory name, so I changed this to:

	defer: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()

> >   route_hazptr: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()
> >   route_seqlock: Switch from ACCESS_ONCE() to READ_ONCE()/WRITE_ONCE()

These are fine, giving the name of the executable for changes to a
given code sample is quite good, thank you!

							Thanx, Paul

> >  CodeSamples/defer/route_hazptr.c  | 10 +++++-----
> >  CodeSamples/defer/route_seqlock.c |  6 +++---
> >  CodeSamples/defer/seqlock.h       |  4 ++--
> >  defer/hazptr.tex                  | 16 ++++++++--------
> >  defer/seqlock.tex                 | 12 ++++++------
> >  5 files changed, 26 insertions(+), 26 deletions(-)
> >
> > --
> > 2.7.4
> >
> 

