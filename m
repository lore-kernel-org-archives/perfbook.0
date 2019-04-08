Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58106 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726808AbfDHSmy (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 8 Apr 2019 14:42:54 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x38IdFr0098303
        for <perfbook@vger.kernel.org>; Mon, 8 Apr 2019 14:42:53 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2rr9hdx2km-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 08 Apr 2019 14:42:52 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 8 Apr 2019 19:42:51 +0100
Date: Mon, 8 Apr 2019 11:42:50 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/3] formal/dyntickrcu: Followup changes
Reply-To: paulmck@linux.ibm.com
References: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
 <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36421da6-4c59-597a-660f-f7ddf1d8835c@gmail.com>
Message-Id: <20190408184250.GW14111@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 09, 2019 at 12:44:20AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is a followup patch set relative to the workaround patch
> in this mail thread ("formal/dyntickrcu: Mitigate ugliness around
> tall inline snippets").
> 
> Looks like you have not pushed it yet, though.

You are right, I did miss that step!  Fixed.

> It turns out that I misunderstood the working of \AtBeginEnvironment{}
> command, and patch #1 fixes the way to redefine VerbatimN environment.
> I wanted to add a Fixes: tag, but I don't have the commit id, so
> I put a stub of "xxxxxxxxxxxx" in the change log. Can you replace it
> with the actual commit id?

Done!

> Patches #2 and #3 add references to the git commits of the fixes to
> bugs in preemptive RCU found by verification. The actual changes were
> a little bit different from what are presented in inline snippets,
> but I left the snippets as are.  As they are more than a decade
> old, adding references should help the context look more real.

I reworked #2 a bit to place the new citations in time order (along
with another that I had misplaced).

Queued and this time really pushed!  ;-)  Thank you!!!

						Thanx, Paul

>         Thanks, Akira
> -- 
> Akira Yokosawa (3):
>   formal/dyntickrcu: Fix the way to redefine VerbatimN
>   RCU.bib: Add entries of git commits of dyntickrcu fixes
>   formal/dyntickrcu: Cite git commits of dyntickrcu fixes
> 
>  bib/RCU.bib           | 22 ++++++++++++++++++++++
>  formal/dyntickrcu.tex | 12 ++++--------
>  perfbook.tex          |  5 ++++-
>  3 files changed, 30 insertions(+), 9 deletions(-)
> 
> -- 
> 2.17.1
> 
> 

