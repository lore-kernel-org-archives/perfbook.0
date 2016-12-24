Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47218 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750708AbcLXHFK (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 24
 Dec 2016 02:05:10 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBO73vnb041770
 for <perfbook@vger.kernel.org>; Sat, 24 Dec 2016 02:05:09 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27hjsvj93r-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 24 Dec 2016 02:05:09 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 24 Dec
 2016 00:05:08 -0700
Date: Fri, 23 Dec 2016 23:05:05 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PULL] Bibliography URL cleanup
Reply-To: paulmck@linux.vnet.ibm.com
References: <72375aa0-f2bd-72b0-e39c-69ce8d7ccadc@gmail.com>
 <20161106234719.GL24166@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161106234719.GL24166@linux.vnet.ibm.com>
Message-Id: <20161224070505.GA16424@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 06, 2016 at 03:47:19PM -0800, Paul E. McKenney wrote:
> On Sat, Nov 05, 2016 at 05:16:19PM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > On 2016/10/28, 11:30:38 -0700, Paul E. McKenney wrote:
> > > On Fri, Oct 28, 2016 at 07:45:16AM +0900, Akira Yokosawa wrote:
> > [snip]
> > >> So, these bib files are an library collected for nearly three decades!!!
> > >> They are invaluable as they are, and I'd appreciate your decision to
> > >> make them public.
> > > 
> > > Unfortunately, many of the comments on the early entries reflect my
> > > relative youth and impetuosity, so unless or until I get time to edit
> > > the whole mess so as to avoid offending any number of authors (to say
> > > nothing of their disciples!), I must keep the originals private.
> > 
> > I see. I misunderstood the circumstances. So you made only a part of your
> > bib files public.
> > 
> > > 
> > >> There are two issues in urls in the bib files.
> > >> One is the inconsistency of format discussed here.
> > >> The other is the dead links. There are quite a few urls that end up in
> > >> "not found" now. Maintaining urls would require a great deal of work itself...
> > >>
> > >> To make the format consistent, a script would work. But before beginning
> > >> implementation, we need to clarify what the script would do.
> > >> So I'll make some sample replacement patches to confirm your preference.
> > > 
> > > Sounds good, and I look forward to seeing them!
> > 
> > I said to make "some sample replacement patches", but it became quite
> > intensive changes. So I'm sending them as a pull request. I don't expect
> > you to actually pull them as it is, but just to pull them on a local
> > branch and see what they look like.
> 
> I have pulled thme into akiyks.2016.11.05a, and pushed the first nine
> patches.  I am reflecting those changes in my bib sources as well.
> Looked sane at first glance, but yes, I need to work out how to handle
> the later ones with other documents...

And the later .bib edits seem compatible with my current tools, even
without the script and .bst changes.  So I have applied them in tandem
to my .bib source and to the perfbook bibliography.  I was able to
find valid URLs for a few of the entries, so used them instead of
\nolinkurl{}, but several do appear to be quite dead.

I also applied the alphapf.bst changes, but left inlinelinks disabled
for the time being.  (I am concerned about leaving authors off.)

Thank you very much for your work on this!!!

							Thanx, Paul

