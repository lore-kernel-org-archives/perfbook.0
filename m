Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13902 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751255AbcFWUEa (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Thu, 23 Jun 2016 16:04:30 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5NK3pBl043810
 for <perfbook@vger.kernel.org>; Thu, 23 Jun 2016 16:04:29 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23rj7h9usr-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Thu,
 23 Jun 2016 16:04:29 -0400
Received: from localhost	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 23 Jun
 2016 14:04:28 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 62E6C1FF0051	for <perfbook@vger.kernel.org>; Thu, 23 Jun 2016 14:04:10 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5NK4S8c57016538	for <perfbook@vger.kernel.org>; Thu, 23 Jun 2016 20:04:28
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5NK4QDU008503	for <perfbook@vger.kernel.org>; Thu, 23 Jun 2016 16:04:26
 -0400
Date: Thu, 23 Jun 2016 13:04:26 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Further tweak position of 'Just Count!' figure
Reply-To: paulmck@linux.vnet.ibm.com
References: <8469e8ad-a958-6543-6a2e-92baa0d5996c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8469e8ad-a958-6543-6a2e-92baa0d5996c@gmail.com>
Message-Id: <20160623200426.GS1473@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 22, 2016 at 07:37:07AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> I have tested the 'footmisc' package and it works!
> Although there are reports of conflict between 'footnote' and 'hyperref'
> packages, I have not seen any trouble.
> Furthermore, I came across 'footnotebackref' package which enables
> cross-link of a footnote at the bottom and the corresponding footnote mark
> in the text. I added it in the last commit of this pull request.
> Note that in older TeX distribution, you may need to install it manually.
> 
>                                                    Thanks, Akira
> ---
> The following changes since commit 15ddcdd3ae6bdc088f7c49f78edf62fff5090cfd:
> 
>   Further tweak position of "Just Count!" figure (2016-06-20 10:30:49 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git footnote-position
> 
> for you to fetch changes up to a3611df3582024130563ccb5167e39ca330aa804:
> 
>   Add 'footnotebackref' package (2016-06-22 06:56:26 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (5):
>       Revert "Further tweak position of "Just Count!" figure"
>       Revert "count: Tweak position of Figure 5.1"
>       Add 'footmisc' package for better placement of footnote
>       Add comments on the purpose of additional packages
>       Add 'footnotebackref' package
> 
>  count/count.tex | 44 ++++++++++++++++++++++----------------------
>  perfbook.tex    |  4 +++-
>  2 files changed, 25 insertions(+), 23 deletions(-)

Applied and pushed, thank you!

I have a fairly old LaTeX setup, and it works for me.  If it turns out
that people have trouble with it, we can revert that last commit.

							Thanx, Paul

