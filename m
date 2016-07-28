Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35930 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751438AbcG1WVu (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Thu, 28 Jul 2016 18:21:50 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6SMEABP052197
 for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 18:21:49 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24fdm1kxs2-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Thu,
 28 Jul 2016 18:21:49 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 28 Jul
 2016 18:21:48 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 6B183C9003E
 for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 18:21:36 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6SMLkIN58654750	for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 22:21:46
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6SMLkrA006712	for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 18:21:46
 -0400
Date: Thu, 28 Jul 2016 15:21:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Some more feedback on Chapter 9
Reply-To: paulmck@linux.vnet.ibm.com
References: <a6181fde-e96e-294c-d0df-e996c27b401f@gmail.com>
 <20160728174057.GS3873@linux.vnet.ibm.com>
 <78fd52ad-b974-2b13-d963-84adc86615c1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78fd52ad-b974-2b13-d963-84adc86615c1@gmail.com>
Message-Id: <20160728222147.GO3873@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 29, 2016 at 06:59:24AM +0900, Akira Yokosawa wrote:
> On 2016/07/29 2:40, Paul E. McKenney wrote:
> > On Thu, Jul 28, 2016 at 10:06:22PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> There are still several issues regarding Chapter 9 I want to feedback.
> >> I'm afraid most of them are beyond my ability to submit as patches.
> >>
> >> * At the beginning of Section 9.5.2, there is a credit of the form
> >>   "Authors: ...".
> >>   But there is \OriginallyPublished{} command just above the credit.
> >>   I'm wondering if the credit in the text is necessary.
> >>   There is a similar credit at the beginning of Section 14.2, but there is
> >>   no \OriginallyPublished{} command there. This section seems to have been
> >>   written for perfbook. If this is the case, for a consistent look, it would
> >>   be better if the credit is moved to Appendix F.1.
> > 
> > Good point!  I am guessing that these predated \OriginallyPublished{}, and
> > that I didn't get around to fixing them properly.  I have now fixed them.
> 
> And I'm wondering why I didn't realize the origin of Section 14.2 is
> Documentation/memory-barriers.txt...
> But they look fairly different now, don't they?

They do!  The book has not kept up with memory-barriers.txt.

Again, once we formally define the Linux-kernel memory model, I will
rewrite the memory-barriers material, probably folding Section 14.2
and Appendix C together.

							Thanx, Paul

