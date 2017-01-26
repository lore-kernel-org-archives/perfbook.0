Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53181 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753570AbdAZQWg (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 26
 Jan 2017 11:22:36 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0QGK3du143435
 for <perfbook@vger.kernel.org>; Thu, 26 Jan 2017 11:22:35 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 286xt51h6j-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 26 Jan 2017 11:22:35 -0500
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 26 Jan
 2017 09:22:32 -0700
Date: Thu, 26 Jan 2017 08:22:30 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Layout tweaks for 2c layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
Message-Id: <20170126162230.GS3989@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 27, 2017 at 12:16:51AM +0900, Akira Yokosawa wrote:
> >From 15aea071f9a8ff33b0f97310b2afd4730d33afa1 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 26 Jan 2017 23:25:08 +0900
> Subject: [PATCH 0/5] Layout tweaks for 2c layout
> 
> Hi Paul,
> 
> This is *not* a bibliography update.
> 
> Because of wide textwidth for two-column layout, the cover page, legal
> section, and TOC, which are one column, looks too wide.
> 
> Patch 1 adds an explicit line break before "What" in the title. Another
> candidate might be before "And, If So,", but I think this looks better.
> 
> Patch 2 narrows effective textwidth of legal section and TOC as the same as
> that of one-column layout by using "changepage" package.
> 
> Patches 3 and 4 can be regarded as a workaround of build error in 2c layout
> when "inlinelinks" is enabled. By using one-column layout for bibliography,
> the issue can be avoided. Also, wider column width permits freedom in
> typesetting of "alpha" style bibliography. The effective textwidth for
> bibliography is a little wider than the one-column one considering indent
> of entries. You might want to skip patch 4 which enables inlinelinks, but
> as far as I could test by choosing varieties of monospace fonts, there was
> no build error caused by hyperlinks in bibliography.
> 
> Patch 5 tweaks parameters for placement for floating objects. In two-column
> layout, when a not so tall figure occupies a column, it looks imbalanced
> if the neighboring column is flushed from top to bottom. By increasing
> "floatpagefraction", such placements can be prevented.
> 
> Please give it a try and let me know what you think.

It does look quite good -- queued and pushed, thank you!

							Thanx, Paul

>                                             Thanks, Akira
> --
> Akira Yokosawa (5):
>   Specify line break in title of cover page
>   Narrow textwidth of legal and TOB pages in 2c build
>   Change bibliography to one-column layout in 2c build
>   Enable inlinelinks for 2c build
>   Increase floatpagefraction for 2c layout
> 
>  appendix/appendix.tex |  6 +++++-
>  legal.tex             |  4 ----
>  perfbook.tex          | 13 ++++++++++++-
>  3 files changed, 17 insertions(+), 6 deletions(-)
> 
> -- 
> 2.7.4
> 

