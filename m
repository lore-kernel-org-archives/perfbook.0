Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57374 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751578AbdBMTGE (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 13 Feb 2017 14:06:04 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1DJ3faL010836
 for <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 14:06:03 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28kbxdartf-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 13 Feb 2017 14:06:03 -0500
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 13 Feb
 2017 12:06:01 -0700
Date: Mon, 13 Feb 2017 11:06:00 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Question] different kinds of memory barrier
Reply-To: paulmck@linux.vnet.ibm.com
References: <881f369d-4e5b-a335-6359-c5d7bf1bc086@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <881f369d-4e5b-a335-6359-c5d7bf1bc086@gmail.com>
Message-Id: <20170213190600.GJ30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Feb 13, 2017 at 09:55:50PM +0800, Yubin Ruan wrote:
> It have been mentioned in the book that there are three kinds of
> memory barriers: smp_rmb, smp_wmb, smp_mb
> 
> I am confused about their actual semantic:
> 
> The book says that(B.5 paragraph 2, perfbook2017.01.02a):
> 
> for smp_rmb():
>     "The effect of this is that a read memory barrier orders
>      only loads on the CPU that executes it, so that all loads
>      preceding the read memory barrier will appear to have
>      completed before any load following the read memory
>      barrier"
> 
> for smp_wmb():
>     "so that all stores preceding the write memory barrier will
>      appear to have completed before any store following the
>      write memory barrier"
> 
> I wonder, is there any primitive "X" which can guarantees:
>     "that all 'loads' preceding the X will appear to have completed
>      before any *store* following the X "
> 
> and similarly:
>     "that all 'store' preceding the X will appear to have completed
>      before any *load* following the X "
> 
> I know I can use the general smp_mb() for that, but that is a little
> too general.
> 
> Do I miss/mix anything ?

Well, the memory-ordering material is a bit dated.  There is some work
underway to come up with a better model, and I presented on it a couple
weeks ago:

http://www.rdrop.com/users/paulmck/scalability/paper/LinuxMM.2017.01.19a.LCA.pdf

This presentation calls out a tarball that includes some .html files
that have much better explanations, and this wording will hopefully
be reflected in an upcoming version of the book.  Here is a direct
URL for the tarball:

http://www.rdrop.com/users/paulmck/scalability/paper/LCA-LinuxMemoryModel.2017.01.15a.tgz 

							Thanx, Paul

