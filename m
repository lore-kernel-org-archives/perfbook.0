Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59577 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1754169AbdAEFT1 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 5 Jan 2017 00:19:27 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id v055DsrV103570
 for <perfbook@vger.kernel.org>; Thu, 5 Jan 2017 00:18:38 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 27sfr0rbc0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 05 Jan 2017 00:18:37 -0500
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 4 Jan 2017
 22:18:37 -0700
Date: Wed, 4 Jan 2017 21:18:35 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Promote target 'mss' to default
Reply-To: paulmck@linux.vnet.ibm.com
References: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
Message-Id: <20170105051835.GA3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 05, 2017 at 09:27:57AM +0900, Akira Yokosawa wrote:
> Hi, Paul
> 
> As I mentioned, I'm submitting a patch set to switch default
> monospace font to "couriers" (courier scaled).
> 
> Patch 1 does the switch.
> Patch 2 adds a new target "help" that explains various targets.
> Patches 3 and 4 revert manual fontsize tweaks.
> Patch 5 encloses a short verbatim definition in a minipage, It was
> a bit too wide with non-scaled courier, but now it is safe to
> be indented as a paragraph.

Thank you, queued and pushed.  I added a fixup patch for what looked
to me to be typos in the Makefile help text (which is a very nice
addition, by the way!).  Please let me know if my fixes need fixing.

						Thanx, Paul

>                                         Thanks, Akira
> --
> Akira Yokosawa (5):
>   Promote target 'mss' to default
>   Makefile: Add target 'help'
>   Revert "after: Tweak font size of Figure A.2"
>   Revert "formal/dyntickrcu: Adjust font size of sample code"
>   toolsoftrade: Enclose short verbatim in minipage
> 
>  Makefile                      | 45 ++++++++++++++++++++++++++++++++++---------
>  appendix/questions/after.tex  |  2 +-
>  formal/dyntickrcu.tex         |  2 +-
>  perfbook.tex                  |  2 +-
>  toolsoftrade/toolsoftrade.tex |  4 ++--
>  5 files changed, 41 insertions(+), 14 deletions(-)
> 
> -- 
> 2.7.4
> 

