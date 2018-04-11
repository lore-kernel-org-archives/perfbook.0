Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46792 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752184AbeDKDBb (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 10 Apr 2018 23:01:31 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3B2xZ1F010687
 for <perfbook@vger.kernel.org>; Tue, 10 Apr 2018 23:01:31 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2h97q6vnp2-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Tue, 10 Apr 2018 23:01:30 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 10 Apr
 2018 23:01:30 -0400
Date: Tue, 10 Apr 2018 20:02:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: different kind of memory reordering clarification
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180410121408.4fik54wftqvesk65@HP>
 <20180410152024.rq6aynzvbgeyogma@HP>
 <20180410170409.GX3948@linux.vnet.ibm.com>
 <20180411024538.grp62hwvtxpapzeh@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180411024538.grp62hwvtxpapzeh@HP>
Message-Id: <20180411030230.GG3948@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 11, 2018 at 10:46:28AM +0800, Yubin Ruan wrote:
> On Tue, Apr 10, 2018 at 10:04:09AM -0700, Paul E. McKenney wrote:
> > On Tue, Apr 10, 2018 at 11:20:24PM +0800, Yubin Ruan wrote:
> > > On Tue, Apr 10, 2018 at 08:14:08PM +0800, Yubin Ruan wrote:
> [...]
> > > > 
> > > > Can you please provide me with some examples or references for different kinds
> > > > of memory reordering in a SMP system? You know, there are different kinds of
> > > > reordering:
> > > > 
> > > >    - Loads reordered after loads
> > > >    - Loads reordered after stores
> > > >    - Stores reordered after stores
> > > >    - Stores reordered after loads
> > > >    - Atomic reordered with loads
> > > >    - Atomic reordered with stores
> > > >    - Dependent loads reordered (DEC alpha)
> > > 
> > > I remember there is open-std.org webpage containing comparision of C++'s
> > > memory model to those primitives used in the Linux kernel. But I just can't
> > > find that page.
> > 
> > Here you go!
> > 
> > http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html
> > 
> > There will be an update in a month or so, but the above is pretty
> > close.  Also, the Linux-kernel memory model was presented at
> > ASPLOS and accepted into the Linux kernel itself:
> > 
> > https://paulmck.livejournal.com/49667.html
> 
> Many thanks. But I am currently confused about the relationship between
> terminologies used in the Linux kernel and those used in some programming
> languages (e.g., C++), i.e., the relationships between
> 
>     memory_order_release
>     memory_order_relaxed
>     memory_order_acquire
>     memory_order_seq_cst
>     ...
> 
> and those used in the kernel:
> 
>     READ_ONCE() / WRITE_ONCE()
>     rmb() / wmb() / mb() / smp_mb()
>     ...
> 
> Any materials for that?

The URL I posted above:

http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html

							Thanx, Paul

