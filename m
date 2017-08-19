Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57011 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750847AbdHSA0N (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 18
 Aug 2017 20:26:13 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7J0Q1pH120101
 for <perfbook@vger.kernel.org>; Fri, 18 Aug 2017 20:26:13 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ce2ukdmh6-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 18 Aug 2017 20:26:12 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 18 Aug
 2017 20:26:11 -0400
Date: Fri, 18 Aug 2017 17:26:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] Style guide updates (round 2)
Reply-To: paulmck@linux.vnet.ibm.com
References: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
Message-Id: <20170819002610.GB11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 19, 2017 at 08:29:29AM +0900, Akira Yokosawa wrote:
> >From af290804fbb9868bb242c8ad6d889d46dfa9add1 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 18 Aug 2017 23:53:45 +0900
> Subject: [PATCH 0/4] Style guide updates (round 2)
> 
> Hi Paul,
> 
> Let me explain each patch in this set first.
> 
> Patch #1 is for compatibility to older LaTeX installation.
> 
> Patch #2 adds the tweaked tables described below.
> 
> Patch #3 converts "tabulary" tables to "tabularx". It involves manual
> width adjustment, but the end result is not so different, with the
> bonus of increased font size. This enables us to try dashed lines of
> arydshln package.
> 
> Patch #4 adds examples using dashed lines. They look not so appealing
> in the particular tables, but there might be cases they are useful.
> On Ubuntu Trusty, an additional package "texlive-humanities" is necessary.
> 
> Regarding your message On 2017/08/14 08:32:46 -0700:
> 
> > Perhaps single-column tables with (say) three or fewer rows might
> > look like D.3, and more complex ones like D.4?  Really complicated
> > tables might need more \hlines, shaded cells, or some such.
> 
> There are few tables with three or fewer rows. So, most tables should
> look like D.4 (in the previous round). It is now Table D.3

I should have said "three or fewer columns", apologies for my confusion!

> Coloring of alternate rows could not be applied simply to Table 3.1
> because of the \textcolor{} tweaks. I used siunitx's "S" column specifier
> instead in Table D.4.

But you did get the headers set up correctly despite their complexity,
good show!  The latex source for the body of the table certainly looks
good.  This table could probably be unruled as it only has three columns,
but again, good demonstration of handling the headers.

> >> For the coloring, all I did was adding a command
> >> "\rowcolors{1}{}{lightgray}".
> >> The (not so) hard part was to make the header row to be actually
> >> one row. I used parbox for the moment.
> >> Please give a look when you have time.
> > 
> > That does seem eminently reasonable for that table.
> > 
> > Tables 5.1 and 5.2 have more "interesting" headers, with the
> > "Reads" spanning two columns, each of which has a subcolumn
> > header.  One approach would be to apply the "Reads" to each
> > subcolumn like you did for D.4.  But this approach looks to me
> > to be less applicable to Table 13.1.  And Table C.1.
> 
> I touched Tables 13.1 and C.1 in this patch set.
> They are Tables D.5 and D.7.

The gap in the midrule for D.5 does help with the separation in a
nice subtle way.  Table D.7 also looks very good to me.  But I will
need some education on the "\rowcolors{5}{}{lightgray}".  Would this
need to change if the number of rows changed?

> D.6 is another version of Table 13.1 with proper legends.

I will have to think about the legend in this case.  Nice in general,
but a surprising fraction of the total space used by the table.
Would it make sense to allow more than 1.5 inches for the definition
so that it took less vertical space?

> I didn't touch Tables 5.1 nor 5.2 in this round, but they should be
> easy.
> 
> > 
> > Table 9.4 is a bit more challenging, and 10.1 is similar, though
> > more suitable for your parbox trick.  Thoughts?
> 
> Table 9.4 is reworked as Table D.8. As you see, I removed the "Category"
> column for coloring of rows to work.

Ah, and added them as headers on each group.  If you left them in their
own column the coloring of the Category column looks strange?

> Table 9.1 requires a different approach (not tried yet).
> 
> Table 10.1 can be regarded as a figure drawn by tabular environment
> and is not suitable to booktabs' rules.
> Tables 7.1 and C.5 don't look suitable to booktabs' rules either.
> I'll keep them as is for the moment.
> 
> > 
> > Table 14.1 might need to keep its hlines, but what are your thoughts?
> > A clear separation between the number on the left and the columns
> > corresponding to each CPU seems important.  Ditto 14.2.
> 
> Table 14.1 is reworked as Table D.9.
> Gaps in the mid-rule can represent the separation done by vertical rules
> in the original one. I don't think hlines are necessary here either.
> Or using dashed hlines might be an option.

No, D.9 looks quite good to me.  Much better than the lined original,
in fact.

> > Thoughts on Tables 17.1 and 17.2?  (The HTM comparison tables.)
> 
> I have not tried these large and complex tables yet.
> The "tabu" package might improve them. I'm kind of scared by the fancy
> looks of tabu document, though...  There can be other options.
> Please give me a while.

As far as I know, we are not under any schedule pressure on this
item.  ;-)

> > But most of the rest of the tables look like they would do just fine
> > as either D.3 (for the single-column ones with three or fewer
> > columns) or D.4 (for the rest).
> > 
> > But what are your impressions?
> 
> So the other simple tables can have the rows colored.
> 
> Let me know what you think of the added tables.

I did have to find an arydshln.sty.  I ended up using this one:

http://ex.osaka-kyoiku.ac.jp/~fujii/dl/arydshln.sty

Is that a reasonable choice, or is there a better one elsewhere?

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   Use 'fixltx2e' package
>   styleguide: Add more table experiments
>   Get rid of 'tabulary' package
>   styleguide: Add table examples with dashed lines
> 
>  FAQ-BUILD.txt                      |   5 +-
>  SMPdesign/SMPdesign.tex            |   8 +-
>  appendix/styleguide/styleguide.tex | 557 +++++++++++++++++++++++++++++--------
>  defer/rcuapi.tex                   |  11 +-
>  defer/whichtochoose.tex            |  10 +-
>  perfbook.tex                       |   6 +-
>  6 files changed, 462 insertions(+), 135 deletions(-)
> 
> -- 
> 2.7.4
> 

