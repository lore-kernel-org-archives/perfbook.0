Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48926 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726742AbeLRRD4 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 18 Dec 2018 12:03:56 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBIGxEll116467
        for <perfbook@vger.kernel.org>; Tue, 18 Dec 2018 12:03:55 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pf2gvyjpq-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 18 Dec 2018 12:03:55 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 18 Dec 2018 17:03:53 -0000
Date: Tue, 18 Dec 2018 09:03:54 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/2] Update code snippets in QQA of defer/rcuapi
Reply-To: paulmck@linux.ibm.com
References: <b34039b3-cf06-ef01-8021-c6839934dbeb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b34039b3-cf06-ef01-8021-c6839934dbeb@gmail.com>
Message-Id: <20181218170354.GR4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 19, 2018 at 12:01:07AM +0900, Akira Yokosawa wrote:
> >From 3908668ab195e3b0b230eb7a667b03009107ca24 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 18 Dec 2018 23:38:18 +0900
> Subject: [PATCH 0/2] Update code snippets in QQA of defer/rcuapi
> 
> Hi Paul,
> 
> Let's resume updating snippets.
> 
> Patch #1 updates a couple of snippets in QQA of defer/rcuapi.tex
> which I missed prior to the latest release.
> 
> Patch #2 is an independent fix to avoid duplicate entries in
> bibliography.

Applied and pushed, thank you!

> It turned out that update of code snippets in datastruct
> requires some enhancement of fcvextract.pl to handle labels of
> the form "/* \lnlbl{foo} */".
> Also, code samples under CodeSamples/datastruct/ have quite
> a few comment blocks, which should not appear in the resulting
> code snippets. Putting \fcvexclude for those comment lines would
> cause the code samples look ugly, so fcvextract.pl should be able to
> remove them automatically.
> 
> I'll submit the update in datastruct once the update of the script
> becomes ready.

Very good, looking forward to it!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (2):
>   defer/rcuapi: Employ new scheme for snippets in Answers to Quick
>     Quizzes
>   memorder: Avoid citing duplicate bib entries
> 
>  defer/rcuapi.tex      | 51 +++++++++++++++++++++------------------------------
>  memorder/memorder.tex |  2 +-
>  2 files changed, 22 insertions(+), 31 deletions(-)
> 
> -- 
> 2.7.4
> 

