Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48656 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750815AbdFQEct (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 17 Jun 2017 00:32:49 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5H4SqtY021631
 for <perfbook@vger.kernel.org>; Sat, 17 Jun 2017 00:32:48 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2b4pfbbhb6-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 17 Jun 2017 00:32:48 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 17 Jun
 2017 00:32:47 -0400
Date: Fri, 16 Jun 2017 21:32:44 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/8] future/QC: Cosmetic fixes and improvements
Reply-To: paulmck@linux.vnet.ibm.com
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Message-Id: <20170617043244.GH3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 17, 2017 at 12:54:47PM +0900, Akira Yokosawa wrote:
> >From e5738e83414b3c3d30d616543bb2f70cbb80bcca Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 17 Jun 2017 10:44:54 +0900
> Subject: [PATCH 0/8] future/QC: Cosmetic fixes and improvements
> 
> Hi Paul,
> 
> This patch set mostly fixes and improves LaTeX source of QC section.
> 
> Patch 1 adds patterns in hyphen2endash.sh.
> 
> Patch 2 gives consistent looks to tables as in other tables in
> perfbook.
> 
> Patch 3 fixes typos in SI unit symbols and usage of math mode.
> 
> Patch 4 Adds whitespaces between numerical values and unit symbols.
> This is recommended in NIST style guide (referred to in the change
> log). Since this section treats topics covering quantum mechanics,
> I want it to have a similar look as a scientific paper.
> In other parts of perfbbok, I have quite a few places I want to add
> whitespaces, but I'm not sure that matches your preference.
> If you'd like such changes, I can produce patches to do so.
> 
> Patch 5 uses axis names "X-axis", "Y-axis", and "Z-axis" in the
> lists of "Programming Model" section. I also tried other forms of
> "x-axis", "x axis", and "X axis", but "X-axis" is my preference.
> 
> Patch 6 seems a trivial grammatical fix, but might be unnecessary.
> I'm not sure.
> 
> Patch 7 gives representation of ket commonly used in quantum mechanics
> papers.
> 
> Patch 8 changes the look of QC operators. Special treatment of
> dagger symbol in description labels might be excessive, but
> it gives better result in my point of view.
> 
> So, I'm not sure you like patches 4--8. Please try and push as
> much as you like. And feel free to ask me a respin of the patches
> you don't like as is.

The all look good, so I queued and pushed them, thank you!  I also
queued a change to fix my failure to define "qubit" at first use.

It would be good to have a consistent and professional look, so please
do feel free to make similar fixes elsewhere.

I am going to have to make myself some sort of cheat sheet to get
all this right, though!  ;-)

							Thanx, Paul

>             Thanks, Akira
> --
> Akira Yokosawa (8):
>   hyphen2endash: Add patterns for QC section
>   future/QC: Tweak appearance of tables
>   future/QC: Fix typo in unit symbol and usage of math mode
>   future/QC: Add narrow space before unit symbol
>   future/QC: Use consistent axis names
>   future/QC: Add missing 'has' in description list
>   future/QC: Use \ket{} macro for |0> and |1>
>   future/QC: Denote QC operators as such
> 
>  future/QC.tex              | 123 +++++++++++++++++++++++----------------------
>  perfbook.tex               |   5 ++
>  utilities/hyphen2endash.sh |   8 +++
>  3 files changed, 76 insertions(+), 60 deletions(-)
> 
> -- 
> 2.7.4
> 

