Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42555 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752979AbcIDPEp (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 4 Sep 2016 11:04:45 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u84F2m0R137897
 for <perfbook@vger.kernel.org>; Sun, 4 Sep 2016 11:04:32 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 258btxymjq-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 04 Sep 2016 11:04:32 -0400
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 4 Sep 2016
 09:04:31 -0600
Date: Sun, 4 Sep 2016 08:04:28 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] treewide: Add \noindent where necessary
Reply-To: paulmck@linux.vnet.ibm.com
References: <a5ebf9e5-a315-7603-2262-af0e363bb83c@gmail.com>
 <20160904095821.GO3663@linux.vnet.ibm.com>
 <269e7880-07e9-43f6-70c9-b1d321b3e442@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <269e7880-07e9-43f6-70c9-b1d321b3e442@gmail.com>
Message-Id: <20160904150428.GV3663@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 04, 2016 at 11:53:53PM +0900, Akira Yokosawa wrote:
> On 2016/09/04 02:58:21 -0700, Paul E. McKenney wrote:
> > On Sun, Sep 04, 2016 at 08:44:27AM +0900, Akira Yokosawa wrote:
> >> >From e11254e95c6d33eaf999a1e1c4831af2e141fb91 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 4 Sep 2016 08:01:50 +0900
> >> Subject: [PATCH] treewide: Add \noindent where necessary
> >>
> >> Since commit 213f584cd55b ("Add a few epigraphs") and following
> >> commits, implicit no-indentation of first paragraph of a Chapter
> >> has been lost.
> >>
> >> This commit adds explicit "\noindent" after \epigraph{}s.
> >>
> >> It also adds "\noindent" where some environment is used just
> >> after "\section{}", "subsection{}", or "subsubsection{}.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Good eyes!  I honestly had not noticed.
> 
> Well, now I know why.  In the two-column layout, there was no change
> in indentation of the first paragraph of a chapter...
> I suppose you mostly see the two-column layout so it's natural you
> didn't see any difference.
> 
> I don't know why, but when you specify "twocolumn" option to the "book"
> documentclass, the first paragraph of a chapter *is* indented.
> 
> I noticed the difference in perfbook-1c.pdf first, and wrongly assumed
> it was also the case in two-column layout.
> 
> Sorry for my confusion.
> 
> I have no idea if the behavior of twocolumn option is intended or not.
> 
> So the addition of epigraphs actually made the indentation consistent
> in both two-column and one-column layout.
> 
> I can resubmit a patch that only changes at the first paragraphs of
> sections.
> 
> > 
> > But wouldn't it make more sense to fix the epigraph package?  For that
> > matter, what exactly are the rules regarding epigraphs and indentation
> > of first paragraphs and chapters?
> 
> \epigraph{} command does have this side-effect in one-column layout.
> I found several examples where people use \noindent after \epigraph{},
> but there seems to be no strong rules here.
> 
> So just doing consistently can be said of as the rule.
> It's the editor's call, I think.

When there is no clear rule, as in this case, we should let the tool
(in this case, LaTeX) be our guide.  ;-)

							Thanx, Paul

