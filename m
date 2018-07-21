Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43682 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1727974AbeGURo3 (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 21
 Jul 2018 13:44:29 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6LGnmDf099794
 for <perfbook@vger.kernel.org>; Sat, 21 Jul 2018 12:51:08 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2kc0jyk7qa-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sat, 21 Jul 2018 12:51:07 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 21 Jul
 2018 12:51:06 -0400
Date: Sat, 21 Jul 2018 09:51:03 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [NOT YET PULL] Trial of labeling lines in code snippets
Reply-To: paulmck@linux.vnet.ibm.com
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
Message-Id: <20180721165103.GE12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 21, 2018 at 09:19:53AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So, an experimental branch to label particular lines in code
> snippets is ready for review.
> The branch is based on current master of yours.
> 
> I've converted 4 code snippets in Section 4.2. and updated
> corresponding code samples (sans forkjoin.c because it is
> quite simplified in Listing 4.1).
> 
> Does this approach look reasonable to you?

This does look promising, thank you!  Please give me some time to think
this over a bit.  My normal approach would end up with very long labels
in the code, which might be OK.  The argument against is that tying the
listing caption to the actual code might not be a great thing.

Again, looks promising, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> ---
> The following changes since commit e3191997557e0d33b862e267fb4d5971e879ca07:
> 
>   utilities: Provide scripts instead of broken symlinks (2018-07-18 11:40:57 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook trial-fancyvrb
> 
> for you to fetch changes up to 2154a175e469e6238c89d4c494d204a9ddbaa20a:
> 
>   [EXP] Update hyphen2endash (2018-07-21 09:17:34 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (3):
>       [EXP] toolsoftrade: Add labels in code samples as comments
>       [EXP] toolsoftrade: Reference line in code snippets by label
>       [EXP] Update hyphen2endash
> 
>  CodeSamples/api-pthreads/api-pthreads.h |  14 +-
>  CodeSamples/toolsoftrade/forkjoinvar.c  |  10 +-
>  CodeSamples/toolsoftrade/pcreate.c      |   5 +-
>  perfbook.tex                            |   6 +
>  toolsoftrade/toolsoftrade.tex           | 221 +++++++++++++++++---------------
>  utilities/hyphen2endash.sh              |   3 +
>  6 files changed, 141 insertions(+), 118 deletions(-)
> 

