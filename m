Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11994 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726381AbfHGAb4 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 6 Aug 2019 20:31:56 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x770Vt94117597
        for <perfbook@vger.kernel.org>; Tue, 6 Aug 2019 20:31:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u7h1dp10f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 06 Aug 2019 20:31:55 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x770VtRW117613
        for <perfbook@vger.kernel.org>; Tue, 6 Aug 2019 20:31:55 -0400
Date: Tue, 6 Aug 2019 17:31:45 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] Create .mailmap to fix unreachable email address
Message-ID: <20190807003145.GW28441@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <154feeee-a7b3-17bd-6b26-6ff1778e8b42@gmail.com>
 <20190806162544.GP28441@linux.ibm.com>
 <abf690a9-f52f-2e06-563c-d79edfc424da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abf690a9-f52f-2e06-563c-d79edfc424da@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 07, 2019 at 07:21:43AM +0900, Akira Yokosawa wrote:
> On Tue, 6 Aug 2019 09:25:44 -0700, Paul E. McKenney wrote:
> > On Wed, Aug 07, 2019 at 12:45:34AM +0900, Akira Yokosawa wrote:
> >> >From 327971006462cbab7b5007717d7536b0e3947eb4 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Wed, 7 Aug 2019 00:15:12 +0900
> >> Subject: [PATCH] Create .mailmap to fix unreachable email address
> >>
> >> There are some commits with typo in my gmail address.
> >> Although they can not be fixed after the fact, "git shortlog -se"
> >> and "git show --use-mailmap" respect entries in .mailmap.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Good point, queued and pushed, thank you!
> > 
> > While in the area, I added commit to allow for my recent email address
> > change and some early git misconfiguration.  ;-)
> 
> The email address on the front page also needs update, doesn't it? ;-)

As does a pile of other instances of that address!  Thank you for the
reminder, I will fix.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> ---
> >> Hi Paul,
> >>
> >> Inspired by discussion in another thread, I looked up the usage of
> >> .mailmap in Git repository. It can be used to partially rescue typos
> >> in email configs such as those made in the early days of my contributions.
> >>
> >> This will prevent the unreachable address from being displayed by
> >> "git shortlog -se" and the like.
> >>
> >>         Thanks, Akira
> >> -- 
> >>  .mailmap | 1 +
> >>  1 file changed, 1 insertion(+)
> >>  create mode 100644 .mailmap
> >>
> >> diff --git a/.mailmap b/.mailmap
> >> new file mode 100644
> >> index 00000000..c5d1cd3e
> >> --- /dev/null
> >> +++ b/.mailmap
> >> @@ -0,0 +1 @@
> >> +<akiyks@gmail.com> <akiysw@gmail.com>
> >> -- 
> >> 2.17.1
> >>
> 
