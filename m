Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40214 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751053AbdHMR00 (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 13
 Aug 2017 13:26:26 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7DHO15m009222
 for <perfbook@vger.kernel.org>; Sun, 13 Aug 2017 13:26:25 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ca0ek1976-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 13 Aug 2017 13:26:25 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 13 Aug
 2017 13:26:24 -0400
Date: Sun, 13 Aug 2017 10:26:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Style guide updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
Message-Id: <20170813172624.GA7017@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Aug 13, 2017 at 12:27:52PM +0900, Akira Yokosawa wrote:
> >From 24d4de52c8186c1ec1787e76d13e22646d804a53 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 13 Aug 2017 11:00:48 +0900
> Subject: [PATCH 0/5] Style guide updates
> 
> Hi Paul,
> 
> The style guide needs some updates regarding recent changes in
> litmus tests in memory barriers section. (Patch #3)
> Also I recovered the tweaks in table layout. I added another
> option to color rows alternately. (Patch #1 and #2)
> Patch #4 is my attempt to convince you that using commas for
> digit grouping should be regarded as harmful in global POV.
> My suggestion is to use \num{} commands in LaTeX source and
> let a reader to pick a style of his/her choice.
> 
> \num{} command can slow down pdflatex processing somewhat,
> but should be acceptable on modern platforms.
> 
> Thoughts?

Applied and pushed, thank you!

Table D.3 looks fine, but it only has thee columns.  If it had more
columns or was wider or variable-depth rows, it would be hard to read.
Table D.4 looks good to me, but I (intentionally) have not yet looked
at what you had to do in LaTeX to make it happen.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   styleguide: Add examples of alternative table layout
>   styleguide: Tweak layout of 'Limitation' table
>   styleguide: Update LaTeX source of code snippet
>   styleguide: Add example of options to \num{} command
>   styleguide: Emphasize source part of epigraph
> 
>  appendix/styleguide/samplecodesnippet.tex    |  19 --
>  appendix/styleguide/samplecodesnippetfig.tex |  19 ++
>  appendix/styleguide/samplecodesnippetlst.tex |  19 ++
>  appendix/styleguide/styleguide.tex           | 375 ++++++++++++++++++---------
>  perfbook.tex                                 |   5 +-
>  5 files changed, 301 insertions(+), 136 deletions(-)
>  delete mode 100644 appendix/styleguide/samplecodesnippet.tex
>  create mode 100644 appendix/styleguide/samplecodesnippetfig.tex
>  create mode 100644 appendix/styleguide/samplecodesnippetlst.tex
> 
> -- 
> 2.7.4
> 

