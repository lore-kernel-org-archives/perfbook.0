Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53628 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725916AbeLCRdE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 3 Dec 2018 12:33:04 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB3HTPaj051636
        for <perfbook@vger.kernel.org>; Mon, 3 Dec 2018 12:32:57 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p58dyhwyd-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 03 Dec 2018 12:32:56 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 3 Dec 2018 17:32:56 -0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB3HWroU16121938
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <perfbook@vger.kernel.org>; Mon, 3 Dec 2018 17:32:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7F3EBB2066
        for <perfbook@vger.kernel.org>; Mon,  3 Dec 2018 17:32:53 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 61AECB205F
        for <perfbook@vger.kernel.org>; Mon,  3 Dec 2018 17:32:53 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.38])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
        for <perfbook@vger.kernel.org>; Mon,  3 Dec 2018 17:32:53 +0000 (GMT)
Date: Mon, 3 Dec 2018 09:32:56 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: FYI, planning a release this Friday (December 7th)
Reply-To: paulmck@linux.ibm.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-Id: <20181203173256.GA2630@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

This is really not a big deal, but I am planning to make a release this
Friday, or by the end of the weekend at the latest (Pacific Time).
I really should be doing releases more often, as they are intended not
so much to be an end product, but rather to be a convenience to readers
who would like to see something recent, but who do not wish to install
the LaTeX machinery required to build from source.  In contrast, an
edition is intended to have consistent look and feel and a minimum of
"under construction" sections.  I hope to put out an edition around
the middle of next year (2019).

Being as I am frequently guilty of forgetting this distinction between
release and edition, I have added the following to FAQ.txt.

Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

10.	What is the difference between a "release" and an "edition"?

	A.	A release is a snapshot provided for readers who would
		like something reasonably up to date, but who do not wish
		to install all the pieces of LaTeX required to build one
		themselves.  Every few years, there will be a special
		release with more-consistent look and feel, and with
		fewer (and preferably no) sections under construction,
		and these special releases are called "editions".  Also,
		as noted earlier, each edition has a version that may
		be more easily printed.

