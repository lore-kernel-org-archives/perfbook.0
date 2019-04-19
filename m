Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34774 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbfDSSUh (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 19 Apr 2019 14:20:37 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3JI5Cp6001974
        for <perfbook@vger.kernel.org>; Fri, 19 Apr 2019 14:20:36 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ryjv7h8b8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 19 Apr 2019 14:20:36 -0400
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 19 Apr 2019 19:20:35 +0100
Date: Fri, 19 Apr 2019 11:20:34 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: On recent update in defer/rcuintro
Reply-To: paulmck@linux.ibm.com
References: <b9b585b4-5822-9cc3-2662-eece0dfd113c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9b585b4-5822-9cc3-2662-eece0dfd113c@gmail.com>
Message-Id: <20190419182034.GE14111@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 20, 2019 at 12:27:23AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> You might have already noticed, but your fix of Figure 9.7 has 
> made Quick Quiz 9.20 pointless. And there remains another use of
> WRITE_ONCE() in Figure 9.8 and its discussion in the text.

I do have several areas half-done, don't I?  I fixed this with your
Reported-by, thank you!

							Thanx, Paul

