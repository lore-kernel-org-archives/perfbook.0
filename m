Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35848 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1756339AbcIFOJL (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 6
 Sep 2016 10:09:11 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u86E7eBd085226
 for <perfbook@vger.kernel.org>; Tue, 6 Sep 2016 10:09:11 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 259xwbhru2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 06 Sep 2016 10:09:11 -0400
Received: from localhost by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 6 Sep 2016
 08:09:08 -0600
Date: Tue, 6 Sep 2016 07:09:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] treewide: Add \noindent where necessary
Reply-To: paulmck@linux.vnet.ibm.com
References: <7080142c-a8de-3fb8-c7e0-de2939730beb@gmail.com>
 <309e736b-ba53-5e55-ea23-8fc69959375c@gmail.com>
 <20160906120126.GG3663@linux.vnet.ibm.com>
 <a05f42f5-b7e2-725a-2332-b178f2310cd2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a05f42f5-b7e2-725a-2332-b178f2310cd2@gmail.com>
Message-Id: <20160906140905.GH3663@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 06, 2016 at 10:18:53PM +0900, Akira Yokosawa wrote:
> On 2016/09/06 21:01, Paul E. McKenney wrote:
> > On Tue, Sep 06, 2016 at 08:17:29PM +0900, Akira Yokosawa wrote:
> >> On 2016/09/05 23:47:56 +0900, Akira Yokosawa wrote:
> >>> >From 3590a93264e8497f5464397de1644076cd28f467 Mon Sep 17 00:00:00 2001
> >>> From: Akira Yokosawa <akiyks@gmail.com>
> >>> Date: Sun, 4 Sep 2016 08:01:50 +0900
> >>> Subject: [PATCH v2] treewide: Add \noindent where necessary
> >>>
> >>> When there is some environment definition just after a section
> >>> heading, the implicit non-indentation of first paragraph is lost.
> >>>
> >>> This seems inconsistent.
> >>>
> >>> This commit adds "\noindent"s just before such first paragraphs
> >>> to recover the non-indentation.
> >>>
> >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>
> >> Hi Paul,
> >>
> >> I'd like to retract this patch.
> >> I suppose you don't like explicit \noindent in the text either.
> >>
> >> I prefer fixing the position of first paragraphs in the latex source.
> >> That might cause the variation in position of floating figures, but
> >> should be acceptable.
> >>
> >> What do you think?
> > 
> > My first thought was "just make the environment do it", thinking that
> > this was of of the origpub macros.
> > 
> > Another thought is to forbid use of floating figures immediately after
> > section headers.  That would be a bit of an ugly change, but much easier
> > to maintain against changing LaTeX versions.
> > 
> > I am mostly working on code, so now is a good time for invasive changes
> > like this, but I do want to avoid the current change just resulting in
> > the need for many future changes.  Especially given differences between
> > different formatting options.  ;-)
> 
> Indeed.
> 
> About the origpub macro involved in one of the hunks, if you replace it
> with standard \label{}, the paragraph under the figure is still indented.
> 
> Regarding the figure itself as a paragraph, the paragraph under it is
> the second one and indentation should be expected.
> 
> Addition of \noindent there was unnecessary from the beginning.
> 
> The other hunks are all related to the "verbbox" environment, which I
> introduced.  That means I'm shooting myself in the foot... 
> 
> So moving floating figures seems to be necessary only when they are
> related to "verbbox".
> 
> It would be even better if we can fix the side-effect of "verbbox"
> environment. Let me seek this approach first.

Sounds good to me!

							Thanx, Paul

