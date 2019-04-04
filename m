Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33934 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730156AbfDDTVZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 4 Apr 2019 15:21:25 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x34JIfiP073684
        for <perfbook@vger.kernel.org>; Thu, 4 Apr 2019 15:21:25 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2rnpx2k1tm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 04 Apr 2019 15:21:24 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 4 Apr 2019 20:21:23 +0100
Date: Thu, 4 Apr 2019 12:21:21 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [GIT PULL v2] formal/dynticks: Employ new scheme for code
 snippets
Reply-To: paulmck@linux.ibm.com
References: <0245f4c8-5ab2-4622-3e88-a13d64dfccdd@gmail.com>
 <2a97a294-4628-6ec8-0404-493b5c69b9da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a97a294-4628-6ec8-0404-493b5c69b9da@gmail.com>
Message-Id: <20190404192121.GK14111@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 05, 2019 at 12:20:20AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> On Wed, 3 Apr 2019 00:48:09 +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > The updates of code snippets in formal/dynticks has become a long branch,
> > and I'm sending this as a pull request.
> > 
> > Short summary of the changes follows.
> > 
> > Patch #1 is an independent update of mpostcheck.sh to suppress false
> > positives on TeX Live 2019, soon to be released this month.
> > 
> > Patch #2 updates inline (not extracted from CodeSamples) snippets.
> > 
> > Patches #3 and #4 enhance fcvextract.pl to easily suppress brank lines
> > from resulting snippets.
> > 
> > Patch #5 updates code snippets extracted from CodeSamples.
> > 
> > Patch #6 updates dyntickRCU-base-sl-busted.spin.trail.txt so that
> > the line counts in the output matches thoes in the updated .spin source.
> > 
> > Patches #7--#9 are cosmetic fixes and tweaks.
> > 
> > Patches #10--#14 are workaround tweaks to keep first paragraphs
> > in sections non-indented when such sections have a floating listing
> > environment at the beginning. This was an unfortunate regression
> > in the conversion of schemes using verbbox to those using VerbatimL.
> > Another option would be to indent every paragraph including the first
> > one in sections. My preference is to keep first paragraph non-indented.
> > The use of "\NoIndentAfterThis" just below the section command looks
> > acceptable to me. Note that it is not robust enough, and there are
> > two occasions where I need to use \noindent in front of the text of
> > first paragraphs.
> > 
> > Patch #15 adds a trivial nbsp.
> > 
> > Any feedback is welcome!
> > 
> >         Thanks, Akira
> > --
> > 
> > The following changes since commit 71ac1532e501033d9cf6e72d596a307b7df3df4a:
> > 
> >   toolsoftrade: Fix code listing 4.22 in Chapter 4 (2019-03-19 08:15:52 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/akiyks/perfbook.git formal-dyntick-snippet-update-r4
> > 
> > for you to fetch changes up to 5e2615cf082480f7a0c79f6b873f37c379c24722:
> > 
> >   formal/dyntickrcu: Add nbsp (2019-04-02 07:53:31 +0900)
> > 
> > ----------------------------------------------------------------
> > Akira Yokosawa (15):
> >       Update mpostcheck.sh to get ready for TeX Live 2019
> >       formal/dyntickrcu: Employ new scheme for inline snippets
> >       fcvextract.pl: Add rule to ignore white spaces around comment block
> >       fcvextract.pl: Add rule for option 'gobbleblank'
> >       formal/dyntickrcu: Employ new scheme for code snippets
> >       formal/promela/dyntick: Update .spin.trail.txt file
> >       treewide: Define and use \rt macro for '-rt'
> >       formal/dyntickrcu: Tweak appearance
> >       formal/dyntickrcu: Remove '()' in state names
> >       formal/dyntickrcu: Tweak indent behind 'listing' environment
> >       count: Tweak indent behind 'listing' environment
> >       SMPdesing, locking: Tweak indent behind 'listing' environment
> >       datastruct, defer: Tweak indent behind 'listing' environment
> >       formal/spinhint: Tweak indent behind 'listing' environment
> >       formal/dyntickrcu: Add nbsp
> > 
> >  .../formal/promela/dyntick/dyntickRCU-base-s.spin  |   37 +-
> >  .../promela/dyntick/dyntickRCU-base-sl-busted.spin |   35 +-
> >  .../dyntickRCU-base-sl-busted.spin.trail.txt       |  144 +-
> >  .../formal/promela/dyntick/dyntickRCU-base-sl.spin |   17 +-
> >  .../formal/promela/dyntick/dyntickRCU-base.spin    |   46 +-
> >  .../promela/dyntick/dyntickRCU-irq-nmi-ssl.spin    |   60 +-
> >  .../formal/promela/dyntick/dyntickRCU-irq-ssl.spin |   41 +-
> >  .../promela/dyntick/dyntickRCU-irqnn-ssl.spin      |   91 +-
> >  SMPdesign/beyond.tex                               |    1 +
> >  advsync/rt.tex                                     |   30 +-
> >  count/count.tex                                    |    5 +
> >  datastruct/datastruct.tex                          |    5 +-
> >  defer/rcuapi.tex                                   |    6 +-
> >  defer/rcuusage.tex                                 |    3 +-
> >  formal/dyntickrcu.tex                              | 1733 +++++++-------------
> >  formal/spinhint.tex                                |    3 +
> >  locking/locking.tex                                |    3 +
> >  perfbook.tex                                       |    1 +
> >  utilities/fcvextract.pl                            |   25 +
> >  utilities/mpostcheck.sh                            |   16 +-
> >  20 files changed, 897 insertions(+), 1405 deletions(-)
> > 
> 
> There was an unnecessary \NoIndentAfterThis in patch #10 in front of
> a figure environment.
> 
> I have removed it and rebased the branch to the current master.
> The updated pull request follows.
> 
> If you'd like too see the changes as patches, please let me know.
> 
>         Thanks, Akira
> -- 
> The following changes since commit b1ac0aab72275b8410254d4fb23e0b965a0fe5c6:
> 
>   memorder: Fix two trivial typos (2019-04-02 06:31:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook formal-dyntick-snippet-update-r5
> 
> for you to fetch changes up to 146213952600d0a6afcc3de09cde7be0a7055700:
> 
>   formal/dyntickrcu: Add nbsp (2019-04-05 00:01:13 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (15):
>       Update mpostcheck.sh to get ready for TeX Live 2019
>       formal/dyntickrcu: Employ new scheme for inline snippets
>       fcvextract.pl: Add rule to ignore white spaces around comment block
>       fcvextract.pl: Add rule for option 'gobbleblank'
>       formal/dyntickrcu: Employ new scheme for code snippets
>       formal/promela/dyntick: Update .spin.trail.txt file
>       treewide: Define and use \rt macro for '-rt'
>       formal/dyntickrcu: Tweak appearance
>       formal/dyntickrcu: Remove '()' in state names
>       formal/dyntickrcu: Tweak indent behind 'listing' environment
>       count: Tweak indent behind 'listing' environment
>       SMPdesing, locking: Tweak indent behind 'listing' environment
>       datastruct, defer: Tweak indent behind 'listing' environment
>       formal/spinhint: Tweak indent behind 'listing' environment
>       formal/dyntickrcu: Add nbsp
> 
>  .../formal/promela/dyntick/dyntickRCU-base-s.spin  |   37 +-
>  .../promela/dyntick/dyntickRCU-base-sl-busted.spin |   35 +-
>  .../dyntickRCU-base-sl-busted.spin.trail.txt       |  144 +-
>  .../formal/promela/dyntick/dyntickRCU-base-sl.spin |   17 +-
>  .../formal/promela/dyntick/dyntickRCU-base.spin    |   46 +-
>  .../promela/dyntick/dyntickRCU-irq-nmi-ssl.spin    |   60 +-
>  .../formal/promela/dyntick/dyntickRCU-irq-ssl.spin |   41 +-
>  .../promela/dyntick/dyntickRCU-irqnn-ssl.spin      |   91 +-
>  SMPdesign/beyond.tex                               |    1 +
>  advsync/rt.tex                                     |   30 +-
>  count/count.tex                                    |    5 +
>  datastruct/datastruct.tex                          |    5 +-
>  defer/rcuapi.tex                                   |    6 +-
>  defer/rcuusage.tex                                 |    3 +-
>  formal/dyntickrcu.tex                              | 1732 +++++++-------------
>  formal/spinhint.tex                                |    3 +
>  locking/locking.tex                                |    3 +
>  perfbook.tex                                       |    1 +
>  utilities/fcvextract.pl                            |   25 +
>  utilities/mpostcheck.sh                            |   16 +-
>  20 files changed, 896 insertions(+), 1405 deletions(-)

Pull, thank you!!!

Apologies for the delay, but one of my children who lives across the
Pacific was in town for a visit.

One nit: The inline listings that break across a column now stick out a
bit more.  One approach would be to convert them to floating listings.
Is that the best approach, or would something else work better?

							Thanx, Paul

