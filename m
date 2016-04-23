Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e19.ny.us.ibm.com ([129.33.205.209]:39607 "EHLO
 e19.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751811AbcDWTT7 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 23 Apr 2016
 15:19:59 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 23 Apr
 2016 15:19:58 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id BC42938C803B
 for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 15:19:56 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3NJJuBN36372608	for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 19:19:56
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3NJJuoH013677	for <perfbook@vger.kernel.org>; Sat, 23 Apr 2016 15:19:56
 -0400
Date: Sat, 23 Apr 2016 12:20:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/3] qqz and runlatex improvements
Message-ID: <20160423192029.GP3756@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571B5FBE.6030005@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571B5FBE.6030005@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 23, 2016 at 08:42:54PM +0900, Akira Yokosawa wrote:
> >From 0a9063f5bfc9a984b505fefe54d347f39e099f58 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Sat, 23 Apr 2016 20:37:29 +0900
> Subject: [PATCH v2 0/3] qqz and runlatex improvements
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
> However, .sty file modification may introduce regressions and
> should be fully tested before being pushed out. Can anybody on the
> list test it and give feedback?
> 
> Thanks.
> 
> Changes since v1:
> Refactored runlatex.sh into 3 parts and improved the build behavior
> in response to the feedbacks from Paul[1].
> As the result of the change, *.bbl files are not necessary any more,
> so a patch to remove them is added.
> 
> [1] http://www.spinics.net/lists/perfbook/msg00160.html

I played around with it a bit, and it is very nice, a definite improvement
over my original!!!  Thank you!

Just a couple of very small things left:

1.	Because perfbook currently has a fairly low change rate and
	a mostly linear history, please feel free to put something
	like "previous commit" or "next commit" in place of your
	X-ed-out SHA-1 commit IDs.

	If you really want to include the SHA-1 numbers for the
	backwards references, that is fine, just set them up and
	send me a pull request.  (When I "git am" your email, I will
	get different SHA-1 commit IDs than you got, but "git pull"
	preserves the IDs.)

	Your choice!

2.	The second patch gets a trailing-whitespace error.  Could you
	please fix that?

							Thanx, Paul

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
>  qqz.sty                    |   14 +-
>  utilities/runfirstlatex.sh |   46 +
>  utilities/runlatex.sh      |   85 +-
>  8 files changed, 168 insertions(+), 6232 deletions(-)
>  delete mode 100644 perfbook-1c.bbl
>  delete mode 100644 perfbook-hb.bbl
>  delete mode 100644 perfbook.bbl
>  create mode 100644 utilities/runfirstlatex.sh
> 
> -- 
> 1.9.1
> 

