Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35518 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1726985AbeGRTVF (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 18
 Jul 2018 15:21:05 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6IIXxkM092619
 for <perfbook@vger.kernel.org>; Wed, 18 Jul 2018 14:41:54 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2kaabb1q9y-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Wed, 18 Jul 2018 14:41:54 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 18 Jul
 2018 14:41:53 -0400
Date: Wed, 18 Jul 2018 11:44:15 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Section 4.2: wrong error reporting for pthread functions
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
 <20180716163924.GZ12945@linux.vnet.ibm.com>
 <2def0b9d-d197-d1dd-2489-72b9c9d2be26@gmail.com>
 <20180717161531.GM12945@linux.vnet.ibm.com>
 <53b135c3-d9ac-915b-49ee-332efe4e60e5@gmail.com>
 <20180718131448.GZ12945@linux.vnet.ibm.com>
 <466d5063-ff10-af62-4867-88fa2db90af6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <466d5063-ff10-af62-4867-88fa2db90af6@gmail.com>
Message-Id: <20180718184415.GF12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Wed, Jul 18, 2018 at 10:42:45PM +0900, Akira Yokosawa wrote:
> On 2018/07/18 06:14:48 -0700, Paul E. McKenney wrote:
> > On Wed, Jul 18, 2018 at 09:15:12PM +0900, Akira Yokosawa wrote:
> >> On 2018/07/17 09:15:31 -0700, Paul E. McKenney wrote:
> >>> On Wed, Jul 18, 2018 at 12:43:16AM +0900, Akira Yokosawa wrote:
> [...]
> >>>> So in theory, we can do what you want, but need somewhat ad-hoc
> >>>> manual tweaks. Still, it might be possible to write a script or two
> >>>> to do such tweaks in a semi-automated way.
> >>>
> >>> I already use scripts to do the auto-numbering and auto-intenting
> >>> for the old-style listings, so why not?  ;-)
> >>>
> >>> If I haven't already made these available, please let me know and
> >>> I can send them on.  They aren't exactly profound.
> >>
> >> So, there are 3 symbolic links under utilities/ in the Git repo:
> >>
> >>     c2latex.sh -> /home/paulmck/bin/c2latex.sh
> >>     extractClatex.sh -> /home/paulmck/bin/extractClatex.sh
> >>     latex2c.sh -> /home/paulmck/bin/latex2c.sh
> >>
> >> Now I know why I have no idea how you manage code snippets. ;-)
> > 
> > Heh!  I extract the code by hand and remove comments and any resulting
> > extraneous blank lines.  I run it through c2latex.sh, and occasionally
> > need to manually fix indentation.  Then I do any needed renumbering
> > manually in the text.
> > 
> > And latex2c.sh is more or less the inverse of c2latex.sh.
> 
> Well, I mean if you don't mind, I'd like to see those scripts
> in the Git repo rather than the symbolic links.

Hmmm...  I must admit that those symbolic links are a bit useless
outside of my laptop.  I have replaced them with the scripts themselves.
Please note that I haven't really used extractClatex.sh, though it did
seem like a good idea at the time.  :-/

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> >>>> If you'd like to see what the code snippet and reference to labels
> >>>> would be,  I can prepare a experimental branch which is relative to
> >>>> commit f2b9d37d3b95 ("count: Expand on gap between C11 atomics and
> >>>> the Linux kernel").
> >>>>
> >>>> Thoughts?
> >>>
> >>> Sounds worth a try, thank you!
> >>
> >> OK.
> >> I'll send a pseudo pull request when it is ready.
> >> Hopefully in a couple of days.
> > 
> > Sounds good!
> > 
> > 							Thanx, Paul
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe perfbook" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 

