Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39978 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751773AbcF0DHI (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 26
 Jun 2016 23:07:08 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5R33vFT024186
 for <perfbook@vger.kernel.org>; Sun, 26 Jun 2016 23:07:07 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 23sjufqna6-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 26 Jun 2016 23:07:07 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 26 Jun
 2016 23:07:06 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 6C819C90041
 for <perfbook@vger.kernel.org>; Sun, 26 Jun 2016 23:06:54 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5R3756s10879356	for <perfbook@vger.kernel.org>; Mon, 27 Jun 2016 03:07:05
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5R373Xr009067	for <perfbook@vger.kernel.org>; Sun, 26 Jun 2016 23:07:03
 -0400
Date: Sun, 26 Jun 2016 20:07:02 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Preamble and qqz fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <69dfc090-de59-583a-73a9-885a204ee394@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69dfc090-de59-583a-73a9-885a204ee394@gmail.com>
Message-Id: <20160627030702.GB4309@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 25, 2016 at 08:53:21PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here is another pull request.
> This time, I did some functional fixes in preamble and qqz.sty.
> 
> 1st patch fixes typos in the definition of \co{} macro.
> Yea, at first glance, they are hard to catch, but...
> Now, line-breaks at white spaces are enabled and the increased room
> for line-breaks results in better looking typesetting.
> 
> Fixes in qqz.sty are not actually fixes but improvements.
> 2nd patch adds macro definitions for referencing qqz's, which has been
> done manually in count/count.tex. It also adds hyperref to the qqz at
> a referencing text.
> 
> 3rd patch improves accuracy of hyperref to QQA's by tweaking the
> position of \refstepcounter macro.  Now, a click on a "Quick Quiz" in
> the text will bring you exactly where you'd expect.
> 
>                                                Thanks, Akira

I pulled this in, and the QQ links are -much- better, thank you!  As are
the \co{} line breaks.

Making up names for all the quick quizzes will be interesting, though.  ;-)

							Thanx, Paul

> ---
> The following changes since commit a3611df3582024130563ccb5167e39ca330aa804:
> 
>   Add 'footnotebackref' package (2016-06-22 06:56:26 +0900)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git preamble-qqz-fixes
> 
> for you to fetch changes up to 5490f317396516659927dd615cb4ca5affb3cf39:
> 
>   qqz: Improve accuracy of hyperref to QQA (2016-06-25 18:04:56 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (3):
>       Fix typo in the definition of \co macro
>       qqz: Add macro's for referencing quick quizzes
>       qqz: Improve accuracy of hyperref to QQA
> 
>  count/count.tex | 16 ++++++++--------
>  perfbook.tex    |  5 +++--
>  qqz.sty         | 22 +++++++++++++++-------
>  3 files changed, 26 insertions(+), 17 deletions(-)
> 

