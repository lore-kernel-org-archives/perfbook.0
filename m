Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53898 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729488AbeJAV4c (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 1 Oct 2018 17:56:32 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w91FFC9u065250
        for <perfbook@vger.kernel.org>; Mon, 1 Oct 2018 11:18:13 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mum1p6dwn-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 01 Oct 2018 11:18:13 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 1 Oct 2018 11:18:12 -0400
Date: Mon, 1 Oct 2018 08:18:10 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/5] Misc updates
Reply-To: paulmck@linux.ibm.com
References: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a19dbcb-3dbb-3359-dafa-1fc8dbe4837d@gmail.com>
Message-Id: <20181001151810.GY4222@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 01, 2018 at 10:48:48PM +0900, Akira Yokosawa wrote:
> >From c545a33aea39aeae40bcff478285f814c32a4456 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 1 Oct 2018 22:05:58 +0900
> Subject: [PATCH 0/5] Misc updates
> 
> Hi Paul,
> 
> This is a miscellaneous collection of updates.
> 
> Patch #1 fixes build error you'd encounter when you do "make"
> after doing "make" under CodeSamples/ directory.
> 
> Patches #2 and #3 fix trivial typos in FAQ-BUILD.txt and
> tooldoftrade, respectively.
> 
> Patch #4 removes obsolete workaround code in perfbook.tex.
> 
> Patch #5 removes rules in Makefile used to support a hi-res
> figure in QC section.
> 
> Once Patch #5 is applied, you can remove orphaned files listed
> below:
> 
>     future/Bloch_Sphere.svg
>     future/QC-FormConstant.eps
>     future/QS1_1.svg
>     future/T2h1lc19xmqrdlsor.eps
>     future/ibmqx2-labeled.svg
> 
> As a matter of fact, I have prepared a patch to remove
> them, but it would be too large to submit.

Applied and queued them, along with a sixth patch to remove the above
files with your Suggested-by, thank you!!!

I never have tried it myself, but they say that the -D argument to
"git diff", "git show", and "git format-patch" will create a summarized
patch that can then be pulled in by "git am" and friends.  If either of
us remembers next time, we can try the experiment.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   CodeSamples: Exclude meta command lines in building api.h
>   FAQ-BUILD.txt: Fix typo
>   toolsoftrade: Fix typo DEFINE_PER_THREAD() -> DEFINE_PER_CPU()
>   Remove workaround for Fedora 23 Tex Live bug
>   Makefile: Remove rules for QC section
> 
>  .gitignore                    |  1 -
>  CodeSamples/Makefile          |  4 +++-
>  FAQ-BUILD.txt                 |  2 +-
>  Makefile                      | 25 +++++--------------------
>  perfbook.tex                  | 14 --------------
>  toolsoftrade/toolsoftrade.tex |  2 +-
>  utilities/gen_snippet_d.pl    | 16 ++++++++--------
>  7 files changed, 18 insertions(+), 46 deletions(-)
> 
> -- 
> 2.7.4
> 

