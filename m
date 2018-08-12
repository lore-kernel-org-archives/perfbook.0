Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43034 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1727876AbeHMCIQ (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 12
 Aug 2018 22:08:16 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w7CNOKk0083816
 for <perfbook@vger.kernel.org>; Sun, 12 Aug 2018 19:28:38 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ktgsmj62c-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 12 Aug 2018 19:28:38 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 12 Aug
 2018 19:28:36 -0400
Date: Sun, 12 Aug 2018 16:28:34 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: memory_order_explicit
Reply-To: paulmck@linux.vnet.ibm.com
References: <23408.40149.473045.271221@guava.gson.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23408.40149.473045.271221@guava.gson.org>
Message-Id: <20180812232834.GJ24813@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andreas Gustafsson <gson@gson.org>
Cc: perfbook@vger.kernel.org

On Sun, Aug 12, 2018 at 11:47:17PM +0300, Andreas Gustafsson wrote:
> perfbook/toolsoftrade/toolsoftrade.tex says:
> 
>   For example, ``\co{memory_order_explicit(&a, memory_order_relaxed)}''
>   is vaguely similar to the Linux kernel's ``\co{READ_ONCE()}''
> 
> I'm no expert on the C11 atomics, but as far as I can see, there is no
> such function as "memory_order_explicit".  Did you perhaps mean to say
> "atomic_load_explicit"?

Indeed I did, good catch, thank you!  I have applied a fix with your
Reported-by.

							Thanx, Paul

