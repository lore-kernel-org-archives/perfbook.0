Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e17.ny.us.ibm.com ([129.33.205.207]:57373 "EHLO
 e17.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1756831AbcEDAvw (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 3 May 2016
 20:51:52 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 3 May 2016
 20:51:51 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 49E4638C8051
 for <perfbook@vger.kernel.org>; Tue, 3 May 2016 20:51:49 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u440pnIR29360240	for <perfbook@vger.kernel.org>; Wed, 4 May 2016 00:51:49 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u440pmHH029144	for <perfbook@vger.kernel.org>; Tue, 3 May 2016 20:51:49 -0400
Date: Tue, 3 May 2016 17:51:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] .gitignore: Add planned empty targets
Message-ID: <20160504005148.GS3800@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <37282858-f590-1eed-457e-7f825634ee9d@gmail.com>
 <9f3461a6-7257-1c4c-68f5-fb66644992e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f3461a6-7257-1c4c-68f5-fb66644992e4@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 04, 2016 at 08:10:53AM +0900, Akira Yokosawa wrote:
> On 2016/05/04 8:06, Akira Yokosawa wrote:
> >>From f0be4630d38992d2f247678914c208113c437509 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiysw@gmail.com>
> > Date: Wed, 4 May 2016 07:38:30 +0900
> > Subject: [PATCH] .gitignore: Add planned empty targets
> > 
> > This change will prevent "git status" from complaining when you
> > switch from a planned test branch to other branches.
> > Note: Target names 'extraction' and 'embedfonts' are now denoted
> > as phony targets on the master branch. Therefore, it is safe to
> > change them to empty targets of the same names on the planned test
> > branch.
> > 
> > Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> > ---
> >  .gitignore | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/.gitignore b/.gitignore
> > index 39fd69d..18b3d63 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -25,6 +25,12 @@ perfbook-1c.tex
> >  perfbook-1c.out
> >  perfbook-hb.tex
> >  perfbook-hb.out
> > +qqz_first
> > +perfbook_aux
> > +perfbook-1c_aux
> > +perfbook-hb_aux
> > +extraction
> > +embedfonts
> >  
> >  RCS
> >  
> > 
> 
> Hi,
> I also want this one to be pulled before I start working on
> v2 of "Another round of build script tweaks" series.

Done.  Feel free clone the archive and send pull requests, by the way.

							Thanx, Paul

