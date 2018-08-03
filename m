Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45938 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1731925AbeHDBlq (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 3
 Aug 2018 21:41:46 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w73NdP6N066733
 for <perfbook@vger.kernel.org>; Fri, 3 Aug 2018 19:43:19 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2kn0sdg818-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Fri, 03 Aug 2018 19:43:19 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 3 Aug 2018
 19:43:17 -0400
Date: Fri, 3 Aug 2018 16:43:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL v3] Trial of labeling lines in code snippets
Reply-To: paulmck@linux.vnet.ibm.com
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <18fcce90-11d6-4ab1-c6fc-73791a305091@gmail.com>
 <20180803143557.GA24813@linux.vnet.ibm.com>
 <1c8fb4a3-dd43-f6e9-3bf9-b1acf078f6e6@gmail.com>
 <20180803164511.GB24813@linux.vnet.ibm.com>
 <78672371-e921-302a-500e-d8e8ca2378f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78672371-e921-302a-500e-d8e8ca2378f5@gmail.com>
Message-Id: <20180803234314.GX24813@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 04, 2018 at 08:12:09AM +0900, Akira Yokosawa wrote:
> On 2018/08/03 09:45:11 -0700, Paul E. McKenney wrote:
> > On Sat, Aug 04, 2018 at 12:49:34AM +0900, Akira Yokosawa wrote:
> >> On 2018/08/03 07:35:57 -0700, Paul E. McKenney wrote:
> >>> On Fri, Aug 03, 2018 at 07:34:51AM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> This is v3 of the trial of fancyvrb scheme.
> >>>>
> >>>> Changes in v2 -> v3
> >>>>
> >>>>     o Define "linelabel" and "lineref" environments and use them in the early part of
> >>>>       toolsoftrade.
> >>>>     o Define "VerbatimU" env for short snippet with no line count and use it for
> >>>>       a couple of snippet in toolsoftrade.
> >>>>     o Rename "VerbatimM" to "VerbatimN".
> >>>>     o Remove "[EXP]" in commit log titles.
> >>>>
> >>>>           Thanks, Akira
> >>>>
> >>>> ---
> >>>> The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:
> >>>>
> >>>>   Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)
> >>>>
> >>>> are available in the git repository at:
> >>>>
> >>>>   https://github.com/akiyks/perfbook.git trial-fancyvrb-20180802a
> >>>>
> >>>> for you to fetch changes up to 6bf7a51b7b9dadf54a0b1edc8959fafed0fcf671:
> >>>>
> >>>>   Add 'linelabel' and 'lineref' environment (2018-08-03 07:21:49 +0900)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Akira Yokosawa (9):
> >>>>       toolsoftrade: Add labels in code samples as comments
> >>>>       Add script to extract code snippet from code sample
> >>>>       toolsoftrade: Reference line in code snippets by label
> >>>>       Update hyphen2endash
> >>>>       Add *.fcv to .gitignore
> >>>>       Automate sub makefile update
> >>>>       Specify lmtt font for VerbatimM env
> >>>>       toolsoftrade: Use \lnlbl in inline code snippet
> >>>>       Add 'linelabel' and 'lineref' environment
> >>>>
> >>>>  .gitignore                              |   2 +
> >>>>  CodeSamples/api-pthreads/api-pthreads.h |  18 +--
> >>>>  CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
> >>>>  CodeSamples/toolsoftrade/pcreate.c      |   7 +-
> >>>>  Makefile                                |  14 ++-
> >>>>  perfbook.tex                            |  21 ++++
> >>>>  toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
> >>>>  utilities/fcvextract.pl                 | 166 +++++++++++++++++++++++++
> >>>>  utilities/gen_snippet_mk.pl             |  55 +++++++++
> >>>>  utilities/hyphen2endash.sh              |   3 +
> >>>>  10 files changed, 351 insertions(+), 158 deletions(-)
> >>>>  create mode 100755 utilities/fcvextract.pl
> >>>>  create mode 100755 utilities/gen_snippet_mk.pl
> >>>
> >>> Looks nice!
> >>>
> >>> However, I tried updating a label in CodeSamples/toolsoftrade/forkjoinvar.c
> >>> like this (and yes, this is a nonsensical change just for testing):
> >>>
> >>> ------------------------------------------------------------------------
> >>>
> >>> diff --git a/CodeSamples/toolsoftrade/forkjoinvar.c b/CodeSamples/toolsoftrade/forkjoinvar.c
> >>> index 1580478fe2f9..642451d9e880 100644
> >>> --- a/CodeSamples/toolsoftrade/forkjoinvar.c
> >>> +++ b/CodeSamples/toolsoftrade/forkjoinvar.c
> >>> @@ -35,11 +35,11 @@ int main(int argc, char *argv[])
> >>>  	if (pid == 0) { /* child */
> >>>  		x = 1;					//\lnlbl{setx}
> >>>  		printf("Child process set x=1\n");	//\lnlbl{print:c}
> >>> -		exit(EXIT_SUCCESS);			//\lnlbl{exit:s}
> >>> +		exit(EXIT_SUCCESS);
> >>>  	}
> >>>  	if (pid < 0) { /* parent, upon error */
> >>>  		perror("fork");
> >>> -		exit(EXIT_FAILURE);
> >>> +		exit(EXIT_FAILURE);			//\lnlbl{exit:s}
> >>>  	}
> >>>  
> >>>  	/* parent */
> >>>
> >>> ------------------------------------------------------------------------
> >>>
> >>> When I typed "make", I got this:
> >>>
> >>> ------------------------------------------------------------------------
> >>>
> >>> $ make
> >>> sh utilities/autodate.sh >autodate.tex
> >>> ./utilities/gen_snippet_mk.pl > CodeSamples/snippets.mk
> >>> Use of uninitialized value $_ in substitution (s///) at ./utilities/gen_snippet_mk.pl line 47.
> >>> Use of uninitialized value $_ in concatenation (.) or string at ./utilities/gen_snippet_mk.pl line 48.
> >>> echo > qqz.tex
> >>> echo > contrib.tex
> >>> echo > origpub.tex
> >>> make -C CodeSamples -f snippets.mk
> >>> make[1]: Entering directory `/home/git/perfbook/CodeSamples'
> >>>  --> toolsoftrade/toolsoftrade.fcv
> >>>  Use of uninitialized value $extract_labelbase in concatenation (.) or string at ../utilities/fcvextract.pl line 115.
> >>>  make[1]: *** [toolsoftrade/toolsoftrade.fcv] Error 1
> >>>  make[1]: Leaving directory `/home/git/perfbook/CodeSamples'
> >>>  make: *** [perfbook_flat.tex] Error 2
> >>>
> >>> ------------------------------------------------------------------------
> >>
> >> There is one thing I'd like to confirm.
> >> Did you do "make" just after checking out the trial branch (before
> >> modifying forkjoinvar.c)?
> > 
> > Yes.  I pulled your changes, typed "make", modified forkjoinvar.c,
> > typed "make" again, and then saw the failure.  When I next modified
> > forkjoinvar.c yet again and yet again typed "make", no failure.
> > 
> >> I can't reproduce the above issue on the head of the branch.
> > 
> > Hmmm...  Let me try again.
> > 
> > 1.	Checkout origin/master, type "make".  Builds fine.
> > 
> > 2.	Checkout your most recent branch, type "make".  Builds fine.
> > 
> > 3.	Apply diff.  Builds fine.
> > 
> > So I cannot reproduce, either.  Hate it when that happens.  :-/
> > 
> > But all the .fcv files would be left around, which might be influencing
> > things.  Let's remove those and try again.
> > 
> > 1.	Checkout origin/master, type "make".  Builds fine.
> > 
> > 2.	Checkout your most recent branch, type "make".  This now fails:
> > 
> > $ make
> > sh utilities/autodate.sh >autodate.tex
> > ./utilities/gen_snippet_mk.pl > CodeSamples/snippets.mk
> > Use of uninitialized value $_ in substitution (s///) at ./utilities/gen_snippet_mk.pl line 47.
> > Use of uninitialized value $_ in concatenation (.) or string at ./utilities/gen_snippet_mk.pl line 48.
> > echo > qqz.tex
> > echo > contrib.tex
> > echo > origpub.tex
> > make -C CodeSamples -f snippets.mk
> > make[1]: Entering directory `/home/git/perfbook/CodeSamples'
> > toolsoftrade/pcreate.c --> toolsoftrade/pcreate@mythread.fcv
> >  --> toolsoftrade/toolsoftrade.fcv
> > Use of uninitialized value $extract_labelbase in concatenation (.) or string at ../utilities/fcvextract.pl line 115.
> > make[1]: *** [toolsoftrade/toolsoftrade.fcv] Error 1
> > make[1]: Leaving directory `/home/git/perfbook/CodeSamples'
> > make: *** [perfbook_flat.tex] Error 2
> > 
> 
> Hmm... I still can't reproduce.
> The error message suggests failure to generate CodeSamples/snippets.mk
> 
> Might be a mismatch in perl version.
> 
> I've tested perl 5.18.2 on Ubuntu 14.04 and 5.22.1 on Ubuntu 16.04.
> perl 5.16.3 on CentOS 7 also works fine.
> 
> What version of perl are you using?

Here is what "perl -v" tells me:

This is perl 5, version 18, subversion 2 (v5.18.2) built for x86_64-linux-gnu-thread-multi
(with 53 registered patches, see perl -V for more detail)

Copyright 1987-2013, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

> > 3.	Type "make" again.  Builds fine.
> > 
> >> In the middle of the branch, there is a point when CodeSamples/snippets.mk
> >> resides in the repository. It might have newer time stamp than the
> >> modified forkjoinvar.c. (Well, I'don't think this is likely...)
> > 
> > I didn't test any but your last commit, if that is what you are asking.
> > 
> >> I'll add a recipe to remove CodeSamples/snippets.mk by "make clean".
> >> You'll be able to do "make clean; make" if something goes wrong.
> > 
> > Adding that and the .fcv files to "make clean" sounds like a good thing
> > in general.  Give or take my experience when the .fcv files were missing,
> > anyway.  ;-)
> > 
> > Except that "make clean" already removes at least some of the .fcv files.
> > And the top-level snippets.mk file.  Ah, but not CodeSamples/snippets.mk.
> > 
> >>> I typed "make" again and no errors.  Plus it did update as I expected it
> >>> to.  And when I changed it back, it built the first time without errors.
> >>
> >> Ah, you don't reproduce it once "make" succeeds. Hmm...
> >>
> >>> Do I perhaps have a shortcoming in my (admittedly ancient) environment?
> >>> Or is this something that happens the first time the new functionality
> >>> is exercised on a change?
> >>
> >> Build script changes might need "make clean" after "git pull".
> >> (Current HEAD doesn't remove snippets.mk even by "make neatfreak", though.)
> > 
> > If I do "rm CodeSamples/toolsoftrade/*.fcv", "make clean", and then
> > "make", I get this:
> 
> Actually, "make clean" removes those generated "*.fcv" files.
> In the recipe of "clean", CodeSamples/snippets.mk is invoked by
> 	$(MAKE) -C CodeSamples -f snippets.mk clean
> 
> > 
> > $ make
> > sh utilities/autodate.sh >autodate.tex
> > future/ibmqx2-labeled.svg --> future/ibmqx2-labeled.png
> > echo > qqz.tex
> > echo > contrib.tex
> > echo > origpub.tex
> > make -C CodeSamples -f snippets.mk
> > make[1]: Entering directory `/home/git/perfbook/CodeSamples'
> > toolsoftrade/pcreate.c --> toolsoftrade/pcreate@mythread.fcv
> >  --> toolsoftrade/toolsoftrade.fcv
> > Use of uninitialized value $extract_labelbase in concatenation (.) or string at ../utilities/fcvextract.pl line 115.
> > make[1]: *** [toolsoftrade/toolsoftrade.fcv] Error 1
> > make[1]: Leaving directory `/home/git/perfbook/CodeSamples'
> > make: *** [perfbook_flat.tex] Error 2
> > 
> 
> This means removing CodeSamples/snippets.mk in "make clean" does not help
> you.
> 
> Hmm...

Well, it is usable, albeit a bit obnoxious, so perhaps we should move
ahead.  Perhaps additional use will provide more clues.

							Thanx, Paul

> > Then another "make" works fine.> 
> >> I also have some other updates in build scripts to add dependencies to
> >> code/makefile generation scripts themselves. Will submit another pull request
> >> when it's ready.
> > 
> > Sounds very good!
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >>
> >>>
> >>> But even so, this is -way- more convenient than my old approach of doing
> >>> all the changes by hand!!!
> >>>
> >>> 							Thanx, Paul
> >>>
> >>
> > 
> 

