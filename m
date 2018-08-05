Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56300 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1726207AbeHESkV (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 5 Aug 2018 14:40:21 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w75GXiUT036069
 for <perfbook@vger.kernel.org>; Sun, 5 Aug 2018 12:35:12 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2knscayq8p-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 05 Aug 2018 12:35:12 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 5 Aug 2018
 12:35:11 -0400
Date: Sun, 5 Aug 2018 09:35:08 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL v5] Trial of labeling lines in code snippets
Reply-To: paulmck@linux.vnet.ibm.com
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <65eb47fb-678b-b8a1-9c5b-483e82b6516a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65eb47fb-678b-b8a1-9c5b-483e82b6516a@gmail.com>
Message-Id: <20180805163508.GI24813@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Aug 05, 2018 at 09:06:27AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is hopefully the final version of this trial branch.
> 
> Changes since v4:
> 
>     o Instead of generating CodeSamples/snippets.mk and calling it from
>       main Makefile, generate CodeSamples/snippets.d which contains
>       only dependencies and include it in the Makefile.
> 
> This change can fix the error you encountered in the previous version.
> I'm just hoping...

Hmmmm...

	$ make
	sh ./utilities/gen_snippet_d.sh
	CodeSamples/toolsoftrade/pcreate.c --> CodeSamples/toolsoftrade/pcreate@mythread.fcv

But "make 2c" works.  This might be because I don't have the
PERFBOOK_DEFAULT environment variable set?  Except that the Makefile code
looks like this would have the default "make all" have the same effect as
"make 2c".  Color me confused.

Anyway, yes, when I do "make 2c" it correctly reacts to moving labels
around in CodeSamples/toolsoftrade/forkjoinvar.c, so that is good!

Here is the output of "make -v", in case that matters:

	GNU Make 3.81
	Copyright (C) 2006  Free Software Foundation, Inc.
	This is free software; see the source for copying conditions.
	There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
	PARTICULAR PURPOSE.

	This program built for x86_64-pc-linux-gnu

							Thanx, Paul

>         Thanks, Akira
> 
> --- 
> The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:
> 
>   Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git trial-fancyvrb-20180804b
> 
> for you to fetch changes up to d9a36224084b2e4ba55797eff0c37de528b59d6b:
> 
>   Add dependencies of perfbook_flat.tex to CodeSamples/.../*.fcv files (2018-08-05 08:44:02 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (12):
>       toolsoftrade: Add labels in code samples as comments
>       Add script to extract code snippet from code sample
>       toolsoftrade: Reference line in code snippets by label
>       Update hyphen2endash
>       Add *.fcv to .gitignore
>       Automate sub makefile update
>       Specify lmtt font for VerbatimM env
>       toolsoftrade: Use \lnlbl in inline code snippet
>       Add 'linelabel' and 'lineref' environment
>       Catch failure in genaration of CodeSamples/snippets.mk
>       Add dependencis to scripts for extracting code snippets
>       Add dependencies of perfbook_flat.tex to CodeSamples/.../*.fcv files
> 
>  .gitignore                              |   2 +
>  CodeSamples/api-pthreads/api-pthreads.h |  18 +--
>  CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
>  CodeSamples/toolsoftrade/pcreate.c      |   7 +-
>  Makefile                                |  25 +++-
>  perfbook.tex                            |  21 ++++
>  toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
>  utilities/fcvextract.pl                 | 168 +++++++++++++++++++++++++
>  utilities/gen_snippet_d.pl              |  65 ++++++++++
>  utilities/gen_snippet_d.sh              |   8 ++
>  utilities/hyphen2endash.sh              |   3 +
>  11 files changed, 382 insertions(+), 158 deletions(-)
>  create mode 100755 utilities/fcvextract.pl
>  create mode 100755 utilities/gen_snippet_d.pl
>  create mode 100644 utilities/gen_snippet_d.sh
> 

