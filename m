Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55458 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727488AbeJUArx (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 20 Oct 2018 20:47:53 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9KGYBKk005667
        for <perfbook@vger.kernel.org>; Sat, 20 Oct 2018 12:36:51 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2n7waht29u-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 20 Oct 2018 12:36:51 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 20 Oct 2018 12:36:50 -0400
Date: Sat, 20 Oct 2018 09:36:48 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Reply-To: paulmck@linux.ibm.com
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
Message-Id: <20181020163648.GA2674@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 21, 2018 at 12:53:17AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I just noticed occasional error of count_lim_atomic.c on POWER8 at current master.
> As I've recently touched the code under Codesamples/count/, I also tested on
> the tag "v2017.11.22a", and saw the same behavior.
> 
> The POWER8 virtual machine is Ubuntu 16.04.
> 
> Example output:
> 
> $ ./count_lim_atomic 6 uperf 1
> !!! Count mismatch: 0 counted vs. 8 final value
> n_reads: 0  n_updates: 26038000  nreaders: 0  nupdaters: 6 duration: 240
> ns/read: nan  ns/update: 55.3038
> 
> $ ./count_lim_atomic 6 perf 1
> !!! Count mismatch: 0 counted vs. 11 final value
> n_reads: 287000  n_updates: 1702000  nreaders: 6  nupdaters: 1 duration: 240
> ns/read: 5017.42  ns/update: 141.011
> 
> As you see, the final count check of zero fails even when nupdaters == 1.

Yow!!!  Thank you for checking this!

That said, it probably wasn't really single threaded, at least assuming
that you had at least one reader.

> I have no idea what's wrong in count_lim_atomic.c.
> 
> Can you look into this? There might be something wrong in the header file
> under CodeSamples/arch-ppc64.h.

There isn't much in that file anymore because we now rely on the gcc
intrinsics for the most part.  Which might well be the problem, depending
on compiler versions and so on.

Could you please send me the output of "objdump -d" on count_lim_atomic.o?
And on the full count_lim_atomic binary, just in case gcc decides to be
tricky in its code generation?

In the meantime, there might well be a generic bug in count_lim_atomic.c
that just happens not to be exercised on x86, and I will look into that.
I am on travel next week, so will be in odd timezones, but should have
at least a little useful airplane time to look into this.

> On x86_64, I've never seen the count mismatch.

Well, David Goldblatt's first C++11 signal-based litmus test wouldn't fail
on PowerPC but did on x86, so I guess that they are now even.  ;-)

							Thanx, Paul

