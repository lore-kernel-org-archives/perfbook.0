Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52164 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751305AbdJYTTT (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 25 Oct 2017 15:19:19 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9PJDkNk008704
 for <perfbook@vger.kernel.org>; Wed, 25 Oct 2017 15:19:18 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2du0k806yw-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 25 Oct 2017 15:19:18 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 25 Oct
 2017 15:19:17 -0400
Date: Wed, 25 Oct 2017 12:19:13 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Update table layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
 <67030f8b-7adc-602b-9d45-a619be702bf7@gmail.com>
 <20171023174955.GO3659@linux.vnet.ibm.com>
 <e21a5aaa-23a8-16a9-ad10-aa08188465b6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e21a5aaa-23a8-16a9-ad10-aa08188465b6@gmail.com>
Message-Id: <20171025191913.GO3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 24, 2017 at 10:50:44PM +0900, Akira Yokosawa wrote:
> On 2017/10/23 10:49:56 -0700, Paul E. McKenney wrote:
> > On Tue, Oct 24, 2017 at 12:25:20AM +0900, Akira Yokosawa wrote:
> >> On 2017/10/22 19:24:30 -0700, Paul E. McKenney wrote:
> >>> On Mon, Oct 23, 2017 at 12:20:14AM +0900, Akira Yokosawa wrote:
> >>>> >From d224db4bfed5d4ce0639062a920bafc6f9442e16 Mon Sep 17 00:00:00 2001
> >>>> From: Akira Yokosawa <akiyks@gmail.com>
> >>>> Date: Sun, 22 Oct 2017 23:55:49 +0900
> >>>> Subject: [PATCH 0/5] Update table layout
> >>>>
> >>>> Hi Paul,
> >>>>
> >>>> My first idea was to add a make target for "table captions at the top".
> >>>> But I changed my mind and promoted the layout as default.
> >>>> Instead, I added a target "perfbook-tcb.pdf" (tcb: Table Caption Bottom),
> >>>> which keeps the caption at the bottom.
> >>>>
> >>>> Patch #1 does the change in perfbook.tex and Makefile.
> >>>>
> >>>> Patches #2 and #3 are minor fixes I noticed while updating tables.
> >>>>
> >>>> Patch #4 updates most tables to use the new table layout experimented in
> >>>> Style Guide for a while.  It contains changes to use "S" column specifier
> >>>> provided by the "siunitx" package.
> >>>>
> >>>> Patch #5 converts a table into a figure drawn by tabular.
> >>>>
> >>>> There remains several tables not yet touched. They are complex and large
> >>>> ones. They need extra work to use the new scheme.
> >>>>
> >>>> NOTE: Table 13.1 does not contain legends and does not use subscripts
> >>>> as shown in Table D.5 at the moment. In the text, it looks OK to me.
> >>>>
> >>>> Thoughts?
> >>>
> >>> At a first scan, this all looks good.  There are a few remaining
> >>> tables in the old format, including a couple that we discussed earlier
> >>> as being quite complex.  Which should be fine, for the time being,
> >>> at least.  But what are your thoughts on the remaining old-style tables?
> >>
> >> Tables 17.1 and 17.2 are hard ones. Alternate-row coloring scheme can not
> >> be applied for them. We need to figure out how to improve them. I'm fine with
> >> them to be left for the moment.
> > 
> > Works for me as well!
> > 
> >> Table 7.1 does not fit to the format because of the "Null (Not Held)" column.
> >> As all the cells of the column are all blank, vertical rules actually helps
> >> in this table. If you put some character/symbol to indicate compatibility,
> >> it can be converted to the new format. If you have a good candidate, please
> >> let me know.
> > 
> > Hmmm...  Is there a very light grey variant of the square that appears
> > at the end of each quick quiz?  "\rule{7pt}{7pt}}", if I am not getting
> > too confused.  Ah, there is.  Please see the crude experimental patch
> > below.  (As in if you do choose to do something like this, please make
> > a more sensible/maintainable version.)
> 
> So, I've just submitted a patch to do the format conversion.
> I'm not sure "\x" is the right name to use, but one character is convenient
> in this table.  In this case, coloring alternate rows is not necessary.

Fair point!  I must confess that I had hoped that you would come up with
a more clever way to do this, but is it possible to somehow undefine \x
immediately after use?  Just to give better diagnostics for inadvertent
reuse...

> The following patch is to keep position of table captions consistent.

I am taking that one.  I am on a plane right now, so it might be some
time before they show up outside of my laptop.

> Ah, there is another reminder for you.
> You need to mention the moved "advsync/rt" section in the outline of advsync
> chapter, don't you?  Honestly speaking, it is not obvious at first glance
> how it relates to weaker synchronization.

I was thinking that there is more than one way to "advance" synchronization,
but agreed, I do need to make this clear.

> A good introduction should help readers.

I took a shot at this and pushed it out.  Thoughts?

							Thanx, Paul

