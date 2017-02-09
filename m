Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41340 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1753074AbdBIT0K (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 9 Feb 2017 14:26:10 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v19JP3U4112791
 for <perfbook@vger.kernel.org>; Thu, 9 Feb 2017 14:26:06 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 28gu7ks44d-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 09 Feb 2017 14:26:05 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 9 Feb 2017
 12:26:05 -0700
Date: Thu, 9 Feb 2017 11:26:03 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Bibliography update round 5
Reply-To: paulmck@linux.vnet.ibm.com
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
 <20170208163747.GO30506@linux.vnet.ibm.com>
 <78D82D63-A7BA-4F43-B320-679D6EA44FD8@gmail.com>
 <20170208211009.GT30506@linux.vnet.ibm.com>
 <52CB7A57-7BDC-42C7-9AD7-5957F5CBC973@gmail.com>
 <20170208214153.GW30506@linux.vnet.ibm.com>
 <3421a5dd-ab2f-7f47-538b-6f6e7ccbed50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3421a5dd-ab2f-7f47-538b-6f6e7ccbed50@gmail.com>
Message-Id: <20170209192603.GH30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Feb 09, 2017 at 07:21:06AM +0900, Akira Yokosawa wrote:
> On 2017/02/08 13:41:53 -0800, Paul E. McKenney wrote:
> > On Thu, Feb 09, 2017 at 06:36:18AM +0900, Akira Yokosawa wrote:
> >>
> >>
> >> Akira 
> >> (from mobile, might be QP encoded)
> >>
> >>> On Feb 9, 2017, at 6:10, Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> >>>
> >>>> On Thu, Feb 09, 2017 at 05:57:23AM +0900, Akira Yokosawa wrote:
> >>>>
> >>>>
> >>>>> On Feb 9, 2017, at 1:37, Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> >>>>>
> >>>>> On Wed, Feb 08, 2017 at 11:54:41PM +0900, Akira Yokosawa wrote:
> >>>>>>> From 58a0655ab2b5c555bd19a6d7624a9d4413cf1360 Mon Sep 17 00:00:00 2001
> >>>>>> From: Akira Yokosawa <akiyks@gmail.com>
> >>>>>> Date: Wed, 8 Feb 2017 23:34:47 +0900
> >>>>>> Subject: [PATCH 0/5] Bibliography update round 5
> >>>>>>
> >>>>>> Hi Paul,
> >>>>>>
> >>>>>> Here is round 5 of bibliography updates.
> >>>>>> Patches 1, 2, and 3 take care of broken urls. Patch 2 contains an
> >>>>>> alternative link to a webpage capture.
> >>>>>> Patch 4 is cosmetic fix of UCB in author fields
> >>>>>> Patch 5 is a different type of update. It adds awareness of "location"
> >>>>>> field in "inproceedings" entry. Please see the commit log for details.
> >>>>>> I think this is a reasonable change for perfbook.
> >>>>>
> >>>>> I applied the first four, and might be convinced to apply the fifth.
> >>>>> But first a question -- how many changes would be required to bring
> >>>>> my old bib entries in line with current practice?
> >>>>
> >>>> No change is required. Because this change has effect
> >>>> only on entries with both "address" and "location".
> >>>> I thought I explained this somewhere, but missed to do so.
> >>>> Can this clarification convince you?
> >>>
> >>> Ah, thank you for the clarification!  And on to the next question...
> >>>
> >>> Does it really make sense for me to have both "address" and "location"
> >>> on a given bib entry?  If I am doing something strange (quite likely!),
> >>> it is probably better for me to fix my strange bib entries than to modify
> >>> the tools.  Especially given the possibility that others might well
> >>> harvest bib entries from perfbook.
> >>
> >> Well, I don't think your usage of "address" field is strange at all.
> >> It would be easy to find people who do the same.
> >>
> >> The fact that genuine alpha style does not recognize "location" entry would support my observation.
> > 
> > Sorry to continue with the questions, but should perfbook be using
> > some other bibliography style?  The current "alpha" was pretty much an
> > arbitrary choice.
> 
> Hmm...
> For example, there is a Q&A here:
> http://tex.stackexchange.com/questions/76566/
> 
> This answer recommends to use "venue" field for location.
> 
> Another Q&A:
> http://tex.stackexchange.com/questions/152725/
> 
> There seems to be no popular consensus how to handle location of conference
> in bibliography...
> 
> Thoughts?

Yow!!!  ;-)

I will take your updated patch, adding the above two URLs if they are
not already present.

							Thanx, Paul

