Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42516 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1726271AbeHETAF (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 5 Aug 2018 15:00:05 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w75GrlIM048540
 for <perfbook@vger.kernel.org>; Sun, 5 Aug 2018 12:54:52 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2knscgr3e5-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 05 Aug 2018 12:54:52 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 5 Aug 2018
 12:54:51 -0400
Date: Sun, 5 Aug 2018 09:54:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL v5] Trial of labeling lines in code snippets
Reply-To: paulmck@linux.vnet.ibm.com
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <65eb47fb-678b-b8a1-9c5b-483e82b6516a@gmail.com>
 <20180805163508.GI24813@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180805163508.GI24813@linux.vnet.ibm.com>
Message-Id: <20180805165448.GA9869@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Aug 05, 2018 at 09:35:08AM -0700, Paul E. McKenney wrote:
> On Sun, Aug 05, 2018 at 09:06:27AM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > This is hopefully the final version of this trial branch.
> > 
> > Changes since v4:
> > 
> >     o Instead of generating CodeSamples/snippets.mk and calling it from
> >       main Makefile, generate CodeSamples/snippets.d which contains
> >       only dependencies and include it in the Makefile.
> > 
> > This change can fix the error you encountered in the previous version.
> > I'm just hoping...
> 
> Hmmmm...
> 
> 	$ make
> 	sh ./utilities/gen_snippet_d.sh
> 	CodeSamples/toolsoftrade/pcreate.c --> CodeSamples/toolsoftrade/pcreate@mythread.fcv
> 
> But "make 2c" works.  This might be because I don't have the
> PERFBOOK_DEFAULT environment variable set?  Except that the Makefile code
> looks like this would have the default "make all" have the same effect as
> "make 2c".  Color me confused.
> 
> Anyway, yes, when I do "make 2c" it correctly reacts to moving labels
> around in CodeSamples/toolsoftrade/forkjoinvar.c, so that is good!
> 
> Here is the output of "make -v", in case that matters:
> 
> 	GNU Make 3.81
> 	Copyright (C) 2006  Free Software Foundation, Inc.
> 	This is free software; see the source for copying conditions.
> 	There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
> 	PARTICULAR PURPOSE.
> 
> 	This program built for x86_64-pc-linux-gnu

And the diff below restores the behavior I would expect for "make",
even when modifying tags in CodeSamples/toolsoftrade/forkjoinvar.c,
though of course it might well break something else.  (And the diff
happens to include my test change to forkjoinvar.c.)

Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/Makefile b/Makefile
index fe9f63f43e55..3e9e2c2ebf3c 100644
--- a/Makefile
+++ b/Makefile
@@ -85,13 +85,6 @@ endif
 SOURCES_OF_SNIPPET := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
 GEN_SNIPPET_D  = utilities/gen_snippet_d.pl utilities/gen_snippet_d.sh

-ifeq ($(MAKECMDGOALS),clean)
-else ifeq ($(MAKECMDGOALS),distclean)
-else ifeq ($(MAKECMDGOALS),neatfreak)
-else
--include CodeSamples/snippets.d
-endif
-
 default = $(PERFBOOK_DEFAULT)

 ifeq ($(default),)
@@ -103,6 +96,13 @@ endif
 .PHONY: all touchsvg clean distclean neatfreak 2c ls-unused $(ABBREVTARGETS) mslm perfbook-mslm.pdf mslmmsg help
 all: $(targ)

+ifeq ($(MAKECMDGOALS),clean)
+else ifeq ($(MAKECMDGOALS),distclean)
+else ifeq ($(MAKECMDGOALS),neatfreak)
+else
+-include CodeSamples/snippets.d
+endif
+
 2c: perfbook.pdf

 mslm: perfbook-mslm.pdf
diff --git a/CodeSamples/toolsoftrade/forkjoinvar.c b/CodeSamples/toolsoftrade/forkjoinvar.c
index 1580478fe2f9..642451d9e880 100644
--- a/CodeSamples/toolsoftrade/forkjoinvar.c
+++ b/CodeSamples/toolsoftrade/forkjoinvar.c
@@ -35,11 +35,11 @@ int main(int argc, char *argv[])
 	if (pid == 0) { /* child */
 		x = 1;					//\lnlbl{setx}
 		printf("Child process set x=1\n");	//\lnlbl{print:c}
-		exit(EXIT_SUCCESS);			//\lnlbl{exit:s}
+		exit(EXIT_SUCCESS);
 	}
 	if (pid < 0) { /* parent, upon error */
 		perror("fork");
-		exit(EXIT_FAILURE);
+		exit(EXIT_FAILURE);			//\lnlbl{exit:s}
 	}

 	/* parent */

