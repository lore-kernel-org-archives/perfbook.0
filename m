Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:52370 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752337AbcD1QbH (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 28 Apr 2016
 12:31:07 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 28 Apr
 2016 10:31:06 -0600
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 2F72C3E40041	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 10:31:03 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3SGV2lM37093478	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 16:31:02
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3SGV2u5007506	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 12:31:02
 -0400
Date: Thu, 28 Apr 2016 09:31:40 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] whymb: Remove redundant words
Message-ID: <20160428163140.GK4609@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <f053f42a-478a-8c35-780a-a51094b03030@gmail.com>
 <20160428140731.GE4609@linux.vnet.ibm.com>
 <ed2f9c6a-eb0e-bd1e-d104-7425900bbf73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed2f9c6a-eb0e-bd1e-d104-7425900bbf73@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 29, 2016 at 12:46:45AM +0900, Akira Yokosawa wrote:
> On 2016/04/28 23:07, Paul E. McKenney wrote:
> > On Thu, Apr 28, 2016 at 08:18:15PM +0900, Akira Yokosawa wrote:
> >> >From 53364b467603cd5ec9e1f6a12ad9377a76ebb72a Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiysw@gmail.com>
> >> Date: Thu, 28 Apr 2016 20:08:32 +0900
> >> Subject: [PATCH] whymb: Remove redundant words
> >>
> >> The sentence fixed in commit 3d3ce3673746 ("Fix now-obsolete back
> >> reference to Compaq Wizard web page") has redundant words around
> >> the citation. This commit removes them.
> >>
> >> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> > 
> > Good catch, queued!
> > 
> > And no, that change wasn't one of my better efforts, was it?
> > 
> > 							Thanx, Paul
> 
> Perhaps, you shouldn't apply your own patch on your own.
> But, who else can manage the perfbook repository.
> 
> Or, in cases such as this one, you could ask an ack from the person
> in reported-by. Just a suggestion.

So the following approaches seem reasonable:

1.	Get an ack, as you say.  I would need to put the patch on a
	separate branch in the meantime, but that is eminently doable.

2.	Let the person reporting the issue produce the patch.

3.	Wait until I am not massively distracted to produce the patch.

These all have drawbacks.  Almost like we are living in the real world!

This particular case actually worked well -- you inspected my commit,
found the problem, and submitted the patch.  All is well that ends well!

							Thanx, Paul

