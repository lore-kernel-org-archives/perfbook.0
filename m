Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:58434 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1750742AbcE1RtI (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 28 May 2016
 13:49:08 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 28 May
 2016 13:49:07 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 645D3C9003E
 for <perfbook@vger.kernel.org>; Sat, 28 May 2016 13:48:57 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4SHn4e528442652	for <perfbook@vger.kernel.org>; Sat, 28 May 2016 17:49:04
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4SHn4Dp009636	for <perfbook@vger.kernel.org>; Sat, 28 May 2016 13:49:04
 -0400
Date: Sat, 28 May 2016 10:49:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Question] Redundant .fig and .svg files
Message-ID: <20160528174905.GH4337@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <89eb7320-04cb-af7d-1cec-38260bd7bfe0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89eb7320-04cb-af7d-1cec-38260bd7bfe0@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, May 28, 2016 at 09:14:57AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I'm doing another round of build script cleanup.
> In the cleanup, I found redundant .fig and .svg files listed below.
> 
>     SMPdesign/lockdeq.fig SMPdesign/lockdeq.svg

This one is used on line 191 of SMPdesign/partexercises.tex.

>     cartoons/patterns.fig cartoons/patterns.svg

Ah, this one's purpose is to allow .fig-style patterns to be cut and
pasted into .svg files.

> It seems the .fig files are not used any more.
> Do you mind if I remove them from the repository?

Feel free to remove SMPdesign/lockdeq.fig, but please leave the others.

That said, if you know of a way to get decent shading patterns out of
inkscape, then the two cartoons/patterns files could be dispensed with.

							Thanx, Paul

