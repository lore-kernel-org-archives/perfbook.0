Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42242 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752661AbdBMSyi (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 13
 Feb 2017 13:54:38 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1DInIjT124043
 for <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 13:54:38 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28ke4umgph-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 13 Feb 2017 13:54:37 -0500
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 13 Feb
 2017 11:54:37 -0700
Date: Mon, 13 Feb 2017 10:54:38 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Typo] Quick quiz B.13 typo
Reply-To: paulmck@linux.vnet.ibm.com
References: <7b82c257-889e-10bf-b6be-4042cd09aaae@gmail.com>
 <9ab95de8-fade-b685-9030-3031e73b6138@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ab95de8-fade-b685-9030-3031e73b6138@gmail.com>
Message-Id: <20170213185438.GH30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 13, 2017 at 09:36:31PM +0800, Yubin Ruan wrote:
> On 2017/2/13 21:24, Yubin Ruan wrote:
> >perfbook 2017.01.02a:
> >
> >Quick Quiz B.13:
> >    Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
> >interrupt handler, and that the CPU 2's line 9 is run
> >                                              ~~~~~~~~~
> >                                              typo here

I am guessing that you want s/is run/runs/ here.  Both variants are
grammatically correct, but I agree that "runs" is a bit nicer.

Or am I missing your point?

> >regards,
> >Yubin Ruan
> 
> Sorry for the poor indenting of my email, the typo is actually at
> "is run" at the end of the line.
> 
> Also, there is another typo in the answer to this quiz:
> 
>    "The assertion will need to written to ensure..."
> 
> should be
> 
>     "The...will need to be written to ensure..."

You lost me on this one.  I have no idea what change you are asking for.

							Thanx, Paul

> regards,
> Yubin Ruan
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

