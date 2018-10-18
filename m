Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60476 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725738AbeJSEhB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 19 Oct 2018 00:37:01 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9IKNkTB043048
        for <perfbook@vger.kernel.org>; Thu, 18 Oct 2018 16:34:17 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2n6ygt49q1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 18 Oct 2018 16:34:17 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 18 Oct 2018 16:34:17 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w9IKYEpK44105878
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <perfbook@vger.kernel.org>; Thu, 18 Oct 2018 20:34:14 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3FA7FB205F
        for <perfbook@vger.kernel.org>; Thu, 18 Oct 2018 20:34:14 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 216A0B2065
        for <perfbook@vger.kernel.org>; Thu, 18 Oct 2018 20:34:14 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.109])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
        for <perfbook@vger.kernel.org>; Thu, 18 Oct 2018 20:34:14 +0000 (GMT)
Date: Thu, 18 Oct 2018 13:34:14 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Release/edition plans
Reply-To: paulmck@linux.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-Id: <20181018203414.GA19175@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

I would normally have done a perfbook release by now, given that the last
one was in November 2017.  My lame excuse is that creating 340 RCU/LKMM
patches thus far this year turned out to be a bit harder than it looks.

My current thought is to get a release out in the next month or two,
and to get the second edition out in 2019.

Thoughts?

							Thanx, Paul

