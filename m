Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52108 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750959AbdKVGLT (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 22
 Nov 2017 01:11:19 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAM6Are0072230
 for <perfbook@vger.kernel.org>; Wed, 22 Nov 2017 01:11:18 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ecyf09kuq-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 22 Nov 2017 01:11:18 -0500
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 22 Nov
 2017 01:11:16 -0500
Date: Tue, 21 Nov 2017 22:11:13 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Add Makefile in CodeSamples/formal/herd
Reply-To: paulmck@linux.vnet.ibm.com
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
 <20171122001231.GP3624@linux.vnet.ibm.com>
 <3840ADCE-66F6-417D-B3B6-22BBE87E85E4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3840ADCE-66F6-417D-B3B6-22BBE87E85E4@gmail.com>
Message-Id: <20171122061113.GT3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Nov 22, 2017 at 10:02:16AM +0900, Akira Yokosawa wrote:
> 
> 
> 
> 2017/11/22 9:12 +0900、Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> 
> > On Wed, Nov 22, 2017 at 12:34:08AM +0900, Akira Yokosawa wrote:
> >>> From 180abe9a72d4e3fbe200ce2a032a6c616a70ce03 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Wed, 22 Nov 2017 00:04:40 +0900
> >> Subject: [PATCH 0/2] Add Makefile in CodeSamples/formal/herd
> >> 
> >> (Resending with To: Paul)
> >> Hi Paul,
> >> 
> >> This is my attempt to add Makefile in CodeSamples/formal/herd.
> >> The recipes here assumes that the memory-model's repository resides
> >> beside the perfbook's repository on your machine.
> >> 
> >> The targets include conversion of litmus7 compatible tests under
> >> litmus/ directory to herd7/klitmus7 compatible ones,
> >> running converted litmus tests by herd7,
> >> running herd7 benchmark tests by herd7,
> >> and preparing directory for klitmus7 cross-compile of converted
> >> tests.
> >> 
> >> Currently, there is no test other than benchmarks under herd/
> >> directory which is not compatible with litmus7. When such tests
> >> are added there, the Makefile can be updated to run and cross-compile
> >> them along with the converted tests.
> >> 
> >> Patch #1 adds the Makefile and a helper script.
> >> 
> >> Patch #2 is a fix of compiler warnings revealed in klitmus7 cross-
> >> compiling.
> >> These C-WWC-o+o-* litmus tests were modified by me in this August.
> >> That looked sufficient for litmus7, but definitions in kernel header
> >> files used in klitmus7 aren't satisfied. The change here is the result
> >> of some try-and-errors. There can be smarter way to describe these tests.
> >> They are not used in the text at the moment, so their fix is not
> >> urgent, I suppose.
> > 
> > I queued these, but let's talk about the memory model.  Currently,
> > it is available in this git archive:
> > 
> >    https://github.com/aparri/memory-model.git
> > 
> > Specifically, these files:
> > 
> >    linux-kernel.bell
> >    linux-kernel.cat
> >    linux-kernel.cfg
> >    linux-kernel.def
> >    linux-kernel-hardware.cat
> >    lock.cat
> > 
> > We hope to get these upstream into the Linux kernel during the next
> > merge window.  So maybe the right thing to do is to require that the
> > user copy the files into the formal/herd directory, and have Makefile
> > give instructions and stop if they are not present.
> > 
> > Thoughts?
> 
> I’m kind of against having those untracked files there.
> The directory where they reside can be specified by
> overriding LKMM_DIR variable in the Makefile by an option to make command.
> So change of the location of memory model won’t be a problem.
> 
> But yes, the check of the existence of the directory can help users. I’ll see what l can do.
> 
> Thoughts?

As long as the directory can be a symbolic link to the actual directory,
that should work fine.

							Thanx, Paul

> Akira 
> (from mobile, might be QP encoded)
> 
> > 
> >                            Thanx, Paul
> > 
> >>        Thanks, Akira
> >> --
> >> Akira Yokosawa (2):
> >>  CodeSamples/formal/herd: Add Makefile and utility script
> >>  CodeSamples/formal/litmus: Fix type of 2:r2 in C-WWC+o+o-*.litmus test
> >> 
> >> CodeSamples/formal/herd/.gitignore                 |  4 ++
> >> CodeSamples/formal/herd/Makefile                   | 60 ++++++++++++++++++++++
> >> CodeSamples/formal/herd/litmus2herd.sh             | 20 ++++++++
> >> .../formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus |  9 ++--
> >> .../formal/litmus/C-WWC+o+o-r+o-addr-o.litmus      |  9 ++--
> >> 5 files changed, 92 insertions(+), 10 deletions(-)
> >> create mode 100644 CodeSamples/formal/herd/.gitignore
> >> create mode 100644 CodeSamples/formal/herd/Makefile
> >> create mode 100644 CodeSamples/formal/herd/litmus2herd.sh
> >> 
> >> -- 
> >> 2.7.4
> >> 
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >> 
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

