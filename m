Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46729 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752209AbcLYQPN (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 25
 Dec 2016 11:15:13 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBPGDlmr061406
 for <perfbook@vger.kernel.org>; Sun, 25 Dec 2016 11:15:12 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27hpdfafd9-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 25 Dec 2016 11:15:12 -0500
Received: from localhost by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 25 Dec
 2016 09:15:11 -0700
Date: Sun, 25 Dec 2016 08:15:09 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Add script to convert BiBTeX output (was Re: [RFC
 PULL] Bibliography URL cleanup)
Reply-To: paulmck@linux.vnet.ibm.com
References: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
 <20161106234719.GL24166@linux.vnet.ibm.com>
 <20161224070505.GA16424@linux.vnet.ibm.com>
 <ac74555d-18c3-9bb1-66cc-e2acb3888dcd@gmail.com>
 <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af2c3345-2e60-1582-1f8f-d2adb3413927@gmail.com>
Message-Id: <20161225161509.GH3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 25, 2016 at 08:42:18PM +0900, Akira Yokosawa wrote:
> On 2016/12/24 16:36:32 +0900, Akira Yokosawa wrote:
> > On 2016/12/24 23:05:05 -0800, Paul E. McKenney wrote:
> >> On Sun, Nov 06, 2016 at 03:47:19PM -0800, Paul E. McKenney wrote:
> >>> On Sat, Nov 05, 2016 at 05:16:19PM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> On 2016/10/28, 11:30:38 -0700, Paul E. McKenney wrote:
> >>>>> On Fri, Oct 28, 2016 at 07:45:16AM +0900, Akira Yokosawa wrote:
> >>>> [snip]
> >>>>>> So, these bib files are an library collected for nearly three decades!!!
> >>>>>> They are invaluable as they are, and I'd appreciate your decision to
> >>>>>> make them public.
> >>>>>
> >>>>> Unfortunately, many of the comments on the early entries reflect my
> >>>>> relative youth and impetuosity, so unless or until I get time to edit
> >>>>> the whole mess so as to avoid offending any number of authors (to say
> >>>>> nothing of their disciples!), I must keep the originals private.
> >>>>
> >>>> I see. I misunderstood the circumstances. So you made only a part of your
> >>>> bib files public.
> >>>>
> >>>>>
> >>>>>> There are two issues in urls in the bib files.
> >>>>>> One is the inconsistency of format discussed here.
> >>>>>> The other is the dead links. There are quite a few urls that end up in
> >>>>>> "not found" now. Maintaining urls would require a great deal of work itself...
> >>>>>>
> >>>>>> To make the format consistent, a script would work. But before beginning
> >>>>>> implementation, we need to clarify what the script would do.
> >>>>>> So I'll make some sample replacement patches to confirm your preference.
> >>>>>
> >>>>> Sounds good, and I look forward to seeing them!
> >>>>
> >>>> I said to make "some sample replacement patches", but it became quite
> >>>> intensive changes. So I'm sending them as a pull request. I don't expect
> >>>> you to actually pull them as it is, but just to pull them on a local
> >>>> branch and see what they look like.
> >>>
> >>> I have pulled thme into akiyks.2016.11.05a, and pushed the first nine
> >>> patches.  I am reflecting those changes in my bib sources as well.
> >>> Looked sane at first glance, but yes, I need to work out how to handle
> >>> the later ones with other documents...
> >>
> >> And the later .bib edits seem compatible with my current tools, even
> >> without the script and .bst changes.  So I have applied them in tandem
> >> to my .bib source and to the perfbook bibliography.  I was able to
> >> find valid URLs for a few of the entries, so used them instead of
> >> \nolinkurl{}, but several do appear to be quite dead.
> >>
> >> I also applied the alphapf.bst changes, but left inlinelinks disabled
> >> for the time being.  (I am concerned about leaving authors off.)
> >>
> >> Thank you very much for your work on this!!!
> > 
> > You are welcome!
> > 
> > Now, the branch "bib-append-doi" might have some conflicts.
> > I'll rebase it and submit a v2 of the PULL request.
> > 
> > inlinelinks seems to have upper limits of around 13 authors.
> > I've not found any workaround of the issue...
> > Can't you live with a short author field supplemented by a note of
> > full authors list?
> 
> Hi Paul,
> 
> As you have switched to alphapf.bst, I investigated this issue.
> It turned out that the length of author list is *not* the root cause.
> By changing the length of the list, I unintentionally moved the
> page boundary in Bibliography, and that resolved the build error.
> 
> The root cause of the error was an href-ed *long* title which crossed
> a page boundary.

Thank you for tracking this down!  This is a title as in the title
of a citation, or as in the title of an href?  (My guess is the latter,
but it has been about 20 years since I last used perl.)

> In perfbook, you can't control page breaks in Bibliography by the
> nature of the project. So, I wrote a perl script to convert output of
> BiBTeX on the fly.

Indeed, and this presumably means that the current project is
randomly vulnerable to this bug.  Are we the only ones to see it?
If not, is a fix on the way?

> Now, you can enable "inlinelins". Note that in appending url info to
> .bib files, we may need to add more conversion patters. 

Actually, my current thought is to revert the alpha.bst commits
pending a fix.  Though I don't see the need to be too quick about
it, given that it seems to work for both 1c and 2c at the moment.

Or am I missing some reason why this cannot be fixed?

							Thanx, Paul

>                                              Thanks, Akira
> 
> --
> Akira Yokosawa (2):
>   Add script to tweak output of 'alphapf' bibliography stile
>   alphapf.bst: Enable 'inlinelinks'
> 
>  Makefile                    |  1 +
>  alphapf.bst                 |  2 +-
>  utilities/tweakhrefinbbl.pl | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 utilities/tweakhrefinbbl.pl
> 
> -- 
> 2.7.4
> 
> > 
> >                                                    Thanks, Akira
> > 
> >>
> >> 							Thanx, Paul
> >>
> > [snip]
> > 
> 

