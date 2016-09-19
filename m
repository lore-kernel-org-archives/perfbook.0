Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40696 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751032AbcISXCC (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 19 Sep 2016 19:02:02 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8JMvRPb113300
 for <perfbook@vger.kernel.org>; Mon, 19 Sep 2016 19:02:01 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 25jmqyk4ab-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 19 Sep 2016 19:02:01 -0400
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 19 Sep
 2016 17:02:00 -0600
Date: Mon, 19 Sep 2016 16:01:59 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATH 0/6] Indent tweaks after chapter title and epigraph
Reply-To: paulmck@linux.vnet.ibm.com
References: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Message-Id: <20160919230159.GR10850@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 19, 2016 at 12:00:09PM +0900, Akira Yokosawa wrote:
> >From 85e0ec292cb75cad1ef71812fee11ed44ecc4ce8 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 19 Sep 2016 11:07:31 +0900
> Subject: [RFC PATH 0/6] Indent tweaks after chapter title and epigraph
> 
> Hi Paul,
> 
> After commit a9fe7df2efbc ("treewide: Enclose 'verbbox' within
> 'figure'"), inconsistency of indent of first paragraph of a chapter
> became more disturbing (maybe just for me).
> 
> I noticed "book.cls" is already localized in the repository, and
> found a possible fix of the behavior of chapter heading in twocolumn
> layout there.
> 
> As for epigraph, there are two ways to make the following paragraph
> not to indent.
> One is to patch the "\epigraph" command to put "afterheading-ness"
> at the end of the command.
> The other is to use "\epigraphhead" and place the epigraph at
> the header area of a page.
> 
> My preference is to place epigraphs at he right hand side of the
> page even in twocolumn layout. The effect of using "epigraphhead"
> command is not identical to what I wanted, but the result seems
> better than what I had first anticipated.
> 
> So, I chose the latter approach and composed this series to do
> the change.
> 
> I'd like you to try it and give me feedback if any.

This looks much nicer!  Queued and pushed.

						Thanx, Paul

>                                         Thanks, Akira
> ----
> 
> Akira Yokosawa (6):
>   Update book.cls
>   book.cls: Fix indent after \chapter in twocolumn
>   Makefile: Add localized 'book.cls' to dependency
>   epigraph: Use \epigraphhead{}
>   epigraph: Increase width a little
>   Tweak page layout of onecolumn
> 
>  Makefile                         |  3 ++-
>  SMPdesign/SMPdesign.tex          |  4 ++--
>  advsync/advsync.tex              |  4 ++--
>  appendix/ack/ack.tex             |  4 ++--
>  appendix/questions/questions.tex |  4 ++--
>  book.cls                         | 21 +++++++++++++++------
>  count/count.tex                  |  4 ++--
>  cpu/cpu.tex                      |  4 ++--
>  datastruct/datastruct.tex        |  4 ++--
>  debugging/debugging.tex          |  4 ++--
>  defer/defer.tex                  |  4 ++--
>  easy/easy.tex                    |  4 ++--
>  formal/formal.tex                |  4 ++--
>  future/future.tex                |  4 ++--
>  glossary.tex                     |  4 ++--
>  intro/intro.tex                  |  4 ++--
>  locking/locking.tex              |  4 ++--
>  owned/owned.tex                  |  4 ++--
>  perfbook.tex                     | 17 ++++++++++++-----
>  qqz.sty                          |  2 +-
>  rt/rt.tex                        |  4 ++--
>  together/together.tex            |  4 ++--
>  toolsoftrade/toolsoftrade.tex    |  4 ++--
>  23 files changed, 68 insertions(+), 51 deletions(-)
> 
> -- 
> 1.9.1
> 

