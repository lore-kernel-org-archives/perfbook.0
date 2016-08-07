Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31566 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751712AbcHGSSp (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 7
 Aug 2016 14:18:45 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u77IE4MQ037128
 for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 14:18:44 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 24nb6w6jqe-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 07 Aug 2016 14:18:44 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 7 Aug 2016
 12:18:43 -0600
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 448621FF0043	for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 12:18:21 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u77IIcYk61407472	for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 18:18:38 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u77IIcKs015326	for <perfbook@vger.kernel.org>; Sun, 7 Aug 2016 14:18:38 -0400
Date: Sun, 7 Aug 2016 11:18:39 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] SMPdesign: Use subscript in lockdeqhash figures
Reply-To: paulmck@linux.vnet.ibm.com
References: <fb2c9c38-c715-e176-a576-5dd4391832d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb2c9c38-c715-e176-a576-5dd4391832d5@gmail.com>
Message-Id: <20160807181839.GE3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 06, 2016 at 07:07:29PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is somewhat related to the "using hyphens for minus signs" issue.
> In Figures 6.8 and 6.9, entry names such as "L-2" are used.
> The "-" here means minus, but it is *not* obvious at first glance if
> it means "L minus 2" or not.
> 
> If we make "-2" a subscript, it would be much easier to see that
> it means "L whose sequence number is 'minus 2'".
> So, I tweaked the xfig sources of the figures to make those numbers
> in entries look like subscripts. I also altered the numbers in entry names
> mentioned in the corresponding text as subscripts (using math mode).
> 
> I'm sending this as a pull request as the resulting patch became fairly
> large due to eps files.
> 
> I hope you like there tweaks.
> 
> Additional patch is a fix of entry numbers of Figure 6.9, which is
> actually 16 if my understanding of the figure is correct.

I pulled both, thank you.

Any thoughts on converting .fig files to .svg?  My approach has been to
import .fig files into inkscape as I need to modify them.  The results
are OK, but not perfect (for example, arrows in .fig become two objects
in .svg, the line and the arrowhead).

						Thanx, Paul

>                                              Thanks, Akira 
> 
> ---------
> The following changes since commit ec15e80376f04f5b2be8779aedfda3ba184a4e37:
> 
>   Fix URL for MathieuDesnoyers2009LFCollabSummit (2016-08-05 13:12:07 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git lockdeqhash-use-subscript
> 
> for you to fetch changes up to 7893124def444db34fbb6bc2b4e9b2f20675c2eb:
> 
>   SMPdesign: Fix number of elements regarding Figure 6.9 (2016-08-06 18:14:07 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (2):
>       SMPdesign: Use subscript in lockdeqhash figures
>       SMPdesign: Fix number of elements regarding Figure 6.9
> 
>  SMPdesign/lockdeqhash1R.eps   | 330 +++++++++++++++++++++++++++++++++++-------
>  SMPdesign/lockdeqhash1R.fig   |  39 +++--
>  SMPdesign/lockdeqhashlots.eps | 323 +++++++++++++++++++++++++++++++++++------
>  SMPdesign/lockdeqhashlots.fig |  48 ++++--
>  SMPdesign/partexercises.tex   |  14 +-
>  5 files changed, 622 insertions(+), 132 deletions(-)
> 

