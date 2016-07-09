Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36078 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S932844AbcGIC4N (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri,
 8 Jul 2016 22:56:13 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u692rpWv040972
 for <perfbook@vger.kernel.org>; Fri, 8 Jul 2016 22:56:12 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 2415xpgp11-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Fri,
 08 Jul 2016 22:56:11 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 8 Jul 2016
 22:56:11 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 8528838C8039
 for <perfbook@vger.kernel.org>; Fri, 8 Jul 2016 22:56:08 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u692u8Yq47841444	for <perfbook@vger.kernel.org>; Sat, 9 Jul 2016 02:56:08 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u692u8Ln023164	for <perfbook@vger.kernel.org>; Fri, 8 Jul 2016 22:56:08 -0400
Date: Fri, 8 Jul 2016 19:56:21 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Suggestion (was Re: [GIT PULL] Another round of qqz improvement)
Reply-To: paulmck@linux.vnet.ibm.com
References: <fd3e2eb5-8080-489a-60fa-72836512dd64@gmail.com>
 <20160707024557.GI4650@linux.vnet.ibm.com>
 <38f7bfb9-8532-02fc-524c-bfe0cd9115c6@gmail.com>
 <20160707185228.GL4650@linux.vnet.ibm.com>
 <6d120f0b-09f6-d90a-6969-e12f027b479f@gmail.com>
 <20160708221843.GP4650@linux.vnet.ibm.com>
 <ac131a7f-76d7-39c0-8388-75db2a035a38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac131a7f-76d7-39c0-8388-75db2a035a38@gmail.com>
Message-Id: <20160709025621.GU4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 09, 2016 at 10:44:25AM +0900, Akira Yokosawa wrote:
> On 2016/07/08 15:18:43 -0700, Paul E. McKenney wrote:
> [snip]
> >>And how soon would the release be?
> >
> >With luck, in a few days.  More likely in a few weeks.
> >
> >>I'm preparing a (hopefully) final round of cosmetic fixes.
> >>It's getting larger than I expected. I need to cleanup the commits to
> >>distinguish actual fixes of something from just cosmetic ones so that you can
> >>review them easily.  It may take another week or so.
> >
> >Well, unless the weekend's writing goes faster than normal (or, equivalently,
> >as fast as hoped), you should make the current release.  Otherwise, there
> >will be another release, hopefully much sooner than 18 months from now.
> 
> Before I forget it, I noticed a small issue I don't plan to fix in the cosmetic
> fixes.
> 
> In Section 1.1, there is no mention of Chapter 16.  You might want to add
> a sentence there.

Good catch!  I forgot to add the new real-time chapter.  Fixed with your
Reported-by.

							Thanx, Paul

