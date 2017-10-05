Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41502 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751868AbdJEUsg (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 5
 Oct 2017 16:48:36 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v95KjVpE020284
 for <perfbook@vger.kernel.org>; Thu, 5 Oct 2017 16:48:36 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ddqekekuw-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 05 Oct 2017 16:48:35 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 5 Oct 2017
 16:48:34 -0400
Date: Thu, 5 Oct 2017 13:48:31 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 00/10] Tweaks to follow guidelines in style guide
Reply-To: paulmck@linux.vnet.ibm.com
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Message-Id: <20171005204831.GX3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 06, 2017 at 12:47:21AM +0900, Akira Yokosawa wrote:
> >From 2890e0069882321553c16aac213d4bb8d0a06fb7 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 5 Oct 2017 22:57:46 +0900
> Subject: [PATCH 00/10] Tweaks to follow guidelines in style guide
> 
> Hi Paul,
> 
> This patch set consists of minor tweaks in regard to the suggestions
> having been presented in style guide for a while.
> 
> Patches #1 -- #5 are trivial changes.
> 
> Patch #6 attempts to improve consistency in denoting POWER series CPU
> by defining a macro "\Power{}".
> 
> Patch #7 substitutes "GCC" for "gcc". There are a few exceptions as
> mentioned in commit log.
> 
> Patch #8 substitutes "IRQ" for "irq" in the same way. You might like
> to skip this one, as I see "irq" more often than "IRQ" in Linux
> documentations.
> 
> Patch #9 is somewhat invasive. It switches Times font to that of
> "newtxtext" and "newtxmath" packages. The reason of the change
> is to have access to both upright and slated glyphs of Greek letters.
> Recent versions of these font packages give better looking result,
> especially in math mode. As noted in the commit log, newtxmath in
> TeX Live 2013/Debian has a few issues which have been fixed in later
> versions. It also switches font choice for the experimental target "1csf".
> 
> Patch #10 updates style guide to reflect the changes made in this
> patch set.

They look fine, so I applied them, thank you!  We might want to go with
"irq", but let's see how people react.  Easy to change, aside from
beginnings of sentences!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (10):
>   debugging: Insert narrow space in front of percent symbol
>   debugging: Use upright font for Euler's number
>   future/QC: Insert narrow space in front of percent symbol
>   future/QC: Use non-breakable hyphen for axis names
>   treewide: Insert narrow space in front of percent symbol
>   treewide: Use \Power{} macro for POWER CPU family
>   treewide: Call GNU C compiler as "GCC"
>   treewide: Use "IRQ" instead of "irq" used as abbreviation
>   future/QC: Use upright glyph for math constant and descriptive suffix
>   styleguide: Reflect recent style improvements
> 
>  FAQ-BUILD.txt                      |   4 +-
>  Makefile                           |   2 +-
>  SMPdesign/SMPdesign.tex            |   2 +-
>  SMPdesign/beyond.tex               |  14 ++---
>  advsync/advsync.tex                |   2 +-
>  appendix/styleguide/styleguide.tex |  64 ++++++++---------------
>  appendix/toyrcu/toyrcu.tex         |  26 +++++-----
>  count/count.tex                    |  28 +++++-----
>  cpu/hwfreelunch.tex                |   4 +-
>  datastruct/datastruct.tex          |   2 +-
>  debugging/debugging.tex            | 104 ++++++++++++++++++-------------------
>  defer/rcuapi.tex                   |   6 +--
>  defer/rcuusage.tex                 |   4 +-
>  formal/dyntickrcu.tex              |  52 +++++++++----------
>  formal/formal.tex                  |   2 +-
>  formal/spinhint.tex                |   2 +-
>  future/QC.tex                      |  92 ++++++++++++++++----------------
>  future/htm.tex                     |   2 +-
>  future/tm.tex                      |   4 +-
>  intro/intro.tex                    |   8 +--
>  memorder/memorder.tex              |  32 ++++++------
>  perfbook.tex                       |  20 +++++--
>  rt/rt.tex                          |  22 ++++----
>  toolsoftrade/toolsoftrade.tex      |  24 ++++-----
>  24 files changed, 257 insertions(+), 265 deletions(-)
> 
> -- 
> 2.7.4
> 
> 

