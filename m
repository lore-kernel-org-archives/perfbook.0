Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50917 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1752036AbcGLQek (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 12
 Jul 2016 12:34:40 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6CGSomO002656
 for <perfbook@vger.kernel.org>; Tue, 12 Jul 2016 12:34:39 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 2448qm0du6-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 12 Jul 2016 12:34:39 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 12 Jul
 2016 12:34:38 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id CEB4F38C804F
 for <perfbook@vger.kernel.org>; Tue, 12 Jul 2016 12:34:35 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6CGYdOO55640306	for <perfbook@vger.kernel.org>; Tue, 12 Jul 2016 16:34:39
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6CGYZqh017525	for <perfbook@vger.kernel.org>; Tue, 12 Jul 2016 12:34:35
 -0400
Date: Tue, 12 Jul 2016 09:34:54 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Suggestion on labels of "Pre-BSD Routing Table" scaling figures
Reply-To: paulmck@linux.vnet.ibm.com
References: <6a019120-d54f-dbe3-cfa5-1565ae27e7d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a019120-d54f-dbe3-cfa5-1565ae27e7d3@gmail.com>
Message-Id: <20160712163454.GT7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jul 13, 2016 at 12:32:01AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Thanks to your addition in Chapter 9, it is getting more and more
> convincing.

Glad you like them!  A little more to go...

> However, the X-axis label in Figures 9.5, 9.9, and 9.16 is
> "Number of CPUs/Threads."
> At first glance, I read it as "Number of CPUs per Threads."
> It took a few seconds for me to realize that it means
> "Number of CPUs or Threads."
> 
> In Figure 4.10, the x-axis label is "Number of CPUs (Threads)."
> I think this is better to avoid ambiguity.
> 
> What do you think?

Sold!!!  ;-)

Made this change with your Signed-off-by.

							Thanx, Paul

