Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48724 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728528AbeLTApZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 19 Dec 2018 19:45:25 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBK0U64i014711
        for <perfbook@vger.kernel.org>; Wed, 19 Dec 2018 19:45:24 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pfw03aa79-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 19 Dec 2018 19:45:24 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 20 Dec 2018 00:45:23 -0000
Date: Wed, 19 Dec 2018 16:45:25 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Parallel programming book query
Reply-To: paulmck@linux.ibm.com
References: <CAGnMLyzE5pjntT4Hz1PZaLKbz-2LSP=ziK60yWyNbwr4=WBdAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnMLyzE5pjntT4Hz1PZaLKbz-2LSP=ziK60yWyNbwr4=WBdAg@mail.gmail.com>
Message-Id: <20181220004525.GZ4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Mark Morrissey <markem@pdx.edu>
Cc: alexey.roytman@oracle.com, perfbook@vger.kernel.org

On Mon, Dec 17, 2018 at 01:04:37PM -0800, Mark Morrissey wrote:
> Hi Paul,
> 
> I am looking at your parallel programming book, 12/5/2018 version. In
> formula E.6, you use the floor function rather than the ceiling function.
> Is this deliberate or perhaps in error?

Good question!

The intent is that the "+ s - 1" in the numerator does the upwards part
of the rounding, and the floor function does the rest.

Or am I missing something here?  It should be possible to express this
in terms of the ceiling function, though that would be further removed
from C code implementing this equation.

Adding Alexey and the list on CC.  This is on page 423 (PDF page 435) of
https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.2018.12.08a.pdf

							Thanx, Paul