> > This request consists of 25 patches. Patches 1 and 2 are improvements of
> > build scripts to make sure that necessary round of pdflatex is run when
> > only contents of bibliography are modified.
> > 
> > Patches 3 ("bib: Add missing punctuation in 'url' field") to 9 ("bib:
> > Remove domain part in doi fields") (except for patch 7) are prerequisite
> > fixes of bib files to be properly parsed with "alphapf" bibliographystyle,
> > which is a customized version of standard "alpha" style, to be added in
> > the following patches. The customization is done by "urlbst" tool provided
> > in TeX Live.
> > 
> > Patch 7 ("Load 'url' package with 'hyphens' option") is not a fix but gives
> > room for line breaks within urls.
> > 
> > Patches 10 ("Localize alpha.bst") to 13 ("Use 'alphapf' bibliographystyle
> > instead of 'alpha'") actually replace bibliographystyle.
> > 
> > Patch 14 ("bib/RCU: Shorten author list of 'Appavoo03a'") is obviously
> > a workaround. The symptom appears only when "inlinelinks" option of
> > alphapf.bst is enabled. The root cause of the TeX error is not figured
> > out yet. Once it is fixed this patch can be reverted.
> > 
> > Patch 15 ("alphapf.bst: Enable 'inlinelinks'") does what the title says.
> > 
> > Patches 16--25 do cleanup of bib/realtime.bib. I selected it because
> > it contains 48 urls which seemed to be a reasonable number for a trial
> > patch.
> > 
> > Patch 16 ("bib/realtime: Replace 'Available: ... [Viewed ...]' with
> > 'URL: ...'") does what the (not yet implemented) script I mentioned
> > earlier would do.
> > 
> > Patches 17 ("bib/realtime: Update url of 'BillInmon2007a'") to
> > 22 ("bib/realtime: Update url of 'StephenShankland20Sep2006'") salvage
> > some of broken urls.
> > 
> > Patch 23 ("bib/realtime: Mark broken urls as such") marks those urls which
> > could not be salvaged. You may have other opinion of the form of notice
> > "[broken, ...]" appended to the de-hyperrefed url.
> > 
> > Patch 24 ("bib/realtime: Use alternative url for
> > 'IBMRealTimeJavaTechnology2007a'") replaces a missing url with what seems
> > to be close to the site originally cited.
> > 
> > Finally, patch 25 ("bib/realtime: Update 'lastchecked' fields") updates
> > "lastchecked" fields of urls which is reachable.
> > 
> > Let me explain "inlinelinks" option of "alphapf.bst" style (provided by
> > "urlbst" tool) a little.
> > 
> > When this option is disabled, urls and dois given in corresponding fields
> > are explicitly printed in Bibliography. In this case, urls are prefixed
> > by "URL: " by default.  The string is customizable.  But this looks too
> > verbose for me.
> > 
> > When this option is enabled, they are embedded as hyperlinks of "title"
> > strings of the entries. This will generate identical output in print as
> > standard "alpha" style. When both url and doi is provided in an entry, 
> > doi has a higher priority to be embedded as a hyperlink.
> > "alphapf.bst" also defines a field named "lastchecked", which is to be
> > used to indicate when the url is cited.
> > 
> > Regarding these features of alphapf.bst, I'm suggesting the following
> > entry formats in .bib files.
> > 
> > For "unpublished" entries,
> > 
> > > @unpublished{DavidAWheeler1996
> > > ,Author="David A. Wheeler"
> > > ,Title="Ada, C, C++, and Java vs. The Steelman"
> > > ,year="1996"
> > > ,note="URL:
> > > \url{http://www.adahome.com/History/Steelman/steeltab.htm}
> > > "
> > > ,lastchecked="November 4, 2016"
> > > }
> > 
> > The string "URL: " at the beginning of "note" field corresponds to the
> > default prefix of url printed when "inlinelinks" option is disabled.
> > You might feel hesitation in directly putting a string which is
> > customizable elsewhere (in alphapf.bst). It is possible to define a macro
> > and use it instead in bib entries, but that would cause trouble when you
> > do the same changes in your private bib library to be used other than
> > perfbook. So I directly put the string there. If it is all right to use
> > a macro, please let me know. I'll do a respin or add a patch just for
> > the replacement.
> > 
> > For other types of entries such as "conference",
> > 
> > > @conference{PeterOkech2009InherentRandomness
> > > ,Author="Nicholas {Mc Guire} and Peter Odhiambo Okech and Qingguo Zhou"
> > > ,Title="Analysis of inherent randomness of the Linux kernel"
> > > ,Booktitle="Eleventh Real Time Linux Workshop"
> > > ,month="September"
> > > ,year="2009"
> > > ,address="Dresden, Germany"
> > > ,url={https://www.osadl.org/?id=684}
> > > ,lastchecked="November 4, 2016"
> > > }
> > 
> > if you don't want the url to be printed in Bibliography.
> > 
> > Or,
> > 
> > > @conference{JoshTriplett2009PainlessKernel
> > > ,Author="Josh Triplett"
> > > ,Title="Painless kernel - removing the {HZ}"
> > > ,Booktitle="Linux Plumbers Conference"
> > > ,month="September"
> > > ,year="2009"
> > > ,address="Portland, OR, USA"
> > > ,note="URL:
> > > \url{http://linuxplumbersconf.org/2009/slides/Josh-Triplett-painless-kernel.pdf}"
> > > ,lastchecked="November 4, 2016"
> > > }
> > 
> > if you want the url to be printed.
> > 
> > Dates given in "lastchecked" fields are printed in the form of [cited ...]
> > when "inlinelinks" option is disabled and both "url" and "lastchecked" fields
> > exist in an entry. The string "cited " is customizable.
> > 
> > Also, if doi is available, it is expected to be stabler and more preferable than
> > a raw url.  This type of change is done in patch 21 ("bib/realtime: Replace url
> > with doi for 'RobertBerry2008IBMSysJ'"). The result is as follows:
> > 
> > > @article{RobertBerry2008IBMSysJ
> > > ,author="R. F. Berry and P. E. McKenney and F. N. Parr"
> > > ,title="Responsive systems: An introduction"
> > > ,Year="2008"
> > > ,Month="April"
> > > ,journal="IBM Systems Journal"
> > > ,volume="47"
> > > ,number="2"
> > > ,pages="197-206"
> > > ,doi="10.1147/sj.472.0197"
> > > }
> > 
> > Both "doi" and "url" fields can be given in an entry. 
> > 
> > As for broken links, I'm suggesting the following format:
> > 
> > > @unpublished{KristofferBohmann2001a
> > > ,Author="Kristoffer Bohmann"
> > > ,Title="Response Time Still Matters"
> > > ,month="July"
> > > ,year="2001"
> > > ,day="12"
> > > ,note="URL:
> > > \nolinkurl{http://www.bohmann.dk/articles/response_time_still_matters.html}
> > > [broken, November 2016]"
> > > ,lastchecked="July 23, 2007"
> > > }
> > 
> > This keeps the original "Viewed" date in "lastchecked" field.
> > Url is de-hyperrefed within \nolinkurl{} command.
> > If it becomes clear the content is not recoverable, you might want to remove
> > or modify text where it is cited.
> > 
> > The bad news for the cleanup is that there are a variety of format of "note"
> > fields found in other .bib files, and it seems not easy to implement a script
> > to do changes as patch 16 which covers all the cases. It might be easier to
> > manually edit by using keyboard macro of emacs...
> > 
> > Anyway, following is the pull request of the changes. Please take your time
> > to see and let me know what you think.
> > 
> > FYI, you might want to pull up to patch 9 ("bib: Remove domain part in doi
> > fields"). They are improvements and (potential) bug fixes.
> > 
> >                                             Thanks, Akira
> > ----
> > The following changes since commit bebc538fe4ee24603936e31c981e5342f85b88e5:
> > 
> >   Fix several typos (2016-10-26 16:15:36 -0700)
> > 
> > are available in the git repository at:
> > 
> >   https://github.com/akiyks/perfbook.git bib-url-cleanup-v1
> > 
> > for you to fetch changes up to 1b30f5f91a9bdd133c85d59b41201881b49b8872:
> > 
> >   bib/realtime: Update 'lastchecked' fields (2016-11-05 09:23:25 +0900)
> > 
> > ----------------------------------------------------------------
> > Akira Yokosawa (25):
> >       runlatex.sh: Add a round for possible bib update
> >       Makefile: Move $(BIBSOURCES) to dependency of .aux target
> >       bib: Add missing punctuation in 'url' field
> >       bib: Fix errors around \url{} command
> >       bib: Remove nested \url{} in 'url' field
> >       bib: Add missing \url{} command
> >       Load 'url' package with 'hyphens' option
> >       bib/os: Enclose url of 'BenjaminGamsa95a' in \url{} command
> >       bib: Remove domain part in doi fields
> >       Localize alpha.bst
> >       Costomize alpha.bst by 'urlbst' and rename as alphapf.bst
> >       alphapf.bst: Reorder 'note' field of 'unpublished' entry
> >       Use 'alphapf' bibliographystyle instead of 'alpha'
> >       bib/RCU: Shorten author list of 'Appavoo03a'
> >       alphapf.bst: Enable 'inlinelinks'
> >       bib/realtime: Replace 'Available: ... [Viewed ...]' with 'URL: ...'
> >       bib/realtime: Update url of 'BillInmon2007a'
> >       bib/realtime: Update url of 'KelvinNilsen2007'
> >       bib/realtime: Replace url of 'PaulEMcKenney2008OLS'
> >       bib/realtime: Update url of 'SunMicrosystems2008RTSJavaGC'
> >       bib/realtime: Replace url with doi for 'RobertBerry2008IBMSysJ'
> >       bib/realtime: Update url of 'StephenShankland20Sep2006'
> >       bib/realtime: Mark broken urls as such
> >       bib/realtime: Use alternative url for 'IBMRealTimeJavaTechnology2007a'
> >       bib/realtime: Update 'lastchecked' fields
> > 
> >  Makefile              |    6 +-
> >  alphapf.bst           | 1613 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  appendix/appendix.tex |    2 +-
> >  bib/RCU.bib           |   27 +-
> >  bib/RCUuses.bib       |    2 +-
> >  bib/TM.bib            |   39 +-
> >  bib/WFS.bib           |   19 +-
> >  bib/energy.bib        |    4 +-
> >  bib/hw.bib            |    2 +-
> >  bib/os.bib            |    6 +-
> >  bib/parallelsys.bib   |    8 +-
> >  bib/realtime.bib      |  264 ++++----
> >  bib/swtools.bib       |   12 +-
> >  bib/syncrefs.bib      |   10 +-
> >  perfbook.tex          |    1 +
> >  utilities/runlatex.sh |   10 +-
> >  16 files changed, 1851 insertions(+), 174 deletions(-)
> >  create mode 100644 alphapf.bst
> > 

