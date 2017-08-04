Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43514 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751870AbdHDTux (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Fri, 4 Aug 2017 15:50:53 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v74JnI4a129237
 for <perfbook@vger.kernel.org>; Fri, 4 Aug 2017 15:50:53 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2c4v9a0t7g-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 04 Aug 2017 15:50:52 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 4 Aug 2017
 15:50:52 -0400
Date: Fri, 4 Aug 2017 12:50:49 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: synchronization between two process without lock
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
Message-Id: <20170804195049.GF3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Aug 04, 2017 at 11:57:28PM +0800, Yubin Ruan wrote:
> 2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> > Hi,
> > I am sure the subject explain my intention. I got two processes trying
> > to modifying the same place. I want them to do it one after one, or,
> > if their operations interleave, I would like to let them know that the
> > content have been changed and polluted by the other so that the
> > content should be given up. That is, I would rather give up the data,
> > if polluted, than having a false one.
> >
> > I try to set a atomic ref counter, but it seems impossible to do that
> > without a lock to synchronize.
> >
> > Note that I don't want a strict synchronization: the situation is a
> > lot better. The data can be given up if that place has been polluted.
> 
> Let's explain some of my reasoning: if process A use some flag to
> indicate that it has entered the critical region, then if it crash
> before it can reset the flag, all following processes cannot enter
> that region. But if process A cannot use flag for indication, how to
> other people know (how to synchronization)?

The simplest approach is to guard the data with a lock.

But if you don't want to do that, another approach is to restrict the
data to one machine word minus one bit, with zero saying that the location
is (as you say) unpolluted.  Then you can use a compare-and-swap loop
to update the location only if it is unpolluted.

But maybe you need more data.  If so, you can have the data separately
(perhaps dynamically allocated, perhaps not, your choice), and then use
the compare-and-swap method above where NULL says unpolluted.

In some cases, an array-based FIFO queue works better.  There is a huge
number of subtlely different FIFOs.

And so on...

							Thanx, Paul

