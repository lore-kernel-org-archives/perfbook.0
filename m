Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e19.ny.us.ibm.com ([129.33.205.209]:34162 "EHLO
 e19.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752205AbcDQDg2 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 16 Apr 2016
 23:36:28 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 16 Apr
 2016 23:36:26 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id C6C2338C8039
 for <perfbook@vger.kernel.org>; Sat, 16 Apr 2016 23:36:24 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3H3aOqb31064190	for <perfbook@vger.kernel.org>; Sun, 17 Apr 2016 03:36:24
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3H3aODj026560	for <perfbook@vger.kernel.org>; Sat, 16 Apr 2016 23:36:24
 -0400
Date: Sat, 16 Apr 2016 20:36:52 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] advsync: Typo fix and vertical spacing tweaks
Message-ID: <20160417033652.GJ3687@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <5711F2CF.1030907@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5711F2CF.1030907@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 16, 2016 at 05:07:43PM +0900, Akira Yokosawa wrote:
> >From e9f9f2126a24841bb19970292716819f0300872b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Sat, 16 Apr 2016 16:48:19 +0900
> Subject: [PATCH 0/3] advsync: Typo fix and vertical spacing tweaks
> 
> As I mentioned earlier, I tweaked vertical spacings in the
> `Guarantees` subsection. This series also fixes a typo I made
> in the previous patch. It also adds necessary blank lines in the
> latex source of the `What Can You Trust?` subsection.
> 
> Akira Yokosawa (3):
>   advsync: Fix a trivial typo
>   advsync: Add necessary blank lines around minipages
>   advsync: Tweak vertical spacing around code snippets
> 
>  advsync/memorybarriers.tex | 44 ++++++++++++++------------------------------
>  1 file changed, 14 insertions(+), 30 deletions(-)

Nice!

Queued and pushed.

							Thanx, Paul

