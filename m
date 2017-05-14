Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49995 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1758597AbdENQdz (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 14 May 2017 12:33:55 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4EGXnOK019516
 for <perfbook@vger.kernel.org>; Sun, 14 May 2017 12:33:49 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2aedkmmyu0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 14 May 2017 12:33:49 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 14 May
 2017 12:33:48 -0400
Date: Sun, 14 May 2017 09:33:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Question about performance figures in Section 9
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CABoNC812ZneaAkQ7EERgcz6y3OOaY+03ybNfX_0jYxZ2Fed2BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABoNC812ZneaAkQ7EERgcz6y3OOaY+03ybNfX_0jYxZ2Fed2BQ@mail.gmail.com>
Message-Id: <20170514163347.GO3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 14, 2017 at 11:02:18PM +0800, Junchang Wang wrote:
> Hi list,
> 
> I'm reading Section 9 which is excellent. I have one quick question
> now. For performance figures (e.g. 9.16 on page 178), what's the
> pattern of add/del being performed? Are we assuming a mostly read
> rarely write scenario? I'm totally fine if that's the case. Just want
> to make sure.

It is a read-only workload, as noted in the discussion of
Figure 9.5.  For more realistic data structures and workloads,
see Chapter 10.

							Thanx, Paul

