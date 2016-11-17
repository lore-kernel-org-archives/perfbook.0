Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51567 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752275AbcKQRjC (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 17 Nov 2016 12:39:02 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uAHHctn4135998
 for <perfbook@vger.kernel.org>; Thu, 17 Nov 2016 12:39:01 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 26sfh1d9ru-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 17 Nov 2016 12:39:01 -0500
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 17 Nov
 2016 10:39:00 -0700
Date: Thu, 17 Nov 2016 09:38:59 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Adjust labeling of chapter and appendix
Reply-To: paulmck@linux.vnet.ibm.com
References: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
 <20161116151046.GG3612@linux.vnet.ibm.com>
 <ebfc7992-2384-6e37-a301-9d519aa1bef7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebfc7992-2384-6e37-a301-9d519aa1bef7@gmail.com>
Message-Id: <20161117173859.GF3612@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 17, 2016 at 07:26:17AM +0900, Akira Yokosawa wrote:
> On 2016/11/16 07:10:46 -0800, Paul E. McKenney wrote:
> > On Wed, Nov 16, 2016 at 09:57:08AM +0900, Akira Yokosawa wrote:
> >> >From 08d86c4db893e5b689c4d051b765006ce507c45c Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Wed, 16 Nov 2016 09:43:11 +0900
> >> Subject: [PATCH 0/3] Adjust labeling of chapter and appendix
> >>
> >> Hi Paul,
> >>
> >> "bib" cleanups aside, I noticed a few inconsistent labeling of
> >> "formal" and "whymemorybarriers".
> >> This patch set adjusts them.
> > 
> > Good catches, applied, thank you!
> 
> You are welcome!
> 
> BTW, did you miss the patch "[PATCH] bib: Fix several typos" from Tobias
> dated "Tue,  8 Nov 2016 10:46:10 +0100"?
> 
> I'm asking because you almost always respond within a few days.
> 
> You missed the previous patch set from Tobias. Does a spam filter or something
> prevent you from receiving it?
> 
> You can see the mail archived at:
> http://www.spinics.net/lists/perfbook/msg00595.html.
> (with mail address obfuscated)

I am not getting the emails from Tobias for whatever reason.  Because
I don't receive them, I have no way of determining why I don't receive
them.  :-(

							Thanx, Paul

>                                                     Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>                                           Thanks, Akira
> >>
> >> ---
> >> Akira Yokosawa (3):
> >>   formal: Promote \OriginallyPublieshed macro to Chapter
> >>   appendix/ack: Adjust labeling in 'Reviewers' section
> >>   treewide: Adjust labeling of 'formal'
> >>
> >>  appendix/ack/ack.tex            | 8 ++++----
> >>  appendix/rcuimpl/rcupreempt.tex | 2 +-
> >>  debugging/debugging.tex         | 2 +-
> >>  defer/toyrcu.tex                | 2 +-
> >>  formal/dyntickrcu.tex           | 2 +-
> >>  formal/formal.tex               | 2 +-
> >>  6 files changed, 9 insertions(+), 9 deletions(-)
> >>
> >> -- 
> >> 2.7.4
> >>
> > 
> > 
> 

