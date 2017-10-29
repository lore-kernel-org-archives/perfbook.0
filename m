Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35786 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751790AbdJ2TOx (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 29
 Oct 2017 15:14:53 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9TJE7F0092859
 for <perfbook@vger.kernel.org>; Sun, 29 Oct 2017 15:14:53 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dwdtfy2nh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 29 Oct 2017 15:14:53 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 29 Oct
 2017 15:14:52 -0400
Date: Sun, 29 Oct 2017 12:14:49 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: algorithm that change a data structure without inflicting
 expensive cache misses
Reply-To: paulmck@linux.vnet.ibm.com
References: <dbe0006d-dc21-e397-c207-f9c1a37867b0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbe0006d-dc21-e397-c207-f9c1a37867b0@gmail.com>
Message-Id: <20171029191449.GK3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 29, 2017 at 11:24:55AM +0800, Yubin Ruan wrote:
> Hi,
> 
> This question is raised Quick Quiz 9.23 and I think it is impossible because
> any changes on a data structure will inevitably inflict cache miss (on other
> CPUs). The only way we can help is to make the reader *ignore* the cache miss,
> or do the invalidation proactively.
> 
> I cannot think of any existing algorithm. Can anyone provide any references
> (if that really exist)?

I can give you some "trick" answers:

o	The updater changes some part of the data structure that the
	readers happen not to be referencing at the time of the update.
	But this is a bit useless in real life, because one of the
	strengths of RCU is that the updaters have no idea what the
	readers are doing, and thus don't need expensive invalidations
	just to communicate their activities to each other.

o	The updater and all the readers are hardware threads within
	a single core, and therefore share all levels of cache, so that
	there can be no communications cache misses.  This actually
	works if your workload fits into a single core, but is quite
	useless otherwise.

	With one exception.  You might shard your workload over the
	cores, so that each core deals only with its own portion of
	the data structure, again avoiding communications cache
	misses.  Assuming, of course, that you can shart your data
	in such a way as to avoid load imbalances.

o	Your workload is running on a really old parallel machine that
	doesn't have cache.  But in that case, your performance will
	be truly horrible no matter what you do -- you could easily
	outperform the entirety of one of those old machines with a
	single hardware thread of a modern system.

If you do come up with a generally useful algorithm that manages
a read-write shared data structure without cache misses, I bet a
large number of people would be very interested.  ;-)

							Thanx, Paul

