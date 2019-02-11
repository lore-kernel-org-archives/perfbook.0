Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51304 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727482AbfBKTeN (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 11 Feb 2019 14:34:13 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x1BJTC0h192075
        for <perfbook@vger.kernel.org>; Mon, 11 Feb 2019 14:34:12 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2qkexn0x68-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 11 Feb 2019 14:34:11 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 11 Feb 2019 19:34:11 -0000
Date: Mon, 11 Feb 2019 11:34:07 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/3] formal/spinhint: Add result of 3 readers 3 updaters
 QRCU Spin run
Reply-To: paulmck@linux.ibm.com
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
 <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
 <20190207091757.GE4240@linux.ibm.com>
 <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
 <a83e948f-d241-be30-733b-87975452fd1a@gmail.com>
 <c5ee9c83-e89a-c3d2-e293-21396acb7db8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5ee9c83-e89a-c3d2-e293-21396acb7db8@gmail.com>
Message-Id: <20190211193406.GP4240@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Feb 12, 2019 at 12:28:12AM +0900, Akira Yokosawa wrote:
> Paul,
> 
> There was a typo in the commit log.
> 
> On 2019/02/12 00:11:23 +0900, Akira Yokosawa wrote:
> > From fe701731c7296b90deae52747f5f3be556511289 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Sun, 10 Feb 2019 00:02:26 +0900
> > Subject: [PATCH 1/3] formal/spinhint: Add result of 3 readers 3 updaters QRCU Spin run
> > 
> > By using the compiler flag "-DMA=N", run of qrcu.spin with 3 readers
> > and 3 updaters can be completed with the memory usage of 6.5GHz.
> 
>                                                               ^^^^
>                                                            6.5GB.
> 
> Can you amend it for me?

Done!  I queued and pushed all three, and also pushed out some minor
wordsmithing.  Please let me know if I messed anything up.

And nice approach showing the strengths and weaknesses of the two
approaches, good stuff, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > This commit adds the result and the command used to run the
> > verification. A Quick Quiz is added to present an indirect
> > evidence of search completeness.
> > 
> > As the compiler flag "-DCOLLAPSE" generates much faster code,
> > memory usage table with "-DCOLLAPSE" is kept. The complete
> > table for the runs with the flag "-DMA=N" is added as another
> > table.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  .../formal/promela/atomicincrement.spin.lst        |   2 +-
> >  CodeSamples/formal/promela/increment.spin.lst      |   2 +-
> >  CodeSamples/formal/promela/lock.spin.lst           |   2 +-
> >  CodeSamples/formal/promela/qrcu.spin.33ma.lst      |  37 +++++
> >  .../formal/promela/qrcu.spin.col-ma.diff.lst       |  48 +++++++
> >  formal/spinhint.tex                                | 150 ++++++++++++++++++++-
> >  6 files changed, 234 insertions(+), 7 deletions(-)
> >  create mode 100644 CodeSamples/formal/promela/qrcu.spin.33ma.lst
> >  create mode 100644 CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst
> > 
> [...]
> 

