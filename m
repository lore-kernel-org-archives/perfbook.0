Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37650 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726120AbfDZNnq (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 26 Apr 2019 09:43:46 -0400
Date: Fri, 26 Apr 2019 06:43:42 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH v2 0/3] Toyrcu: replace plain accesses with READ_ONCE()
 and
Message-ID: <20190426134342.GC3923@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
 <95b306ce-9ddb-0ac5-ee5c-077cb4a9a27e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95b306ce-9ddb-0ac5-ee5c-077cb4a9a27e@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Fri, Apr 26, 2019 at 12:38:40AM +0900, Akira Yokosawa wrote:
> Hi Junchang,
> 
> On Thu, 25 Apr 2019 16:29:51 +0800, Junchang Wang wrote:
> > Hi Paul and Akira,
> > 
> > This patch set replaces plain accesses and ACCESS_ONCE() with READ_ONCE()
> > and WRITE_ONCE() in Toy RCU examples. I will send another patch updating
> > tex file accordingly on top of this patch set.
> 
> As far as accesses to rcu_gp_ctr, this patch set looks good to me.
> 
> In updating toyrcu.tex file, I suggested to extract the snippets from
> code under CodeSamples/defer, but some snippets in toyrcu.tex consist of
> code from both .h and .c. Current scheme does not support such merging
> of snippets from multiple source files.
> 
> Your option is to manually convert verbbox environment to Verbatim
> environment. Sorry I suggested infeasible extractions the other day.
> rcu_qs.c and rcu_qs.h are in separate snippets, and they can be
> extracted by fcvextract.pl. In this case, commit 4a41491166cd
> ("defer/hazptr: Extract snippet from hazptr.c") should be a good example,
> especially the "gobbleblank=yes" option.

Given that these are toy implementations, pleaee feel free to reorganize
the code to make snippet extraction work better.  (Please check to see
if anything else uses these -- I do not believe so, but memory can be
a tricky thing sometimes.)

> If you have any question, feel free to ask me. I'm looking forward to
> seeing your update.
> 
> Paul, in the sources Junchang has touched, per-thread variable
> "rcu_reader_gp" is updated by its owner, but is read accessed from
> for_each_thread loops in updater side. So I think accesses to each of
> them need to be annotated by WRITE_ONCE (in owner) and READ_ONCE (in updater).
> I looked at only the diffs in the 1st patch set and didn't notice the raciness
> of them.

Agreed, WRITE_ONCE() by owner and READ_ONCE() by updater.

> Macros for accessing per-thread variables are expanded to array references,
> and there are "barrier()"s in these loops.
> So I think there is little chance those accesses would be optimized by
> currently available compilers.
> 
> Do you see the need to annotate the accesses to per-thread variable?

If a per-thread variable is accessed by multiple threads, it would be
good to annotate the accesses as needed.  That said, I have no idea
how well annotation interacts with the per-thread accesses, so some
experimentation might be required.

							Thnax, Paul

>         Thanks, Akira 
> 
> > 
> > --
> > Junchang Wang (3):
> >   rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
> >   rcu_nest: Use READ_ONCE() and WRITE_ONCE() for shared variable
> >     rcu_gp_ctr
> >   rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
> >     rcu_gp_ctr
> > 
> >  CodeSamples/defer/rcu.c      | 2 +-
> >  CodeSamples/defer/rcu.h      | 4 ++--
> >  CodeSamples/defer/rcu_nest.c | 2 +-
> >  CodeSamples/defer/rcu_nest.h | 2 +-
> >  CodeSamples/defer/rcu_qs.c   | 2 +-
> >  CodeSamples/defer/rcu_qs.h   | 4 ++--
> >  6 files changed, 8 insertions(+), 8 deletions(-)
> > 
> 

