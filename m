Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54867 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S941023AbcIHLQ1 (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 8
 Sep 2016 07:16:27 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u88BDGF5023525
 for <perfbook@vger.kernel.org>; Thu, 8 Sep 2016 07:16:26 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 25ayghu9bp-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 08 Sep 2016 07:16:25 -0400
Received: from localhost by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 8 Sep 2016
 05:16:24 -0600
Date: Thu, 8 Sep 2016 04:16:22 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
Reply-To: paulmck@linux.vnet.ibm.com
References: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
 <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
Message-Id: <20160908111622.GM3663@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 08, 2016 at 12:58:53AM +0900, Akira Yokosawa wrote:
> On 2016/09/08 0:47, Akira Yokosawa wrote:
> >>From 480c37c4749ae4957791636e84e77566265613c2 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Thu, 8 Sep 2016 00:20:29 +0900
> > Subject: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
> > 
> > This is a trial commit to avoid the side-effect of the "verbbox"
> > environment, i.e., when it is used just after a section heading,
> > the following paragraph loses implicit non-indentation.
> > 
> > This commit moves such a "verbbox" environment *before* the section
> > heading.
> > 
> > There are also cases where two "verbbox" environments are placed just
> > after section headings. To accommodate such cases, one of such
> > "verbbox" need to be replaced with "myverbbox" environment to give
> > another temporary verbatimbox content holder.
> > 
> > This commit includes an example of such a case.
> > 
> > Note that the "myverbbox" environment is provided in recent versions
> > of the "verbatimbox" package, namely after v3.0.
> > 
> > If you have older versions of "verbatimbox" package, you need to
> > update. Also the newer one requires the "readarray" package.
> > 
> > Please make sure you have those required packages.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  defer/toyrcu.tex | 31 +++++++++++++++++--------------
> >  1 file changed, 17 insertions(+), 14 deletions(-)
> > 
> 
> Hi Paul,
> 
> So, this is what occurred to me.
> The main idea is to move "verbbox" environment before the section heading.
> This patch contains only a small samples.
> Does this level of modification acceptable in your viewpoint?
> 
> One concern is the requirement of fairly new "verbatimbox" environment.
> On Ubuntu 12.04, the one installed in texlive is too old.
> On Ubuntu 14.04 and 16.04, it contains newer versions.

I am currently running Ubuntu 14.04, so it would work.  But is there
anything that could be done to make "verbbox" avoid causing this change?

							Thanx, Paul

