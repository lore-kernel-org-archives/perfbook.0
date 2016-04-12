Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:49027 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S965075AbcDLWgV (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 12 Apr 2016
 18:36:21 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 12 Apr
 2016 16:36:20 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 3BE5D3E4003E	for <perfbook@vger.kernel.org>; Tue, 12 Apr 2016 16:36:17 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3CMaGgT35848332	for <perfbook@vger.kernel.org>; Tue, 12 Apr 2016 22:36:16
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3CMaG4t004255	for <perfbook@vger.kernel.org>; Tue, 12 Apr 2016 18:36:16
 -0400
Date: Tue, 12 Apr 2016 15:36:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Another fix to use latex reference feature
 consistently
Message-ID: <20160412223641.GW3568@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <57087D07.6030207@gmail.com>
 <alpine.DEB.2.10.1604091434270.32362@hxeon>
 <20160412160027.GH3568@linux.vnet.ibm.com> <570D738E.4000905@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <570D738E.4000905@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

On Wed, Apr 13, 2016 at 07:15:42AM +0900, Akira Yokosawa wrote:
> Hi, Paul,
> 
> On 2016/04/13 1:00, Paul E. McKenney wrote:
> > Akira, in the future, please do use "git format-patch" and also please
> > use the Linux-kernel preferred format for referencing commits, as shown
> > in the updated commit below.  The idea is to use the first 12 digits of
> > the SHA-1 commit ID, followed by the subject line in both quotes and
> > parentheses.
> 
> I see. I'll do so in the future.
> In fact, I *did* use "git format-patch", but copy & pasted part of the
> output. I also edited the commit message just before sending it out.
> I won't do that.
> 
> BTW, are you interested in a cosmetic patch which would make Section
> 14.2.9 "Guarantees" looks much denser by reducing vertical spaces above
> and below code examples?
> 
> If it's worth doing, I'll try tuning them this weekend.

Please do!

							Thanx, Paul

