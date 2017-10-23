Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45586 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750869AbdJWCYf (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 22 Oct 2017 22:24:35 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9N2OICp108206
 for <perfbook@vger.kernel.org>; Sun, 22 Oct 2017 22:24:35 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2drt9cevr5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 22 Oct 2017 22:24:34 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 22 Oct
 2017 22:24:34 -0400
Date: Sun, 22 Oct 2017 19:24:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Update table layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
Message-Id: <20171023022430.GJ3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 23, 2017 at 12:20:14AM +0900, Akira Yokosawa wrote:
> >From d224db4bfed5d4ce0639062a920bafc6f9442e16 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 22 Oct 2017 23:55:49 +0900
> Subject: [PATCH 0/5] Update table layout
> 
> Hi Paul,
> 
> My first idea was to add a make target for "table captions at the top".
> But I changed my mind and promoted the layout as default.
> Instead, I added a target "perfbook-tcb.pdf" (tcb: Table Caption Bottom),
> which keeps the caption at the bottom.
> 
> Patch #1 does the change in perfbook.tex and Makefile.
> 
> Patches #2 and #3 are minor fixes I noticed while updating tables.
> 
> Patch #4 updates most tables to use the new table layout experimented in
> Style Guide for a while.  It contains changes to use "S" column specifier
> provided by the "siunitx" package.
> 
> Patch #5 converts a table into a figure drawn by tabular.
> 
> There remains several tables not yet touched. They are complex and large
> ones. They need extra work to use the new scheme.
> 
> NOTE: Table 13.1 does not contain legends and does not use subscripts
> as shown in Table D.5 at the moment. In the text, it looks OK to me.
> 
> Thoughts?

At a first scan, this all looks good.  There are a few remaining
tables in the old format, including a couple that we discussed earlier
as being quite complex.  Which should be fine, for the time being,
at least.  But what are your thoughts on the remaining old-style tables?

Queued and pushed, thank you!

							Thanx, Paul

>       Thanks, Akira
> --
> Akira Yokosawa (5):
>   Move caption of table to top
>   Define \twocolumnwidth for 1c layout
>   Use \O{} macro for 'order-of'
>   Update tables using booktabs and alternate-row coloring scheme
>   datastruct: Convert 'NUMA Topology of System Under Test' to figure
> 
>  Makefile                           |  6 ++-
>  SMPdesign/SMPdesign.tex            | 10 +++--
>  advsync/rt.tex                     |  8 ++--
>  appendix/questions/after.tex       | 25 +++++++++----
>  appendix/styleguide/styleguide.tex | 20 ++++++----
>  count/count.tex                    | 54 ++++++++++++++++-----------
>  cpu/overheads.tex                  | 76 +++++++++++++++++---------------------
>  datastruct/datastruct.tex          | 23 ++++++++----
>  defer/rcuapi.tex                   | 16 ++++----
>  defer/rcufundamental.tex           | 16 ++++----
>  defer/rcuusage.tex                 | 10 +++--
>  defer/whichtochoose.tex            | 27 +++++---------
>  formal/spinhint.tex                | 68 +++++++++++++++++-----------------
>  future/QC.tex                      | 75 +++++++++++++++++++------------------
>  memorder/memorder.tex              |  8 ++--
>  perfbook.tex                       | 17 +++++++++
>  together/refcnt.tex                | 25 +++++++------
>  17 files changed, 266 insertions(+), 218 deletions(-)
> 
> -- 
> 2.7.4
> 

