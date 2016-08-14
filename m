Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55655 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1750975AbcHNI3G (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 14
 Aug 2016 04:29:06 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7E2XnFc015441
 for <perfbook@vger.kernel.org>; Sat, 13 Aug 2016 22:36:07 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24sxujysbn-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sat,
 13 Aug 2016 22:36:07 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 13 Aug
 2016 20:36:06 -0600
Date: Sat, 13 Aug 2016 19:36:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 0/3] Trial of replacing hyphens with en-dashes
Reply-To: paulmck@linux.vnet.ibm.com
References: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
Message-Id: <20160814023610.GG3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 13, 2016 at 12:38:11PM +0900, Akira Yokosawa wrote:
> >From a63dd50b648013af5780341f9c740bf9d9f6b65d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 13 Aug 2016 11:17:19 +0900
> Subject: [RFC PATCH 0/3] Trial of replacing hyphens with en-dashes
> 
> Hi Paul,
> 
> This is an RFC patch series of my attempt to replace hyphens used for
> ranges of numbers with en-dashes.
> Instead of sending modifications in LaTeX sources as patches, I'm
> submitting scripts which do the replacements on the fly.
> The "sed" script is fairly stable now, and there is no false positives
> AFAIK.
> There might still be false negatives I'm not aware of. Any false positive
> would be addressed by adding a sed pattern.
> As a bonus, the sed pattern also contains fixes of typos such as "line~mm-nn".
> 
> To try the replacement, at the top directory of perfbook, invoke the
> script by "sh utilities/dohyphen2endash.sh".
> You need to be in a clean git repository. This check is to ensure
> that you can revert the changes made by the script by "git reset --hard".
> So you might want to try this series on a test branch.
> Or the check of git status can be overridden by a "-f" or "--force" option.
> 
> The modification by the scripts can be reviewed by "git diff" afterwards.
> 
> It is up to the editor's choice whether or not to commit the result.
> 
> Just adding the scripts to the repository is fine with me.

And, after inspecting the scripts, I took this approach.

Thank you!

							Thanx, Paul

>                                                 Thanks, Akira 
> ------
> 
> Akira Yokosawa (3):
>   Trial of replacing hyphens with en-dashes for number ranges
>   dohyphen2endash.sh: Add check of git status
>   dohyphen2endash.sh: Use mktemp to create temp file
> 
>  utilities/dohyphen2endash.sh | 74 ++++++++++++++++++++++++++++++++++++++++++++
>  utilities/hyphen2endash.sh   | 50 ++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 utilities/dohyphen2endash.sh
>  create mode 100644 utilities/hyphen2endash.sh
> 
> -- 
> 1.9.1
> 

