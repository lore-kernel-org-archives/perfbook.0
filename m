Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42522 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1753076AbdBMTAq (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 13 Feb 2017 14:00:46 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1DIpEVW100365
 for <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 14:00:35 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 28kjas8fj3-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 13 Feb 2017 14:00:35 -0500
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 13 Feb
 2017 12:00:34 -0700
Date: Mon, 13 Feb 2017 11:00:34 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Question] Quick Quiz B.13 help
Reply-To: paulmck@linux.vnet.ibm.com
References: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
Message-Id: <20170213190034.GI30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 13, 2017 at 09:41:46PM +0800, Yubin Ruan wrote:
> Quick quiz B.13:
>     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
> interrupt handler, and that the CPU 2's line 9 is running at process
> level. What changes, if any, are required to enable the code to work
> correctly, in other words, to prevent the assertion from firing?
> 
> I can not come up with any practical material for this quiz, because
> I don't really know the implication of "in an interrupt handler",
> and "running in process level".
> 
> The answer hints that one would need to ensure that the load of "e"
> precedes that of "a" and hint the Linux kernel implementation
> "barrier()". But how is that exactly? I am going to invest some time
> into the Linux kernel implementation. But I would really appreciate
> some hints about this, as I don't have so much kernel development
> experience before.

I suggest reading an operating-system textbook.  The ones I have are quite
old, but here they are anyway in bibtex format.  There are probably newer
editions of some of them.  The short answer on interrupts is that they
force process-level processing to pause while the "interrupt handler"
completes.

							Thanx, Paul

------------------------------------------------------------------------

@book{CorbetRubiniKroahHartman
,author="Jonathan Corbet and Alessandro Rubini and Greg Kroah-Hartman"
,title="Linux Device Drivers"
,publisher="O'Reilly Media, Inc."
,year="2005"
,edition="Third"
}

@book{Silberschatz98a
,author="Abraham Silberschatz and Peter Baer Galvin"
,title="Operating System Concepts"
,publisher="Addison-Wesley"
,year="1998"
,edition="Fifth"
}

@book{Vahalia96
,author="Uresh Vahalia"
,title="{UNIX} Internals: The New Frontiers"
,publisher="Prentice Hall"
,year="1996"
}

