Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57114 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729243AbeKLDX3 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 11 Nov 2018 22:23:29 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wABHXuj2021771
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 12:34:20 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2npde7xd3u-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 12:34:20 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 11 Nov 2018 17:34:19 -0000
Date: Sun, 11 Nov 2018 09:34:17 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] tooloftrade: add missing subject of sentence
Reply-To: paulmck@linux.ibm.com
References: <1541854198-4649-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541854198-4649-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20181111173417.GV4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Nov 10, 2018 at 08:49:58PM +0800, Junchang Wang wrote:
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
> Hi Paul,
> 
> This is the only patch for Chapter Tools of Trade. Please take a look.

Good catch!  I took this with Akira's suggested update as shown below,
thank you both!!!

							Thanx, Paul

-------------------------------------------------------------------------

commit 59d25618814ae5333e243f536f1295ff49a035ff
Author: Junchang Wang <junchangwang@gmail.com>
Date:   Sat Nov 10 20:49:58 2018 +0800

    tooloftrade: add missing subject of sentence
    
    Signed-off-by: Junchang Wang <junchangwang@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
    [ paulmck: Apply change suggested by Akira Yokosawa. ]

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 0844b4c74c05..20171872e906 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2043,8 +2043,8 @@ machine-sized and properly aligned.
 It can also prevent load fusing, store fusing, invented loads, and
 invented stores.
 However, although it does prevent the compiler from reordering \co{volatile}
-accesses with each other, does nothing to prevent the CPU from reordering
-these accesses.
+accesses with each other, it does nothing to prevent the
+CPU from reordering these accesses.
 Furthermore, it does nothing to prevent either compiler or CPU from
 reordering non-\co{volatile} accesses with each other or with
 \co{volatile} accesses.

