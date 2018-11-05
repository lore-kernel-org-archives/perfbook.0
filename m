Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56244 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725945AbeKFFHD (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 6 Nov 2018 00:07:03 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA5Jek32047221
        for <perfbook@vger.kernel.org>; Mon, 5 Nov 2018 14:45:47 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2njsed89pj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 05 Nov 2018 14:45:47 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 5 Nov 2018 19:45:45 -0000
Date: Mon, 5 Nov 2018 11:45:42 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/2] memorder: fix typo
Reply-To: paulmck@linux.ibm.com
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
 <1541330319-14491-2-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541330319-14491-2-git-send-email-junchangwang@gmail.com>
Message-Id: <20181105194542.GZ4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sun, Nov 04, 2018 at 07:18:38PM +0800, Junchang Wang wrote:
> Fix typos in memorder.tex.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

You know, I have no idea what litmus test I was describing in that
paragraph, but it certainly wasn't the one in Listing 15.17.  :-/

I adjusted things a bit more, so please see below and let me know if
I messed anything up.

							Thanx, Paul

------------------------------------------------------------------------

commit 73f0f6583b154f2cd9280f321e87dcaabe6b1221
Author: Junchang Wang <junchangwang@gmail.com>
Date:   Sun Nov 4 19:18:38 2018 +0800

    memorder: Fix typo
    
    Fix typos in memorder.tex, including a very confused paragraph that
    seems to be referring to some prior version of Listing 15.17.
    
    Signed-off-by: Junchang Wang <junchangwang@gmail.com>
    [ paulmck: Adjusted rewording of Listing 15.17 discussion. ]
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 8e11e92153e0..5e74a912e15d 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1364,7 +1364,7 @@ The head pointer is \co{x1}, which initially
 references the \co{int} variable \co{y} (line~5), which is in turn
 initialized to the value $1$ (line~4).
 \co{P0()} updates head pointer \co{x1} to reference \co{x0} (line~12),
-but only afer initializing it to $2$ (line~10) and forcing ordering
+but only after initializing it to $2$ (line~10) and forcing ordering
 (line~11).
 \co{P1()} picks up the head pointer \co{x1} (line~21), and then loads
 the referenced value (line~22).
@@ -2294,9 +2294,9 @@ These ordering constraints are depicted graphically in
 Figure~\ref{fig:memorder:Cumulativity}.
 Note also that cumulativity is not limited to a single step back in time.
 If there was another load from \co{x} or store to \co{x} from any thread
-that came before the store on line~13, that prior load or store would also
-be ordered before the store on line~32, though only if both \co{r1} and
-\co{r2} both end up containing the address of \co{x}.
+that came before the store on line~8, that prior load or store would also
+be ordered before the load on line~25, though only if both \co{r1} and
+\co{r2} both end up containing the value \co{1}.
 
 In short, use of cumulative ordering operations can suppress
 non-multicopy-atomic behaviors in some situations.

