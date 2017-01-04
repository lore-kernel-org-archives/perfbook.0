Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57024 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S968643AbdADQ2G (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 4
 Jan 2017 11:28:06 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id v04G8lDe045605
 for <perfbook@vger.kernel.org>; Wed, 4 Jan 2017 11:28:05 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27s258xpqh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 04 Jan 2017 11:28:05 -0500
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 4 Jan 2017
 09:28:04 -0700
Date: Wed, 4 Jan 2017 08:28:01 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Use \tco{} for API names inside of tables
Reply-To: paulmck@linux.vnet.ibm.com
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
 <20170104014004.GG3742@linux.vnet.ibm.com>
 <97f7304e-d989-1b21-0fed-465d540dd66d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f7304e-d989-1b21-0fed-465d540dd66d@gmail.com>
Message-Id: <20170104162801.GM3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 04, 2017 at 08:35:25PM +0900, Akira Yokosawa wrote:
> On 2017/01/03 17:40:04 -0800, Paul E. McKenney wrote:
> > On Wed, Jan 04, 2017 at 10:15:40AM +0900, Akira Yokosawa wrote:
> >> >From d07bf0df57c597c22de9a7c159f10b0247cea8c2 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Wed, 4 Jan 2017 08:51:15 +0900
> >> Subject: [PATCH 00/13] Remove \co{} commands in tables
> >>
> >> \co{} command confuses column width estimation of tabular environment.
> >> By removing \co{} commands in tables, bogus "~"s for manual width
> >> adjustment can be removed.
> >>
> >> Patch 1 introduces an alternative command \tco{} to be used in tables.
> >> Patches 2--8 remove \co{} commands by using \tco{} or removing unnecessary
> >> commands.
> >> Patch 9 removes another "~" and uses \vspace{} instead.
> >> Patches 10--13 do additional font tweaks. It looks better for me if
> >> headers of tables such as "Thread 1" and "CPU 1" are typeset in normal font
> >> of the text (Times Roman). Patch 13, which tweaks font of non-code words in
> >> table, may be an excessive tweak. Whether or not to apply it is up to the
> >> editor.
> > 
> > I queued and pushed these, thank you!
> > 
> > I am a little concerned about the added "\_" instances that show up
> > in some of the tables, though.  Does it work to use \tco{} or similar
> > to avoid these?  My concern is frustration for people searching the
> > .tex source for tables containing (say) smp_wmb().
> 
> I see your point.  Using \tco{} for API names should work.
> A patch set follows.
> 
> In preparing this, I also found a long-lived typo in Table "Memory Barrier
> Example 3". Patch 2 fixes it.

Very good, queued and pushed!

							Thanx, Paul

> [snip]
> 
> --
> Akira Yokosawa (2):
>   Use \tco{} for API names inside of tables
>   Fix typo smb_wmb() -> smp_wmb()
> 
>  advsync/memorybarriers.tex           | 20 ++++++++++----------
>  appendix/whymb/whymemorybarriers.tex | 14 +++++++-------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> -- 
> 2.7.4
> 

