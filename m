Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41025 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751972AbcGSPRQ (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 19
 Jul 2016 11:17:16 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6JF9CeQ070665
 for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 11:17:16 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 2496gqq4rr-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 19 Jul 2016 11:17:15 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 19 Jul
 2016 11:17:14 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id B58B038C8041
 for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 11:17:11 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6JFHBSx65339520	for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 15:17:11
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6JFHBCr000982	for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 11:17:11
 -0400
Date: Tue, 19 Jul 2016 08:17:35 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] formal: Trivial typo fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <ee5270b0-78c0-ae91-6a93-336968af2589@gmail.com>
 <6e78783e-7f09-931d-5981-ad11af4bd7b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e78783e-7f09-931d-5981-ad11af4bd7b5@gmail.com>
Message-Id: <20160719151735.GW7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jul 20, 2016 at 12:08:29AM +0900, Akira Yokosawa wrote:
> On 2016/07/19 23:42 +0900, Akira Yokosawa wrote:
> 
> Hi Paul,
> 
> These are typos I noticed while reading recently updated part in "formal/formal.tex".
> 
> >  	Furthermore, although the L4 microkernel is a large software
> >  	artifact from the viewpoint of formal verification, it is tiny
> > -	compared to the a great number of projects, including LLVM,
> > +	compared to a great number of projects, including LLVM,
> 
> Here, "the" and "a" are redundant. I removed "the", because I have no idea
> how many projects are there in this context.
> 
> >  	gcc, the Linux kernel, Hadoop, MongoDB, and a great many others.
> >  
> >  	Although formal verification is finally starting to show some
> > @@ -171,4 +171,4 @@ All else being equal, a simpler implementation is much better than
> >  a mechanical proof for a complex implementation!
> >  
> >  And the open challenge to those working on formal verification techniques
> > -and systems is prove this summary wrong!
> > +and systems is to prove this summary wrong!
> > 
> 
> This seems a trivial one.

Agreed on both, pulled and pushed.  And thank you for your careful
review and the fixes!

							Thanx, Paul

