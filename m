Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41955 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1758420AbdEAP6U (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 1
 May 2017 11:58:20 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v41Frjl9073090
 for <perfbook@vger.kernel.org>; Mon, 1 May 2017 11:58:17 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2a663a54jj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 01 May 2017 11:58:16 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 1 May 2017
 11:58:15 -0400
Date: Mon, 1 May 2017 08:58:16 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: The weird re-ordering issue of the Alpha arch'
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170429142605.GC2536@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170429142605.GC2536@master>
Message-Id: <20170501155816.GB3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 29, 2017 at 10:26:05PM +0800, Yubin Ruan wrote:
> Hi, 
> Remember a few weeks ago we discussed about the weird re-ordering issue of the
> Alpha arch', which is mentioned in Appendix.B in the perfbook? I got really
> confused at that moment. Paul gave me a reference to a SGI webpage(an email
> discussion actually), but that wasn't so understandable. Today I found a few
> words from Kourosh Gharachorloo[1], which are very instructional for me:
> 
>     For Alpha processors, the anomalous behavior is currently only possible on a
>     21264-based system. And obviously you have to be using one of our
>     multiprocessor servers. Finally, the chances that you actually see it are very
>     low, yet it is possible.
>     
>     Here is what has to happen for this behavior to show up. Assume T1 runs on P1
>     and T2 on P2. P2 has to be caching location y with value 0. P1 does y=1 which
>     causes an "invalidate y" to be sent to P2. This invalidate goes into the
>     incoming "probe queue" of P2; as you will see, the problem arises because
>     this invalidate could theoretically sit in the probe queue without doing an
>     MB on P2. The invalidate is acknowledged right away at this point (i.e., you
>     don't wait for it to actually invalidate the copy in P2's cache before
>     sending the acknowledgment). Therefore, P1 can go through its MB. And it
>     proceeds to do the write to p. Now P2 proceeds to read p. The reply for read
>     p is allowed to bypass the probe queue on P2 on its incoming path (this allow
>     s replies/data to get back to the 21264 quickly without needing to wait for
>     previous incoming probes to be serviced). Now, P2 can derefence P to read the
>     old value of y that is sitting in its cache (the inval y in P2's probe queue
>     is still sitting there).
>     
>     How does an MB on P2 fix this? The 21264 flushes its incoming probe queue
>     (i.e., services any pending messages in there) at every MB. Hence, after the
>     read of P, you do an MB which pulls in the inval to y for sure. And you can
>     no longer see the old cached value for y.
>     
>     Even though the above scenario is theoretically possible, the chances of
>     observing a problem due to it are extremely minute. The reason is that even
>     if you setup the caching properly, P2 will likely have ample opportunity to
>     service the messages (i.e., inval) in its probe queue before it receives the
>     data reply for "read p". Nonetheless, if you get into a situation where you
>     have placed many things in P2's probe queue ahead of the inval to y, then it
>     is possible that the reply to p comes back and bypasses this inval. It would
>     be difficult for you to set up the scenario though and actually observe the
>     anomaly.
>     
>     The above addresses how current Alpha's may violate what you have shown.
>     Future Alpha's can violate it due to other optimizations. One interesting
>     optimization is value prediction.
> 
> What I want to say is that next time you update the perfbook, you can take a few
> words from it. I mean, you can adopt the same schema like "Assume T1 runs on P1
> and T2 on P2. P2 has to be caching location y with value 0....". That would make
> the perfbook more understandable :)

Thank you -very- much, Yubin!  I was not aware of this, and you are quite
correct, it is -much- better than the current citation.

							Thanx, Paul

> Regards,
> Yubin
> 
> [1]: https://www.cs.umd.edu/~pugh/java/memoryModel/AlphaReordering.html
> 

