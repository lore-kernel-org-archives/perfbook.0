Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:43321 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1753124AbcDXS6X (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 24 Apr 2016
 14:58:23 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 24 Apr
 2016 12:58:22 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 C2D723E4001C	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 12:58:08 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3OIw8x938404222	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 18:58:08
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3OIw7Jp009881	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 14:58:08
 -0400
Date: Sat, 23 Apr 2016 22:05:52 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 0/3] qqz and runlatex improvements
Message-ID: <20160424050552.GS3756@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571C1843.1060906@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571C1843.1060906@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 24, 2016 at 09:50:11AM +0900, Akira Yokosawa wrote:
> >From 687dd92a14a751c5919c80f9d7d8609db94d7634 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Sun, 24 Apr 2016 09:26:52 +0900
> Subject: [PATCH v3 0/3] qqz and runlatex improvements
> 
> Hi,
> 
> There have been two issues that bother me a little since I began to
> build perfbook.pdf myself.
> One is the cross-link references of quick quizzes that land on random
> nearby places in the PDF.
> The other is the premature termination of make with warning messages
> displayed.
> I think I have managed to fix both issues.
> 
> Paul tested v2 of this series and found that it is ready to be pushed
> out if minor fixes of a trailing blank and "XXXXXX" in commit messages
> are done.

Merged and pushed, thank you!

							Thanx, Paul

> Changes since v2:
>     Updated copyright notices in qqz.sty
>     Removed a trailing blank in runfirstlatex.sh
>     Fixed "XXXXXX" in commit messages
>     Added "-f" option to "rm" in runlatex.sh
>     Other minor changes in commit messages
> 
> Changes since v1:
> Refactored runlatex.sh into 3 parts and improved the build behavior
> in response to the feedback's from Paul[1].
> As the result of the change, *.bbl files are not necessary any more,
> so a patch to remove them is added.
> 
> [1] http://www.spinics.net/lists/perfbook/msg00160.html
> 
> Akira Yokosawa (3):
>   qqz: Improve accuracy of cross-links
>   Improve behavior of build scripts
>   Remove *.bbl from repository
> 
>  .gitignore                 |    2 +-
>  Makefile                   |   55 +-
>  perfbook-1c.bbl            | 2103 -------------------------------------------
>  perfbook-hb.bbl            | 1949 ----------------------------------------
>  perfbook.bbl               | 2146 --------------------------------------------
>  qqz.sty                    |   18 +-
>  utilities/runfirstlatex.sh |   46 +
>  utilities/runlatex.sh      |   85 +-
>  8 files changed, 172 insertions(+), 6232 deletions(-)
>  delete mode 100644 perfbook-1c.bbl
>  delete mode 100644 perfbook-hb.bbl
>  delete mode 100644 perfbook.bbl
>  create mode 100644 utilities/runfirstlatex.sh
> 
> -- 
> 1.9.1
> 

