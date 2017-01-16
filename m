Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53019 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750970AbdAPWlx (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 16
 Jan 2017 17:41:53 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0GMdL6B117786
 for <perfbook@vger.kernel.org>; Mon, 16 Jan 2017 17:41:52 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2811e1mfxf-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 16 Jan 2017 17:41:51 -0500
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 16 Jan
 2017 15:41:51 -0700
Date: Mon, 16 Jan 2017 14:41:46 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/8] Hyphenation updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Message-Id: <20170116224146.GQ5238@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 16, 2017 at 11:55:18PM +0900, Akira Yokosawa wrote:
> >From 4e1157502e94beeef363808e627acd2882e0aac0 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 16 Jan 2017 23:33:49 +0900
> Subject: [PATCH 0/8] Hyphenation updates
> 
> Hi Paul,
> 
> This is a set of fixes and improvements mostly of hyphenation.
> Highlight would be patches 3--5, which import hyphenation exceptions
> for US English and add some exception for perfbook.
> Patch 7 comments out an exception of "process", which prevents hyphenation
> of "pro-cess". I think this hyphenation is acceptable, but you may have
> other ideas.

I am agnostic on that point.  ;-)

I do see that https://www.ctan.org/tex-archive/info/digests/tugboat/hyphenex
lists public domain and all-permissive as potential licenses, and public
domain is compatible with CC.

Queued, thank you!

							Thanx, Paul

>                                      Thanks, Akira
> --
> Akira Yokosawa (8):
>   count: Use \log in math mode
>   SMPdesign: Add shortcut of extdash to compound words
>   Import exceptions for US English hyphenation from 'hyphenex' package
>   Add hyphenation exceptions file for perfbook
>   perfbook.tex: Include ushyphex.tex and pfhyphex.tex
>   Revert "count: Enclose 'REQACK' in \mbox{}"
>   Comment out 'process' in hyphenation exceptions
>   SMPdesign: Add another shortcut of extdash
> 
>  SMPdesign/SMPdesign.tex     |    2 +-
>  SMPdesign/partexercises.tex |    2 +-
>  count/count.tex             |    6 +-
>  perfbook.tex                |    3 +
>  pfhyphex.tex                |    4 +
>  ushyphex.tex                | 1454 +++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 1466 insertions(+), 5 deletions(-)
>  create mode 100644 pfhyphex.tex
>  create mode 100644 ushyphex.tex
> 
> -- 
> 2.7.4
> 

