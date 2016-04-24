Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:54733 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752036AbcDXWrm (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 24 Apr 2016
 18:47:42 -0400
Received: from localhost	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 24 Apr
 2016 16:47:37 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 C246F1FF0021	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 16:47:19 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3OMlXhg38863008	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 22:47:33
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3OMlX9a008544	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 18:47:33
 -0400
Date: Sun, 24 Apr 2016 15:48:08 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
Message-ID: <20160424224808.GX3756@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
 <571C42A1.8060201@gmail.com> <571C6CBB.4080101@gmail.com>
 <571CD6E7.4060301@gmail.com> <20160424175701.GU3756@linux.vnet.ibm.com>
 <571D4684.2030007@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571D4684.2030007@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 25, 2016 at 07:19:48AM +0900, Akira Yokosawa wrote:
> On 2016/04/24 10:57:01 -0700, Paul E. McKenney wrote:
> > On Sun, Apr 24, 2016 at 11:23:35PM +0900, Akira Yokosawa wrote:
> 
> [snip]
> 
> >> There was no change in the behavior.
> > 
> > Ah, that would explain the lack of complaints.  Most people reading
> > the book on a mobile device use perfbook-1c.pdf, so the chapter
> > links would work nicely for them.
> 
> Then, wouldn't it be nicer if we change the default target in Makefile
> to perfbook-1c.pdf ?
> 
> Or how about just adding a shorter name target such as "1c" that would
> build perfbook-1c.pdf ?
> 
> Of course, we should be careful enough not to annoy people by a
> sudden change of behavior.

I prefer the double-column layout because it takes less paper to print.

But having "make 1c" create the single-column layout would be fine.

							Thanx, Paul

> >> I'm very glad I can contribute the perfbook project in this manner.
> >>
> >> So far, patches I submitted were mostly cosmetic changes.
> >> I'm planning to submit something that touches the actual contents, too.
> >> But don't expect too much.
> > 
> > Cosmetic it might be, but I believe that readers will appreciate it
> > very much!  Thank you again!
> > 
> > 							Thanx, Paul
> > 
> > 
> 

