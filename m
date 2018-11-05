Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58216 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725878AbeKFFMU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 6 Nov 2018 00:12:20 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA5JnUbl056051
        for <perfbook@vger.kernel.org>; Mon, 5 Nov 2018 14:51:03 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nju8d30y0-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 05 Nov 2018 14:51:03 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 5 Nov 2018 19:51:02 -0000
Date: Mon, 5 Nov 2018 11:50:59 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/2] Updates to Chapter memorder
Reply-To: paulmck@linux.ibm.com
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
 <3efe6951-cade-b721-96e3-7d41e1c39734@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3efe6951-cade-b721-96e3-7d41e1c39734@gmail.com>
Message-Id: <20181105195059.GB4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Sun, Nov 04, 2018 at 09:04:28PM +0900, Akira Yokosawa wrote:
> On 2018/11/04 19:18:37 +0800, Junchang Wang wrote:
> > Hi Paul and Akira,
> > 
> > I have read through the first half of Chapter memorder, and here is correction
> > for a few typos. Please take a look.
> > 
> > For the first patch, the last clause I modified still looks confusion to me.
> > Currently the clause is "though only if both \co{r1} and \co{r3} both end up
> > containing the address of \co{x}"; however, my understanding is that prior load
> > or store would also be ordered before the store on line 16, __only if r1 ends up
> > containing the address of x__. That is, it is not necessary to involve r2/r3. Is
> > my understanding correct? Or did I miss anything about this in the book?
> 
> Going back to commit 43236beadb19 ("memorder: Expand on cumulativity and
> {other,} multicopy atomicity"), this paragraph discussed Listing 14.17
> at the time (WWC Litmus Test With Release), which is a different litmus
> test than the current Listing 15.17 (WRC Litmus Test With Release).
> Still line 32 of then Listing 14.17 was an "exists" clause.
> No wonder you can't figure out what is discussed there.
> 
> Paul, can you look into this?

Indeed, this was quite the mess!  Hopefully now fixed.  ;-)

								Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 
> > Thanks,
> > --Junchang
> > 
> > Junchang Wang (2):
> >   memorder: fix typo
> >   memorybarriercum.svg: fix typo
> > 
> >  memorder/memorder.tex         | 8 ++++----
> >  memorder/memorybarriercum.svg | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> 

