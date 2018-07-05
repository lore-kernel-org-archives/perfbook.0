Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59920 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753857AbeGEXDa (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 5
 Jul 2018 19:03:30 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w65MxScK054407
 for <perfbook@vger.kernel.org>; Thu, 5 Jul 2018 19:03:29 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2k1qu8an1x-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Thu, 05 Jul 2018 19:03:29 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 5 Jul 2018
 19:03:28 -0400
Date: Thu, 5 Jul 2018 16:05:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: counting examples
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAFMy-Rm--uJjqAfFxdbJfuNd-XVsDm+Fh_jx1kGNaojgTgEWKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFMy-Rm--uJjqAfFxdbJfuNd-XVsDm+Fh_jx1kGNaojgTgEWKg@mail.gmail.com>
Message-Id: <20180705230541.GV3593@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Imre Palik <imrep.amz@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 05, 2018 at 10:09:49PM +0200, Imre Palik wrote:
> Hi All,
> 
> first of all, thanks for the great book.

On behalf of all of its contributors, glad you like it!

> I have some doubts about some of the counting examples.  Namely, those
> that implement inc_count() as a simple increment operation.  If there
> is nothing to restrain the compiler/linker, they can possibly merge
> several increments together, or optionally keep the counter value in a
> register.
> 
> Of course, this won't happen with counttorture, because of the
> barrier() in the loop.  But I wonder if that barrier() should be part
> of inc_count() instead.  What do you think?

I actually put this on my todo list as a results of the C++ discussion,
but given that I am in the process of (almost) rewriting Linux-kernel
RCU, it will take time to get to it.  So if you are interested, I would
welcome a patch that added READ_ONCE() and WRITE_ONCE as appropriate.

If you are curious about the historical perspective, some of the counter
code predates ACCESS_ONCE() -- let alone READ_ONCE() and WRITE_ONCE()
-- in the Linux kernel.  Compilers have gotten more aggressive over
the decades.  ;-)

							Thanx, Paul

