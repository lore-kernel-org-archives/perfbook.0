Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35943 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753384AbdCFKHx (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 6
 Mar 2017 05:07:53 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v266HdEr059445
 for <perfbook@vger.kernel.org>; Mon, 6 Mar 2017 01:18:38 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28ywgah5dq-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 06 Mar 2017 01:18:37 -0500
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 6 Mar 2017
 01:18:36 -0500
Date: Sun, 5 Mar 2017 13:20:39 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] appendix: Enable hyperlink border in bibliography for
 all layouts
Reply-To: paulmck@linux.vnet.ibm.com
References: <b194a26a-355b-94f5-2bba-57269769d58e@gmail.com>
 <47ad7071-d062-0660-7bdf-4c1899db72ea@gmail.com>
 <2308d72d-6cf1-1007-145e-05294f97d281@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2308d72d-6cf1-1007-145e-05294f97d281@gmail.com>
Message-Id: <20170305212039.GG30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 04, 2017 at 12:25:59AM +0900, Akira Yokosawa wrote:
> On 2017/03/03 21:28, Akira Yokosawa wrote:
> >>From ec794a1bd368c5ad381fac0594a254fd6a23f619 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Fri, 3 Mar 2017 20:56:59 +0900
> > Subject: [PATCH 1/2] appendix: Enable hyperlink border in bibliography for all layouts
> > 
> > "pdfborder" in bibliography also helps in identifying known broken
> > urls. This commit enables the border regardless of layout.
> 
> One thing to note:
> 
> If a hyperlink crosses page boundary, the hyperlink is wrongly embedded
> also in the footer and header strings. As of now, target "1csf" hits this
> issue at the bottom of first page of Bibliography (p. 653-654).
> This is a well known issue of "hyperref" package, which would cause
> a build error in 2c layout. Before enabling the border, we just didn't
> notice the issue.
> Other target might hit this issue by changes made in bibliography.
> Are you OK with this possible ugliness?

Seems like a good diagnostic.  It might be necessary to manually adjust
the .bbl file for editions, and perhaps also for releases.  One nice
thing is that this change gives visual indication as to where adjustment
is needed.

Queued, will be pushed when I next get decent connectivity, thank you!

							Thanx, Paul

>                                Thanks, Akira
> 
> > 
> > Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> >  appendix/appendix.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/appendix/appendix.tex b/appendix/appendix.tex
> > index e17c5e1..63bf728 100644
> > --- a/appendix/appendix.tex
> > +++ b/appendix/appendix.tex
> > @@ -11,12 +11,12 @@
> >    \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
> >  }{
> >    \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
> > -  \hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
> >  }
> > +\hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
> >  \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy}
> > +\hypersetup{pdfborder=0 0 0}
> >  \IfTwoColumn{
> >    \end{adjustwidth*}\twocolumn
> >  }{
> > -  \hypersetup{pdfborder=0 0 0}
> >  }
> >  \include{appendix/ack/ack}
> > 
> 

