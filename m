Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50830 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S2388062AbeGWV6G (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 23 Jul 2018 17:58:06 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6NKsORp125052
 for <perfbook@vger.kernel.org>; Mon, 23 Jul 2018 16:55:05 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2kdj7xvw5v-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Mon, 23 Jul 2018 16:55:05 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 23 Jul
 2018 16:55:05 -0400
Date: Mon, 23 Jul 2018 13:55:07 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Changing non-volatile access to volatile in counter examples
Reply-To: paulmck@linux.vnet.ibm.com
References: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
Message-Id: <20180723205507.GY12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Imre Palik <imrep.amz@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 23, 2018 at 10:07:24PM +0200, Imre Palik wrote:
> 
> This series changes some of the counter examples to use volatile access, to
> avoid overly eager compilers/linkers to optimise out necessary reads/writes.

Applied and pushed, thank you!

And very nice to get that graph upgraded to the much more recent Kaby
Lake!  By the way, if you have one with more than eight hardware threads,
I would not say "no" to an expanded graph.  ;-)

							Thanx, Paul

