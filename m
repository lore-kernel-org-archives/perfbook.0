Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38940 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725942AbfD0Rpk (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 Apr 2019 13:45:40 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3RHhCMp013798
        for <perfbook@vger.kernel.org>; Sat, 27 Apr 2019 13:45:39 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2s4kkmbhgq-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 27 Apr 2019 13:45:39 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 27 Apr 2019 18:45:37 +0100
Date: Sat, 27 Apr 2019 10:45:34 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Cost of atomic operations on new hardware
Reply-To: paulmck@linux.ibm.com
References: <CAJbg=FWZhjXARBNou6XZ55fdvRsgABR19p8pytYB+SrKFtwWxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FWZhjXARBNou6XZ55fdvRsgABR19p8pytYB+SrKFtwWxQ@mail.gmail.com>
Message-Id: <20190427174534.GS3923@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 26, 2019 at 07:06:10AM -0400, Elad Lahav wrote:
> Hello,
> 
> Section 3.1.3 contains the following statement:
> 
> "Fortunately, CPU designers have focused heavily on atomic operations,
> so that as of early 2014 they have greatly reduced their overhead."
> 
> My experience with very recent hardware is that the *relative* cost of
> atomic operations has actually increased significantly. It seems that
> hardware designers, in their attempt to optimize performance for
> certain workloads, have produced hardware in which the "anomalous"
> conditions (atomic operations, cache misses, barriers, exceptions)
> incur much higher penalties than in the past. I assume that this is
> primarily the result of more intensive speculation and prediction.

Some of the early 2000s systems had -really- atomic operations, but I
have not kept close track since 2014.

How would you suggest that this be measured?  Do you have access to
a range of hardweare that would permit us to include something more
definite and measurable?

							Thanx, Paul

