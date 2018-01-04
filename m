Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60942 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751766AbeADARd (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 3
 Jan 2018 19:17:33 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id w040E5GS070657
 for <perfbook@vger.kernel.org>; Wed, 3 Jan 2018 19:17:33 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2f982y2x6w-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 03 Jan 2018 19:17:33 -0500
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 3 Jan 2018
 19:17:32 -0500
Date: Wed, 3 Jan 2018 16:18:04 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] count: Get rid of ACCESS_ONCE
Reply-To: paulmck@linux.vnet.ibm.com
References: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
Message-Id: <20180104001804.GA13670@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Dec 23, 2017 at 12:42:04PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set removes ACCESS_ONCE() in Chapter 5.
> (Yes, I saw the update in todo.txt.)
> 
> Patch #1 updates code snippets and code under CodeSamples/count/.
> Patch #2 updates text in Chapter 5 as well as Section 4.2.5 to adjust
> context.  Citations in QQA to LWN article "ACCESS_ONCE()" is
> replaced by footnotes referencing definition in Section 4.2.5.
> Patch #3 adds a couple of git commits to bibliography to be cited
> by Patch #4.
> Patch #4 adds a Quick Quiz in Section 4.2.5 to put a brief history of
> ACCESS_ONCE().
> 
> As ACCESS_ONCE() has been removed during Linux 4.15 merge window,
> it would be a good chance to put some memorial words in perfbook.
> In patch #4, I put them in a QQA. An alternative would be to
> put them in a dedicated section on "compiler barriers" in Section 4.2 or 4.3.
> 
> In any case, the wording of the brief history needs some polishing
> by the inventor of ACCESS_ONCE(). So I don't expect patch #4 to be
> applied as is.
> 
> BTW, I thought twice about citing the git commit adding ACCESS_ONCE()
> in RCU code because of its title. Are you OK with it being listed in
> bibliography?

I queued these, thank you!

I reworked the answer to the new quick quiz.  We might want to revisit
the bibliography entries, but we are very likely going to have to cite
git commits, so we might as well get started.  ;-)

							Thanx, Paul

>       Thanks, Akira
> --
> Akira Yokosawa (4):
>   count: Get rid of ACCESS_ONCE() in code snippet
>   count: Get rid of ACCESS_ONCE() in text
>   Update bibliography
>   toolsoftrade: Add quick quiz on ACCESS_ONCE()
> 
>  CodeSamples/count/count_lim_sig.c | 26 ++++++++++-----------
>  CodeSamples/count/counttorture.h  |  8 +++----
>  CodeSamples/count/limtorture.h    | 18 +++++++-------
>  bib/RCU.bib                       | 33 +++++++++++++++++++++++++-
>  count/count.tex                   | 45 ++++++++++++++++++++---------------
>  toolsoftrade/toolsoftrade.tex     | 49 ++++++++++++++++++++++++++++-----------
>  6 files changed, 119 insertions(+), 60 deletions(-)
> 
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

