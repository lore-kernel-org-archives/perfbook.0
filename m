Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58916 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1731059AbeGWDgt (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 22
 Jul 2018 23:36:49 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6N2XUa2136297
 for <perfbook@vger.kernel.org>; Sun, 22 Jul 2018 22:37:55 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2kcke8wweg-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 22 Jul 2018 22:37:54 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 22 Jul
 2018 22:37:53 -0400
Date: Sun, 22 Jul 2018 19:37:53 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Memory barrier pairing question
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJ2Qj5qej+kBZxpy4cUbKVE3NJAnOSc9FZ5wur_rKVU_rnYhVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJ2Qj5qej+kBZxpy4cUbKVE3NJAnOSc9FZ5wur_rKVU_rnYhVw@mail.gmail.com>
Message-Id: <20180723023753.GJ12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Artem Polyakov <artpol84@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 22, 2018 at 06:42:45PM -0700, Artem Polyakov wrote:
> Hello,
> I have a question about the following scenario (considering POWER arch):
> 
> initial { x = 0; y = 0; }
> 
> thread0 {
>     x = 1;
>     lwsync;
>     y = 1;
> }
> 
> thread1 {
>     a = y;
>     isync;
>     b = x;
> }
> 
> Because "isync" is not a memory barrier this example doesn't have
> read/write barrier pairing. However, if I understand correctly, lwsync will
> ensure that "x = 1" will become visible to thread1 before lwsync is done
> and before "y = 1" will become visible. So "isync" here can be sort of
> control dependency as it ensures that "a = y" will be performed before "b =
> x" and even will flush the pipeline according to POWER9 spec.
> 
> Can someone comment on this scenario and tell if I am right or where I am
> wrong.

I am not a Power hardware architect, but here is my understanding.

The isync waits until all the prior instructions "execute", but for
a limited definition of "execute".  One way to think of isync is as
an instruction that does not allow subsequent instructions to start
until it can be proven that execution really will reach the isync
instruction.

So given a load, how could it be that execution would be prevented
from reaching the isync instruction?  One possibility is a SEGV.
But once address translation completes successfully, SEGV cannot
happen.  So isync doesn't need to wait for the load to return an
actual value, but instead only for its execution to reach a point
where the hardware knows that a value will eventually be returned.

And that is why you need a compare and conditional branch before the
isync to ensure that the load has completed.  In that case, the
hardware cannot prove that execution will actually reach the isync
until the load completes, the compare sets the condition code,
and the branch condition is evaluated.  Therefore, anything after
the compare-branch-isync series cannot start executing until after
the load returns its value.

Make sense, or am I missing the point of your question?

							Thanx, Paul

