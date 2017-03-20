Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50607 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750717AbdCTElk (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 20
 Mar 2017 00:41:40 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2K0xx9S072786
 for <perfbook@vger.kernel.org>; Sun, 19 Mar 2017 21:03:15 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 29906uhsf7-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 19 Mar 2017 21:03:14 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 19 Mar
 2017 21:03:13 -0400
Date: Sun, 19 Mar 2017 18:03:13 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] Add target for "Latin Modern Typewriter" font
Reply-To: paulmck@linux.vnet.ibm.com
References: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
 <20170313011203.GV30506@linux.vnet.ibm.com>
 <1f9afad1-2c95-2d81-aa43-810355eed544@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f9afad1-2c95-2d81-aa43-810355eed544@gmail.com>
Message-Id: <20170320010313.GF3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 20, 2017 at 01:14:59AM +0900, Akira Yokosawa wrote:
> On 2017/03/12 18:12:03 -0700, Paul E. McKenney wrote:
> > On Mon, Mar 13, 2017 at 12:36:56AM +0900, Akira Yokosawa wrote:
> >> >From 2f6614cdf5e1b0f7da9a5c05833dbc4a251eaa9c Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Mon, 13 Mar 2017 00:10:31 +0900
> >> Subject: [PATCH 0/4] Add target for "Latin Modern Typewriter" font
> >>
> >> So, this is a patch set to add yet another target for alternative monospace font.
> >> While preparing this set, I found a (not serious) bug in runlatex.sh.
> >> In fixing it, I refactored the script so that redundant code can be removed.
> >>
> >> Latin Modern Typewriter font is based on "cmtt" (Computer Modern Typewrite) font.
> >> I see that some of your articles cited in Bibliography use it as monospace font,
> >> and they look quite good. cmtt is said to be not suited to Times Roman font
> >> because of its short x-height, but as we are using scaled courier font,
> >> it should not be a big deal.
> >>
> >> Please try the target "mslm" and let me know what you think.
> > 
> > I do like the better display of error messages -- especially now with
> > the list of undefined references being printed, much nicer than editing
> > perfbook.log and searching for them!
> > 
> > I very like the more narrow fixed-width font.  I -think- I like the mslm
> > variant even better, but let's see what others think.
> 
> As I've using mslm for a week, I think it is nicer than mstx or msnt
> in verbatim code snippets.
> Howerver, when mixed used with Times Roman (clone) font in the main text,
> I prefer the look of newtxtt font because of it is slightly thicker, and
> it has mostly the same degree of serif as Times Roman.
> 
> One idea is to use cmtt (or lmtt) for code snippet, and use newtxtt (or
> txtt as a fallback on older LaTeX environment). I'll try this direction
> and prepare an RFC patch for you to try.
> 
> If it looks good for you, we might want to modify font selection for default
> targets 2c, 1c and hb. Otherwise, we can expect few feedback if any.
> When we do the change, current defaults' behaviors should be provided in
> alternative targets for people to compare.

Sounds good -- all for trying it and seeing what people think!

							Thanx, Paul

>                                  Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>                                 Thanks, Akira
> >> -- 
> >> Akira Yokosawa (4):
> >>   runlatex.sh: Refactor by defining functions
> >>   runlatex.sh: Fix typo in grep pattern
> >>   runlatex.sh: Add more lines of grep output around warning/error log
> >>   Add target 'mslm' for 'Latin Modern Typewriter' font
> >>
> >>  Makefile                   | 11 ++++--
> >>  perfbook.tex               |  3 +-
> >>  utilities/runfirstlatex.sh |  3 +-
> >>  utilities/runlatex.sh      | 87 +++++++++++++++++++++-------------------------
> >>  4 files changed, 52 insertions(+), 52 deletions(-)
> >>
> >> -- 
> >> 2.7.4
> >>
> > 
> > 
> 

