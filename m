Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43264 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1726556AbeHFAxh (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 5
 Aug 2018 20:53:37 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w75MiFso144008
 for <perfbook@vger.kernel.org>; Sun, 5 Aug 2018 18:47:24 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2knrytq1f3-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 05 Aug 2018 18:47:24 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 5 Aug 2018
 18:47:23 -0400
Date: Sun, 5 Aug 2018 15:47:19 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL v5] Trial of labeling lines in code snippets
Reply-To: paulmck@linux.vnet.ibm.com
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <65eb47fb-678b-b8a1-9c5b-483e82b6516a@gmail.com>
 <20180805163508.GI24813@linux.vnet.ibm.com>
 <20180805165448.GA9869@linux.vnet.ibm.com>
 <9b6c0ec9-1b73-ecfb-62bc-7289bd6fe383@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b6c0ec9-1b73-ecfb-62bc-7289bd6fe383@gmail.com>
Message-Id: <20180805224719.GJ24813@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 06, 2018 at 06:58:20AM +0900, Akira Yokosawa wrote:
> On 2018/08/05 09:54:48 -0700, Paul E. McKenney wrote:
> > On Sun, Aug 05, 2018 at 09:35:08AM -0700, Paul E. McKenney wrote:
> >> On Sun, Aug 05, 2018 at 09:06:27AM +0900, Akira Yokosawa wrote:
> >>> Hi Paul,
> >>>
> >>> This is hopefully the final version of this trial branch.
> >>>
> >>> Changes since v4:
> >>>
> >>>     o Instead of generating CodeSamples/snippets.mk and calling it from
> >>>       main Makefile, generate CodeSamples/snippets.d which contains
> >>>       only dependencies and include it in the Makefile.
> >>>
> >>> This change can fix the error you encountered in the previous version.
> >>> I'm just hoping...
> >>
> >> Hmmmm...
> >>
> >> 	$ make
> >> 	sh ./utilities/gen_snippet_d.sh
> >> 	CodeSamples/toolsoftrade/pcreate.c --> CodeSamples/toolsoftrade/pcreate@mythread.fcv
> >>
> >> But "make 2c" works.  This might be because I don't have the
> >> PERFBOOK_DEFAULT environment variable set?  Except that the Makefile code
> >> looks like this would have the default "make all" have the same effect as
> >> "make 2c".  Color me confused.
> 
> No. It was my fault. I failed to test the simple "make".
> To override my env variable setting of "PERFBOOK_DEFUALT=msnt 1csf",
> I tend to use one of "make msnt" or "make msnt 1csf" or "make 2c".
> 
> I see the same behavior when I do simple "make" regardless
> of PERFBOOK_DEFAULT is set or unset.

Been there, done that!  ;-)

> >> Anyway, yes, when I do "make 2c" it correctly reacts to moving labels
> >> around in CodeSamples/toolsoftrade/forkjoinvar.c, so that is good!
> >>
> >> Here is the output of "make -v", in case that matters:
> >>
> >> 	GNU Make 3.81
> >> 	Copyright (C) 2006  Free Software Foundation, Inc.
> >> 	This is free software; see the source for copying conditions.
> >> 	There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
> >> 	PARTICULAR PURPOSE.
> >>
> >> 	This program built for x86_64-pc-linux-gnu
> > 
> > And the diff below restores the behavior I would expect for "make",
> > even when modifying tags in CodeSamples/toolsoftrade/forkjoinvar.c,
> > though of course it might well break something else.  (And the diff
> > happens to include my test change to forkjoinvar.c.)
> > 
> > Thoughts?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/Makefile b/Makefile
> > index fe9f63f43e55..3e9e2c2ebf3c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -85,13 +85,6 @@ endif
> >  SOURCES_OF_SNIPPET := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
> >  GEN_SNIPPET_D  = utilities/gen_snippet_d.pl utilities/gen_snippet_d.sh
> >  
> > -ifeq ($(MAKECMDGOALS),clean)
> > -else ifeq ($(MAKECMDGOALS),distclean)
> > -else ifeq ($(MAKECMDGOALS),neatfreak)
> > -else
> > --include CodeSamples/snippets.d
> > -endif
> > -
> >  default = $(PERFBOOK_DEFAULT)
> >  
> >  ifeq ($(default),)
> > @@ -103,6 +96,13 @@ endif
> >  .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help
> >  all: $(targ)
> >  
> > +ifeq ($(MAKECMDGOALS),clean)
> > +else ifeq ($(MAKECMDGOALS),distclean)
> > +else ifeq ($(MAKECMDGOALS),neatfreak)
> > +else
> > +-include CodeSamples/snippets.d
> > +endif
> > +
> >  2c: perfbook.pdf
> >  
> >  mslm: perfbook-mslm.pdf
> 
> This change works for me too.
> 
> Do you want me to add the change to the trial branch?
> I don't mind if you add the change yourself with my
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Of course, the following diff should be omitted.

I pushed out an akiyks.2018.08.05a branch with the commit (but without
the forkjoinvar.c change), and with your ack.

When you say it is ready, I will bring my master branch out to that
commit.  Or if you have another pull request for an updated version
of this series, I will replace it with that.

Either way, please let me know!

							Thanx, Paul

>         Thanks, Akira
> 
> > diff --git a/CodeSamples/toolsoftrade/forkjoinvar.c b/CodeSamples/toolsoftrade/forkjoinvar.c
> > index 1580478fe2f9..642451d9e880 100644
> > --- a/CodeSamples/toolsoftrade/forkjoinvar.c
> > +++ b/CodeSamples/toolsoftrade/forkjoinvar.c
> > @@ -35,11 +35,11 @@ int main(int argc, char *argv[])
> >  	if (pid == 0) { /* child */
> >  		x = 1;					//\lnlbl{setx}
> >  		printf("Child process set x=1\n");	//\lnlbl{print:c}
> > -		exit(EXIT_SUCCESS);			//\lnlbl{exit:s}
> > +		exit(EXIT_SUCCESS);
> >  	}
> >  	if (pid < 0) { /* parent, upon error */
> >  		perror("fork");
> > -		exit(EXIT_FAILURE);
> > +		exit(EXIT_FAILURE);			//\lnlbl{exit:s}
> >  	}
> >  
> >  	/* parent */
> > 
> 

