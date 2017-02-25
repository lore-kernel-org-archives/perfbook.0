Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50125 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751501AbdBYFiR (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 25 Feb 2017 00:38:17 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1P5WVFM001572
 for <perfbook@vger.kernel.org>; Sat, 25 Feb 2017 00:37:03 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28u3rpg7xr-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 25 Feb 2017 00:37:03 -0500
Received: from localhost by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 24 Feb
 2017 22:37:02 -0700
Date: Fri, 24 Feb 2017 21:36:47 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] bib/syncrefs: Use consistent date format
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170222152806.2313-1-sj38.park@gmail.com>
 <984d694b-b448-e7e6-b67a-33668de5a5ba@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <984d694b-b448-e7e6-b67a-33668de5a5ba@gmail.com>
Message-Id: <20170225053647.GT30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

On Thu, Feb 23, 2017 at 09:49:50PM +0900, Akira Yokosawa wrote:
> On 2017/02/23 00:28:06 +0900 SeongJae Park wrote:
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  bib/syncrefs.bib | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Thanks!
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>

Applied,  thank you both!

								Thanx, Paul

> > diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
> > index c702ac577774..f3495e1bc5d1 100644
> > --- a/bib/syncrefs.bib
> > +++ b/bib/syncrefs.bib
> > @@ -1275,7 +1275,7 @@ Simple Locks in a Multiprocessor System"
> >  ,number="6,842,809"
> >  ,month="January"
> >  ,url="https://www.google.com/patents/US6842809"
> > -,lastchecked="December 07, 2016"
> > +,lastchecked="December 7, 2016"
> >  }
> >  
> >  @inproceedings{YossiLev2009SNZIrwlock
> > 
> 

