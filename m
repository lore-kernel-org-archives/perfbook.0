Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34349 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751951AbdGaPzI (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 31 Jul 2017 11:55:08 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6VFrps4142468
 for <perfbook@vger.kernel.org>; Mon, 31 Jul 2017 11:55:07 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2c24v7hd9r-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 31 Jul 2017 11:55:07 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 31 Jul
 2017 11:55:07 -0400
Date: Mon, 31 Jul 2017 08:55:07 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/8] Add style guide
Reply-To: paulmck@linux.vnet.ibm.com
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <0d257106-5a41-536b-addb-96075babbefc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d257106-5a41-536b-addb-96075babbefc@gmail.com>
Message-Id: <20170731155507.GE3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 01, 2017 at 12:24:48AM +0900, Akira Yokosawa wrote:
> On 2017/07/31 23:43, Akira Yokosawa wrote:
> >>From e35b5bc0c56f255caee91054f05a5dd7b824b5fa Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Mon, 31 Jul 2017 23:20:57 +0900
> > Subject: [PATCH v2 0/8] Add style guide
> > 
> > Hi Paul,
> > 
> > This is the respin I mentioned earlier.
> > Patch #2 has a few more changes from v1 to modify strings of package name.
> > Other than that, the end result should be the same as v1.
> > 
> > Note on the status of the floatrow package:
> > 
> > Current version v0.3b was revised 2009/08/02.
> > There has been no update since.
> > I'm not sure if upstreaming is possible.
> 
> And I tried to send a message to the author's email address given in
> the documentation of the package. It resulted in "User unknown".

That does make it hard to report a bug...  I have to ask if there are
any appropriate email lists.

Someday I will tell you my story about the "bc" command.  :-(

							Thanx, Paul

> >         Thanks, Akira
> > --
> > Akira Yokosawa (8):
> >   Localize floatrow.sty as floatrowpf.sty
> >   Apply workaround to floatrowpf.sty
> >   Define 'listing' environment for style guide
> >   styleguide: Add listing environment examples
> >   Disable 'floatrow' layout in manually aligned code snippets
> >   styleguide: Add example of grouping code snippets
> >   styleguide: Add example of preferred table layout using 'booktabs'
> >   styleguide: Tweak layout of 'Limitation' table
> > 
> >  appendix/styleguide/hello.c        |    9 +
> >  appendix/styleguide/styleguide.tex |  177 ++++-
> >  defer/rcuusage.tex                 |    6 +-
> >  floatrowpf.sty                     | 1482 ++++++++++++++++++++++++++++++++++++
> >  howto/howto.tex                    |    4 +-
> >  perfbook.tex                       |    4 +
> >  6 files changed, 1668 insertions(+), 14 deletions(-)
> >  create mode 100644 appendix/styleguide/hello.c
> >  create mode 100644 floatrowpf.sty
> > 
> 

