Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19606 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751934AbcGMPuo (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Wed, 13 Jul 2016 11:50:44 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6DFnPgx007347
 for <perfbook@vger.kernel.org>; Wed, 13 Jul 2016 11:50:33 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24567cayt1-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Wed,
 13 Jul 2016 11:50:32 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 13 Jul
 2016 11:50:32 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 1E00438C8039
 for <perfbook@vger.kernel.org>; Wed, 13 Jul 2016 11:50:30 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6DFoUhR55443468	for <perfbook@vger.kernel.org>; Wed, 13 Jul 2016 15:50:30
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6DFoTb2015940	for <perfbook@vger.kernel.org>; Wed, 13 Jul 2016 11:50:29
 -0400
Date: Wed, 13 Jul 2016 08:50:49 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Suggestion on labels of "Pre-BSD Routing Table" scaling figures
Reply-To: paulmck@linux.vnet.ibm.com
References: <6a019120-d54f-dbe3-cfa5-1565ae27e7d3@gmail.com>
 <20160712163454.GT7094@linux.vnet.ibm.com>
 <e8df404f-88db-113b-6c72-725bd2d5d2b6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8df404f-88db-113b-6c72-725bd2d5d2b6@gmail.com>
Message-Id: <20160713155049.GH7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jul 13, 2016 at 11:37:35PM +0900, Akira Yokosawa wrote:
> On 2016/07/13 1:34, Paul E. McKenney wrote:
> >On Wed, Jul 13, 2016 at 12:32:01AM +0900, Akira Yokosawa wrote:
> >>Hi Paul,
> >>
> >>Thanks to your addition in Chapter 9, it is getting more and more
> >>convincing.
> >
> >Glad you like them!  A little more to go...
> >
> >>However, the X-axis label in Figures 9.5, 9.9, and 9.16 is
> >>"Number of CPUs/Threads."
> >>At first glance, I read it as "Number of CPUs per Threads."
> >>It took a few seconds for me to realize that it means
> >>"Number of CPUs or Threads."
> >>
> >>In Figure 4.10, the x-axis label is "Number of CPUs (Threads)."
> >>I think this is better to avoid ambiguity.
> >>
> >>What do you think?
> >
> >Sold!!!  ;-)
> >
> >Made this change with your Signed-off-by.

Make that Reported-by...

> Hi,
> 
> So, I searched "CPUs/Threads" in the pdf and 10 other labels hit.
> See the list below. (Sorry, but with page numbers of 2 column pdf.)
> 
> * p.38 Figure 5.3
> * p.77 Figure 6.22
> * p.78 Figure 6.23 and in the text just below
> * p.166 Figures 10.7, 10.8, and 10.9
> * p.168 Figures 10.13 and 10.14
> * p.169 Figure 10.15
> * p.177 Figure 10.29
> 
> These figures existed before your recent rewrite of Chapter 9,
> and I never found them ambiguous. So I might have been on a
> different planet last night or something...
> If you think it is still better to modify them, please consider
> doing so.

Might as well...  Done!

> There is another "CPUs/Threads" in p.437 at the definition of
> "Linearizable," but it is not at all ambiguous in the context.

Fixed that one as well.

And added glossary.tex to the Makefile dependency list.  ;-)

							Thanx, Paul

