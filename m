Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14772 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728368AbfGVMey (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 22 Jul 2019 08:34:54 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6MCRO1h147071
        for <perfbook@vger.kernel.org>; Mon, 22 Jul 2019 08:34:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2twbppd1f5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 22 Jul 2019 08:34:52 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6MCSs1A007358
        for <perfbook@vger.kernel.org>; Mon, 22 Jul 2019 08:34:51 -0400
Date: Mon, 22 Jul 2019 05:34:51 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/7] Collection of small fixes and updates
Message-ID: <20190722123451.GD14271@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Sun, Jul 21, 2019 at 08:59:50AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> (Cc: Junchang, Elad)
> 
> I've got somewhat distracted and couldn't properly compose change logs
> of patches I collected in a work-in-progress branch.

No need to apologize, you might have noticed that I have been more
distracted from this project than I would have liked.  Good stuff,
thank you!

							Thanx, Paul

> Finally I managed to update the style guide to reflect enhancements in
> fcvextract.pl and amend the commit logs.
> 
> Patch #1 was the one presented to Junchang as an example to combine
> two code fragments in a code snippet.
> Patch #2 applies the new scheme to another fragment in rcu_nest.h,
> which was updated by Junchang.
> Patch #3 fixes type reported by Elad.
> Patch #4 updates FAQ-BUILD.txt for F29 and F30 users.
> Patch #5 removes remnant of quantum computing.
> Patch #6 applies the new scheme to another fragment in rcu.h, which
> was also updated by Junchang.
> Patch #7 is the update of style guide
> 
> Patches #1, #2, #3, and #6 are CC'd to Junchang or Elad.
> I don't think their Acks are musts in these cases, but would highly
> appreciate them.
> 
>         Thanks, Akira
> --
> Akira Yokosawa (7):
>   toyrcu: Convert Listing B.1 to new scheme
>   toyrcu: Extract Listing B.15 from rcu_nest.h
>   toolsoftrade: Fix typo
>   FAQ-BUILD: Update for recent Fedora releases
>   howto: Stop mentioning quantum computing
>   toyrcu: Extract Listing B.13 from rcu.h
>   styleguide: Update description of available options to \begin{snippet}
> 
>  CodeSamples/defer/rcu.h                 |  2 +
>  CodeSamples/defer/rcu_lock.c            |  2 +
>  CodeSamples/defer/rcu_lock.h            |  2 +
>  CodeSamples/defer/rcu_nest.h            |  2 +
>  FAQ-BUILD.txt                           |  9 +--
>  appendix/styleguide/samplecodesnippet.c |  2 +-
>  appendix/styleguide/styleguide.tex      | 76 +++++++++++++++----------
>  appendix/toyrcu/toyrcu.tex              | 50 ++--------------
>  howto/howto.tex                         |  2 +-
>  toolsoftrade/toolsoftrade.tex           |  2 +-
>  10 files changed, 66 insertions(+), 83 deletions(-)
> 
> -- 
> 2.17.1
> 

