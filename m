Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38181 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751203AbdHHWdT (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 8
 Aug 2017 18:33:19 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v78MW2pu098703
 for <perfbook@vger.kernel.org>; Tue, 8 Aug 2017 18:33:19 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2c7k46hcvb-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 08 Aug 2017 18:33:18 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 8 Aug 2017
 18:33:17 -0400
Date: Tue, 8 Aug 2017 15:33:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/6] Convert code snippets to "listing" environment
Reply-To: paulmck@linux.vnet.ibm.com
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Message-Id: <20170808223314.GK3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 09, 2017 at 07:04:42AM +0900, Akira Yokosawa wrote:
> >From 3a2394edf4c62cd0a051cf251d36702c6baa2c1a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 9 Aug 2017 06:42:58 +0900
> Subject: [PATCH 0/6] Convert code snippets to "listing" environment
> 
> Hi Paul,
> 
> So, this is another attempt to give code snippets their own environment.
> This time around, I used "float" and "subfig" packages.
> 
> The "ruled" style of "float" package (an example is presented in style
> guide) looks a bit different from that of "floatrow", but it should be OK.
> 
> Patch #4 gives examples of grouping floating objects.
> Grouping "ruled" style objects requires "subfig" package.
> 
> Patch #5 changes the label font in captions to bold face. It looks
> consistent with the looks of the "ruled" style.
> 
> Patch #6 does the conversion in the "memory barriers" section.
> The "ruled" style is not applied there yet. I'll submit a patch
> to change the default style if you think the look is OK.

Looks fine -- Listing D.2, correct?

I couldn't resist adding an epigraph.

							Thanx, Paul

>             Thanks, Akira
> --
> Akira Yokosawa (6):
>   Define 'listing' environment for style guide
>   styleguide: Add listing environment examples
>   Use 'subfig' package instead of 'subfigure'
>   styleguide: Add examples of grouping floating objects
>   Specify 'labelfont=bf' option in captionsetup
>   advsync: Convert code snippets and litmus tests to 'listing'
> 
>  advsync/memorybarriers.tex         | 120 ++++++++++++------------
>  appendix/styleguide/styleguide.tex | 184 +++++++++++++++++++++++++++++++++++--
>  perfbook.tex                       |   8 +-
>  3 files changed, 245 insertions(+), 67 deletions(-)
> 
> -- 
> 2.7.4
> 

