Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60140 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726070AbfAZQQE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 26 Jan 2019 11:16:04 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x0QGE9Pr069051
        for <perfbook@vger.kernel.org>; Sat, 26 Jan 2019 11:16:02 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2q8jk6x5nn-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 26 Jan 2019 11:16:02 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 26 Jan 2019 16:16:01 -0000
Date: Sat, 26 Jan 2019 08:15:56 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/3] Add script to detect collisions in commandchars
Reply-To: paulmck@linux.ibm.com
References: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
Message-Id: <20190126161556.GH4240@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 27, 2019 at 12:07:32AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I mentioned in an earlier patch submission that to add collision
> check of commandchars in fcvextract.pl was on my to-do list.
> 
> It turned out that fcvextract.pl is already complicated and
> I changed my mind to add a separate script to check .fcv files for
> the collisions.
> 
> Patch #1 adds the script as utilities/checkfcv.pl.
> Patch #2 adds the invocations of the script in Makefile. It also
> suppresses the echo of commands in the recipes.
> Patch #3 fixes a couple of collisions detected by the script.
> 
> The two collisions were made by myself.  This automatic check
> looks promising to me.

Looks promising, let's see how it goes -- queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   Add checkfcv.pl
>   Makefile: Invoke checkfcv.pl in -> .fcv recipes
>   CodeSamples: Fix commandchars collision
> 
>  CodeSamples/defer/route_hazptr.c                   |  2 +-
>  .../formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus    |  2 +-
>  Makefile                                           |  8 ++-
>  utilities/checkfcv.pl                              | 78 ++++++++++++++++++++++
>  4 files changed, 85 insertions(+), 5 deletions(-)
>  create mode 100755 utilities/checkfcv.pl
> 
> -- 
> 2.7.4
> 

