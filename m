Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50173 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752137AbcL2Dn2 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 28
 Dec 2016 22:43:28 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBT3dB6a075461
 for <perfbook@vger.kernel.org>; Wed, 28 Dec 2016 22:43:28 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27mnhng5a2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 28 Dec 2016 22:43:28 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 28 Dec
 2016 20:43:27 -0700
Date: Wed, 28 Dec 2016 19:43:31 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Q] READ_ONCE(x)++
Reply-To: paulmck@linux.vnet.ibm.com
References: <0da22bdc-5d80-ee43-0abc-745abb8a9155@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0da22bdc-5d80-ee43-0abc-745abb8a9155@gmail.com>
Message-Id: <20161229034331.GA3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 29, 2016 at 11:54:02AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> As I'm not so familiar with Linux kernel programming,
> I found the following hunk in commit 7945ae1a06c5 difficult to grasp at first glance.
> 
> @@ -564,7 +584,7 @@ the other will wait until the first thread releases the lock.
>   38     exit(-1);
>   39   }
>   40   for (i = 0; i < 3; i++) {
> - 41     ACCESS_ONCE(x)++;
> + 41     READ_ONCE(x)++;
>   42     poll(NULL, 0, 5);
>   43   }
>   44   if (pthread_mutex_unlock(pmlp) != 0) {
> 
> "The name READ_ONCE() seems to imply it is used for read access, but what
> happens when it is used with a "++" operator?" was what I thought.
> 
> "ACCESS_ONCE(x)++" was already somewhat confusing for me.
> 
> Once you know its definition, you can see there is no problem. But it still
> looks strange...
> 
> Don't kernel programmers feel strangeness in "READ_ONCE(x)++"?
> 
> This is just a random question. But if you could add some explanation of the
> usage, that would be of help for novice programmers.

Heh!  Good catch, thank you!

This would give a compiler error in the Linux kernel (I think, anyway),
but worked by accident given the definitions perfbook uses.

I have fixed this with your Reported-by.

							Thanx, Paul

