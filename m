Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56846 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1759800AbdADBkI (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 3
 Jan 2017 20:40:08 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id v041dMHO098465
 for <perfbook@vger.kernel.org>; Tue, 3 Jan 2017 20:40:07 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27rercv4ps-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 03 Jan 2017 20:40:07 -0500
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 3 Jan 2017
 18:40:07 -0700
Date: Tue, 3 Jan 2017 17:40:04 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 00/13] Remove \co{} commands in tables
Reply-To: paulmck@linux.vnet.ibm.com
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Message-Id: <20170104014004.GG3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 04, 2017 at 10:15:40AM +0900, Akira Yokosawa wrote:
> >From d07bf0df57c597c22de9a7c159f10b0247cea8c2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 4 Jan 2017 08:51:15 +0900
> Subject: [PATCH 00/13] Remove \co{} commands in tables
> 
> \co{} command confuses column width estimation of tabular environment.
> By removing \co{} commands in tables, bogus "~"s for manual width
> adjustment can be removed.
> 
> Patch 1 introduces an alternative command \tco{} to be used in tables.
> Patches 2--8 remove \co{} commands by using \tco{} or removing unnecessary
> commands.
> Patch 9 removes another "~" and uses \vspace{} instead.
> Patches 10--13 do additional font tweaks. It looks better for me if
> headers of tables such as "Thread 1" and "CPU 1" are typeset in normal font
> of the text (Times Roman). Patch 13, which tweaks font of non-code words in
> table, may be an excessive tweak. Whether or not to apply it is up to the
> editor.

I queued and pushed these, thank you!

I am a little concerned about the added "\_" instances that show up
in some of the tables, though.  Does it work to use \tco{} or similar
to avoid these?  My concern is frustration for people searching the
.tex source for tables containing (say) smp_wmb().

							Thanx, Paul

> --
> Akira Yokosawa (13):
>   Define \tco{} command to be used in table
>   rcufundamental: Rewrite table 'RCU Publish and Subscribe Primitives'
>   rcuapi: Rewrite table 'RCU Wait-to-Finish APIs'
>   rcuapi: Rewrite table 'RCU Publish-Subscribe and Version Maintenance
>     APIs'
>   whichtochoose: Rewrite table 'Which Deferred Technique to Choose?'
>   memorybarriers: Remove \co{} in tabular env
>   memorybarriers: Use \verb in table 'Lock-Based Critical Sections'
>   whymemorybarriers: Remove \co{} in tabular env
>   memorybarriers: Replace nbsp with \vspace
>   Add \nf{} command to go back to normal font
>   memorybarriers: Add \nf{} command to table header
>   whymemorybarriers: Add \nf{} command to table header
>   memorybarriers: Add \nf{} command to descriptive words in table
> 
>  advsync/memorybarriers.tex           | 187 +++++++++++++++++------------------
>  appendix/whymb/whymemorybarriers.tex |  70 ++++++-------
>  defer/rcuapi.tex                     | 110 +++++++++------------
>  defer/rcufundamental.tex             |  18 ++--
>  defer/whichtochoose.tex              |  20 ++--
>  perfbook.tex                         |   6 +-
>  6 files changed, 200 insertions(+), 211 deletions(-)
> 
> -- 
> 2.7.4
> 

