Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57852 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726143AbeJBAaP (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 1 Oct 2018 20:30:15 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w91HnIWn046953
        for <perfbook@vger.kernel.org>; Mon, 1 Oct 2018 13:51:19 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2munguytpa-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 01 Oct 2018 13:51:19 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 1 Oct 2018 13:51:18 -0400
Date: Mon, 1 Oct 2018 10:51:17 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Fwd: Other architectures we can work on?
Reply-To: paulmck@linux.ibm.com
References: <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
 <CABoNC82ftdi_Ki-zhwv2xC1HVC4=O-wGvF+wS+MSCEa8ETctXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoNC82ftdi_Ki-zhwv2xC1HVC4=O-wGvF+wS+MSCEa8ETctXQ@mail.gmail.com>
Message-Id: <20181001175117.GF4222@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 01, 2018 at 11:23:17AM +0800, Junchang Wang wrote:
> Forward to list perfbook since the last mail was blocked due to the
> non-plain-text issue.
> 
> 
> Hi Paul and list,
> 
> I'm again reading the excellent 15th chapter (Advanced
> Synchronization), which helps me eventually understand how a
> hardware/compiler can optimize--and hence ``break''-- my parallelized
> code :-).
> 
> I really want to get my hands dirty and to test my code and samples in
> perfbook on real servers. However, all servers in my lab are x86. I
> wonder if there is any chance that we can have access to architectures
> other than x86 to test code. For example, are there any cloud service
> that provides access to POWER or ARM architecture?

For POWER access for academic or open-source projects, please see here:

https://osuosl.org/services/powerdev/request_hosting/

There are said to be similar services for ARM, for example:

https://thenewstack.io/cncf-packet-team-provide-free-infrastructure-cloud-developers

Please let me know how it goes!

							Thanx, Paul

