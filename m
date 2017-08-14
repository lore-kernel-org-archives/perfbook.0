Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38140 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752602AbdHNPcs (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 14 Aug 2017 11:32:48 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7EFTQA5196024
 for <perfbook@vger.kernel.org>; Mon, 14 Aug 2017 11:32:48 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2cbe8113gn-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 14 Aug 2017 11:32:48 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 14 Aug
 2017 11:32:47 -0400
Date: Mon, 14 Aug 2017 08:32:46 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Style guide updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
 <20170813172624.GA7017@linux.vnet.ibm.com>
 <bcd15a7a-b8c6-b59a-1cc6-669ea41c5aba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcd15a7a-b8c6-b59a-1cc6-669ea41c5aba@gmail.com>
Message-Id: <20170814153246.GE7017@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 14, 2017 at 08:24:08AM +0900, Akira Yokosawa wrote:
> On 2017/08/13 10:26:24 -0700, Paul E. McKenney wrote:
> > On Sun, Aug 13, 2017 at 12:27:52PM +0900, Akira Yokosawa wrote:
> >> >From 24d4de52c8186c1ec1787e76d13e22646d804a53 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 13 Aug 2017 11:00:48 +0900
> >> Subject: [PATCH 0/5] Style guide updates
> >>
> >> Hi Paul,
> >>
> >> The style guide needs some updates regarding recent changes in
> >> litmus tests in memory barriers section. (Patch #3)
> >> Also I recovered the tweaks in table layout. I added another
> >> option to color rows alternately. (Patch #1 and #2)
> >> Patch #4 is my attempt to convince you that using commas for
> >> digit grouping should be regarded as harmful in global POV.
> >> My suggestion is to use \num{} commands in LaTeX source and
> >> let a reader to pick a style of his/her choice.
> >>
> >> \num{} command can slow down pdflatex processing somewhat,
> >> but should be acceptable on modern platforms.
> >>
> >> Thoughts?
> > 
> > Applied and pushed, thank you!
> > 
> > Table D.3 looks fine, but it only has thee columns.  If it had more
> > columns or was wider or variable-depth rows, it would be hard to read.
> 
> And I said in the guide, "especially in tables of simple structure."
> Large tables need case-by-case tuning, I suppose.

I expect so!

Perhaps single-column tables with (say) three or fewer rows might
look like D.3, and more complex ones like D.4?  Really complicated
tables might need more \hlines, shaded cells, or some such.

> > Table D.4 looks good to me, but I (intentionally) have not yet looked
> > at what you had to do in LaTeX to make it happen.  ;-)
> 
> For the coloring, all I did was adding a command
> "\rowcolors{1}{}{lightgray}".
> The (not so) hard part was to make the header row to be actually
> one row. I used parbox for the moment.
> Please give a look when you have time.

That does seem eminently reasonable for that table.

Tables 5.1 and 5.2 have more "interesting" headers, with the
"Reads" spanning two columns, each of which has a subcolumn
header.  One approach would be to apply the "Reads" to each
subcolumn like you did for D.4.  But this approach looks to me
to be less applicable to Table 13.1.  And Table C.1.

Table 9.4 is a bit more challenging, and 10.1 is similar, though
more suitable for your parbox trick.  Thoughts?

Table 14.1 might need to keep its hlines, but what are your thoughts?
A clear separation between the number on the left and the columns
corresponding to each CPU seems important.  Ditto 14.2.

Thoughts on Tables 17.1 and 17.2?  (The HTM comparison tables.)

But most of the rest of the tables look like they would do just fine
as either D.3 (for the single-column ones with three or fewer
columns) or D.4 (for the rest).

But what are your impressions?

							Thanx, Paul

>          Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >> --
> >> Akira Yokosawa (5):
> >>   styleguide: Add examples of alternative table layout
> >>   styleguide: Tweak layout of 'Limitation' table
> >>   styleguide: Update LaTeX source of code snippet
> >>   styleguide: Add example of options to \num{} command
> >>   styleguide: Emphasize source part of epigraph
> >>
> >>  appendix/styleguide/samplecodesnippet.tex    |  19 --
> >>  appendix/styleguide/samplecodesnippetfig.tex |  19 ++
> >>  appendix/styleguide/samplecodesnippetlst.tex |  19 ++
> >>  appendix/styleguide/styleguide.tex           | 375 ++++++++++++++++++---------
> >>  perfbook.tex                                 |   5 +-
> >>  5 files changed, 301 insertions(+), 136 deletions(-)
> >>  delete mode 100644 appendix/styleguide/samplecodesnippet.tex
> >>  create mode 100644 appendix/styleguide/samplecodesnippetfig.tex
> >>  create mode 100644 appendix/styleguide/samplecodesnippetlst.tex
> >>
> >> -- 
> >> 2.7.4
> >>
> > 
> > 
> 

