Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51370 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750815AbdEHPuy (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 8
 May 2017 11:50:54 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v48Fhhpx012845
 for <perfbook@vger.kernel.org>; Mon, 8 May 2017 11:50:53 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2aadbd5ctj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 08 May 2017 11:50:53 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 8 May 2017
 11:50:52 -0400
Date: Mon, 8 May 2017 08:50:52 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: The weird re-ordering issue of the Alpha arch'
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170429142605.GC2536@master>
 <20170501155816.GB3956@linux.vnet.ibm.com> <20170508132523.GA7570@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170508132523.GA7570@HP>
Message-Id: <20170508155052.GA3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, May 08, 2017 at 09:25:28PM +0800, Yubin Ruan wrote:
> On Mon, May 01, 2017 at 08:58:16AM -0700, Paul E. McKenney wrote:
> > On Sat, Apr 29, 2017 at 10:26:05PM +0800, Yubin Ruan wrote:

[ . . . ]

> Hmm...that reminds me of some words in the perfbook. In the answer of quick quiz 4.17,
> you state that:
> 
>     Memory barrier only enforce ordering among multiple memory references: They do
>     absolutely nothing to expedite the propogation of data from one part of the system
>     to another. This leads to a quick rule of thumb:  You do not need memory barriers
>     unless you are using more than one variable to communicate between multiple threads.
> 
> Is that only true for the Alpha processor? I mean, on platforms other than
> Alpha (e.g x86), memory barrier *do* expedite the propogation of data from one
> processor/core to other processor/core, even though that is not officially documented.

Can you point me at any unofficial documentation of this, for example,
any performance measurements indicating that (for example) the mfence
instruction speeds up the propagation of previous writes to other CPUs?

In the absence of such documentation, all I can really do is change
"They do absolutely nothing to expedite..." to something like "They are
not guaranteed to do anything to expedite..."

							Thanx, Paul

> ---
> Yubin
> 
> > > 
> > > [1]: https://www.cs.umd.edu/~pugh/java/memoryModel/AlphaReordering.html
> > > 
> > 
> 

