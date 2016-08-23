Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48483 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1756502AbcHWAtB (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 22
 Aug 2016 20:49:01 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7N0d6Bx126713
 for <perfbook@vger.kernel.org>; Mon, 22 Aug 2016 20:49:00 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 24y8tmku86-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 22 Aug 2016 20:49:00 -0400
Received: from localhost by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 22 Aug
 2016 18:49:00 -0600
Date: Mon, 22 Aug 2016 17:49:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] debugging: Trivial fixups
Reply-To: paulmck@linux.vnet.ibm.com
References: <1471910788-24070-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471910788-24070-1-git-send-email-sj38.park@gmail.com>
Message-Id: <20160823004910.GX3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 23, 2016 at 09:06:26AM +0900, SeongJae Park wrote:
> This patchset contains trivial fixups under debugging/ that found during Korean
> translation.
> 
> SeongJae Park (2):
>   debugging: Add missing tilde
>   debugging: Fix contextual typos
> 
>  debugging/debugging.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Good catches, applied, thank you!

Though I must confess that there have been times that it seemed that
running programmers under debuggers might be a good idea.  ;-)

							Thanx, Paul

