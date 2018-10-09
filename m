Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37100 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725759AbeJILJY (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 9 Oct 2018 07:09:24 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w993sVhF118362
        for <perfbook@vger.kernel.org>; Mon, 8 Oct 2018 23:54:31 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2n0m0d1h5k-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 08 Oct 2018 23:54:31 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 8 Oct 2018 23:54:31 -0400
Date: Mon, 8 Oct 2018 20:54:27 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/5] count: Employ new code-snippet scheme (cont.)
Reply-To: paulmck@linux.ibm.com
References: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Message-Id: <20181009035427.GH2674@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 08, 2018 at 10:40:51AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is the continuation of changes to snippets in the "count"
> chapter.
> 
> To help your review of the changes regarding READ_ONCE()/WRITE_ONCE(),
> I split the patches to the ones just applying the scheme and
> the ones modifying READ_ONCE()/WRITE_ONCE().
> 
> Note on patch #3: It fixes the segfault observed in count_tstat.
> However, I'm not sure if you want to take it or not. The fail can
> be thought of as a Quick Quiz within the Answer to the Quick Quiz.
> So keeping it as is would also be reasonable.
> 
>         Thanks, Akira

They look good at first glance, so I have queued and pushed them.
Thank you very much!

							Thanx, Paul

> --
> Akira Yokosawa (5):
>   count: Employ new scheme for snippet of count_end and count_tstat
>   count: Fix uses of READ/WRITE_ONCE()s in count_end and count_tstat
>   count: Tweak counttorture.h to avoid segfault
>   count: Employ new scheme for snippet of count_lim
>   count: Fix uses of READ/WRITE_ONCE() in count_lim
> 
>  CodeSamples/count/count_end.c    |  53 ++---
>  CodeSamples/count/count_lim.c    | 147 +++++++------
>  CodeSamples/count/count_tstat.c  |  27 +--
>  CodeSamples/count/counttorture.h |  21 +-
>  count/count.tex                  | 437 +++++++++++++--------------------------
>  5 files changed, 287 insertions(+), 398 deletions(-)
> 
> -- 
> 2.7.4
> 

