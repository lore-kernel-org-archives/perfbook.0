Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33664 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750826AbdKCM1X (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 3
 Nov 2017 08:27:23 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA3CK9au029782
 for <perfbook@vger.kernel.org>; Fri, 3 Nov 2017 08:27:22 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2e0pv764xa-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 03 Nov 2017 08:27:22 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 3 Nov 2017
 08:27:21 -0400
Date: Fri, 3 Nov 2017 05:27:19 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Invalid compilation without -fno-strict-aliasing
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
Message-Id: <20171103122719.GH3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Nov 03, 2017 at 09:54:15AM +0800, Yubin Ruan wrote:
> Does anyone have any idea why this thread
> 
>     https://lkml.org/lkml/2003/2/25/270

Hmmm...  This is quite the blast from the past.  Compilers have changed
a bit in the last 14 years.  Nevertheles...

> is related to strict-aliasing? To me, a compiler barrier like this will fix it:
> 
>     if((stream + event_len) < ends) {
>         iwe->len = event_len;
>         barrier();
>         memcpy(stream, (char *) iwe, event_len);
>         stream += event_len;
>     }

As with many bugs, there are a number of ways to fix this one.  I suggest taking
a look at the documentation for -no-strict-alias.  This stackoverflow URL might
not be a bad place to start:

https://stackoverflow.com/questions/23848188/strict-aliasing-rule-and-char-pointers

								Thanx, Paul

