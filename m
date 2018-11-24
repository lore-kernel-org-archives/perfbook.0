Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53754 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725774AbeKYDge (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 24 Nov 2018 22:36:34 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAOGi9RZ123576
        for <perfbook@vger.kernel.org>; Sat, 24 Nov 2018 11:47:44 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ny3qdvbgs-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 24 Nov 2018 11:47:44 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 24 Nov 2018 16:47:43 -0000
Date: Sat, 24 Nov 2018 08:47:41 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/3] Patches for Section Deferred Processing
Reply-To: paulmck@linux.ibm.com
References: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20181124164741.GX4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Nov 24, 2018 at 05:34:51PM +0800, Junchang Wang wrote:
> Hi Paul,
> 
> This is the patch sets for Section Deferred Processing. Please take a look.
> 
> The first patch fixes a dependency issue in compiling route_hazptr.c.
> 
> The second patch fixes a memory leak bug in hazptr.c.
> 
> The last one fixes a typo in writing.
> 
> 
> Thanks,
> --Junchang

Good catches, applied, thank you!

On the memory-leak bug, I removed the "if" due to POSIX specifying
that free() is a no-op when given a NULL pointer.

	http://pubs.opengroup.org/onlinepubs/009695399/functions/free.html

Please see below for the updated commit, and please let me know if I
messed anything up.

						Thanx, Paul

> Junchang Wang (3):
>   route_hazptr: Add dependency to hazptr
>   route_hazptr: Fix a memory leak bug
>   defer: Fix a typo
> 
>  CodeSamples/defer/Makefile | 2 +-
>  CodeSamples/defer/hazptr.c | 4 ++++
>  defer/hazptr.tex           | 2 +-
>  3 files changed, 6 insertions(+), 2 deletions(-)

------------------------------------------------------------------------

commit b8c1647f53ddedf10bf2973371f6f685dfd31d62
Author: Junchang Wang <junchangwang@gmail.com>
Date:   Sat Nov 24 17:34:53 2018 +0800

    route_hazptr: Fix a memory leak bug
    
    Global pointer gplist is used to record hazard pointer array once it's
    allocated. This can avoid allocating and freeing hazptr array each time
    function hazptr_scan() is invoked. This patch fixes a memory leak bug and
    helps achieve the design goal.
    
    Signed-off-by: Junchang Wang <junchangwang@gmail.com>
    [ paulmck: Remove redundant "if" because free() ignores NULL argument. ]
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/CodeSamples/defer/hazptr.c b/CodeSamples/defer/hazptr.c
index 91df310e24a2..fdb387e59ea1 100644
--- a/CodeSamples/defer/hazptr.c
+++ b/CodeSamples/defer/hazptr.c
@@ -53,6 +53,8 @@ void hazptr_thread_exit(void)
 		hazptr_scan();
 		poll(NULL, 0, 1);
 	}
+
+	free(gplist);
 }
 
 void hazptr_reinitialize()
@@ -103,6 +105,7 @@ void hazptr_scan()
 			fprintf(stderr, "hazptr_scan: out of memory\n");
 			exit(EXIT_FAILURE);
 		}
+		gplist = plist;
 	}
 
 	/*

