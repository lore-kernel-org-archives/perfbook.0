Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34342 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752955AbdJTXz1 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Fri, 20 Oct 2017 19:55:27 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9KNsKIJ131084
 for <perfbook@vger.kernel.org>; Fri, 20 Oct 2017 19:55:27 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2dqsgytvsg-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 20 Oct 2017 19:55:26 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 20 Oct
 2017 19:55:26 -0400
Date: Fri, 20 Oct 2017 16:55:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] styleguide: Reflect recent conversion of code snippets to
 listing
Reply-To: paulmck@linux.vnet.ibm.com
References: <976bbd70-e58c-7b10-1339-87167b5f79ae@gmail.com>
 <20171019235915.GF3521@linux.vnet.ibm.com>
 <253df301-c11e-ca4d-9187-81aef7ee641c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <253df301-c11e-ca4d-9187-81aef7ee641c@gmail.com>
Message-Id: <20171020235524.GJ3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 21, 2017 at 01:31:51AM +0900, Akira Yokosawa wrote:
> On 2017/10/19 16:59:15 -0700, Paul E. McKenney wrote:
> > On Fri, Oct 20, 2017 at 07:46:16AM +0900, Akira Yokosawa wrote:
> >> >From cf16d20dff9bf4cf2832c1fdd1fe00b39c4836fd Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Fri, 20 Oct 2017 07:16:48 +0900
> >> Subject: [PATCH] styleguide: Reflect recent conversion of code snippets to listing
> >>
> >> Also use a different approach to reduce skips of table captions.
> >> By setting a smaller value to \abovecaptionskip, captions of tables
> >> and figures can be made closer to the body regardless of their
> >> positions and avoid ambiguity of them to look like captions
> >> to other nearby tables/figures.
> >>
> >> In the experimental tables, a negative value is still set
> >> to \abovetopsep to further reduce the skips.
> >>
> >> As options of \captionsetup{} related to vertical spacing are
> >> ignored in captions controlled by the "float" package, remove them.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Applied and pushed, thank you!
> 
> So, looks like you are almost ready for the upcoming release.
> I'm preparing a patch to add a make target to move table captions to the top
> throughout perfbook.
> Would you like to see such a patch before the upcoming release?

That would be very good!

> And I have a reminder for you.
> 
> You might want to update the "Roadmap" section in Chapter 1 to mention
> new Chapter 15. Style Guide can be ignored for the moment.

Good catch, you know me too well!  ;-)

I am also merging the "rt" chapter into the "advsync" chapter, but I
do not believe that there are any tables there, so that should not
conflict with your work.

							Thanx, Paul

> Thoughts?
> 
>      Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> [...]
> 

