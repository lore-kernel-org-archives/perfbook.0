Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48538 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752258AbcIKBOD (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 10 Sep 2016 21:14:03 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8B1CnkM005397
 for <perfbook@vger.kernel.org>; Sat, 10 Sep 2016 21:14:02 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 25ce24wym3-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 10 Sep 2016 21:14:02 -0400
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 10 Sep
 2016 19:14:01 -0600
Date: Sat, 10 Sep 2016 09:28:19 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
Reply-To: paulmck@linux.vnet.ibm.com
References: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
 <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
 <20160908111622.GM3663@linux.vnet.ibm.com>
 <ed8f9798-0ff5-7d96-ef30-b2157af7c4fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed8f9798-0ff5-7d96-ef30-b2157af7c4fd@gmail.com>
Message-Id: <20160910162819.GV32751@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Sep 10, 2016 at 09:19:32AM +0900, Akira Yokosawa wrote:
> On 2016/09/08 04:16:22 -0700, Paul E. McKenney wrote:
> > On Thu, Sep 08, 2016 at 12:58:53AM +0900, Akira Yokosawa wrote:
> >> On 2016/09/08 0:47, Akira Yokosawa wrote:
> >>> >From 480c37c4749ae4957791636e84e77566265613c2 Mon Sep 17 00:00:00 2001
> >>> From: Akira Yokosawa <akiyks@gmail.com>
> >>> Date: Thu, 8 Sep 2016 00:20:29 +0900
> >>> Subject: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
> >>>
> >>> This is a trial commit to avoid the side-effect of the "verbbox"
> >>> environment, i.e., when it is used just after a section heading,
> >>> the following paragraph loses implicit non-indentation.
> >>>
> >>> This commit moves such a "verbbox" environment *before* the section
> >>> heading.
> >>>
> >>> There are also cases where two "verbbox" environments are placed just
> >>> after section headings. To accommodate such cases, one of such
> >>> "verbbox" need to be replaced with "myverbbox" environment to give
> >>> another temporary verbatimbox content holder.
> >>>
> >>> This commit includes an example of such a case.
> >>>
> >>> Note that the "myverbbox" environment is provided in recent versions
> >>> of the "verbatimbox" package, namely after v3.0.
> >>>
> >>> If you have older versions of "verbatimbox" package, you need to
> >>> update. Also the newer one requires the "readarray" package.
> >>>
> >>> Please make sure you have those required packages.
> >>>
> >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>> ---
> >>>  defer/toyrcu.tex | 31 +++++++++++++++++--------------
> >>>  1 file changed, 17 insertions(+), 14 deletions(-)
> >>>
> >>
> >> Hi Paul,
> >>
> >> So, this is what occurred to me.
> >> The main idea is to move "verbbox" environment before the section heading.
> >> This patch contains only a small samples.
> >> Does this level of modification acceptable in your viewpoint?
> >>
> >> One concern is the requirement of fairly new "verbatimbox" environment.
> >> On Ubuntu 12.04, the one installed in texlive is too old.
> >> On Ubuntu 14.04 and 16.04, it contains newer versions.
> > 
> > I am currently running Ubuntu 14.04, so it would work.  But is there
> > anything that could be done to make "verbbox" avoid causing this change?
> > 
> 
> So I tried several modification of verbatimbox.sty to do so.
> But what I could do was to add a variant of "verbbox" named "verbboxh"
> which passes "afterheading"-ness to the next paragraph.
> 
> The way to do this can be found at
> http://tex.stackexchange.com/questions/23265/suppressing-indentation-of-the-next-paragraph
> 
> But when I made the same change to "verbbox" without \@afterindentfalse to
> make it "afterheading"-ness aware, the resulting pdf looked weird with irregular
> vertical spacing before section headings.
> 
> It's far beyond my capability to figure out how to fix this.
> 
> Using the variant "verbboxh" in the LaTeX sources would be essentially the
> same as adding explicit \noindent's from a maintainer's viewpoint.
> 
> So moving the position of "verbbox" environment seems a good compromise for now.
> And by doing so, the position would be a good reminder of the side-effect.
> 
> What do you think?

Would it make sense to file a bug report against verbbox and wait until
the bug is fixed?

								Thanx, Paul

>                                          Thanks, Akira
> 
> 
> > 							Thanx, Paul
> > 
> > 
> 

