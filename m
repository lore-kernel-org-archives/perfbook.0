Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54950 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726003AbfADAwZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 3 Jan 2019 19:52:25 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x040nAaR071613
        for <perfbook@vger.kernel.org>; Thu, 3 Jan 2019 19:52:23 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2psq9568cr-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 03 Jan 2019 19:52:23 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 4 Jan 2019 00:52:22 -0000
Date: Thu, 3 Jan 2019 16:52:38 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] datastruct/hash: Tweak appearance of updated code in
 snippet
Reply-To: paulmck@linux.ibm.com
References: <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
 <20181231210307.GU4170@linux.ibm.com>
 <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com>
 <20190102191822.GA30360@linux.ibm.com>
 <a9847c9c-a7ca-5bf7-6936-7a68203c4fd2@gmail.com>
 <20190103172145.GG4170@linux.ibm.com>
 <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
Message-Id: <20190104005238.GI4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jan 04, 2019 at 08:35:07AM +0900, Akira Yokosawa wrote:
> On 2019/01/03 09:21:45 -0800, Paul E. McKenney wrote:
> > On Fri, Jan 04, 2019 at 12:57:06AM +0900, Akira Yokosawa wrote:
> >> >From ae50debbf06ad674e4941b55764b02c776484509 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Fri, 4 Jan 2019 00:19:26 +0900
> >> Subject: [PATCH] datastruct/hash: Tweak appearance of updated code in snippet
> >>
> >> Now that "[" and "]" are used within the code, "commandchars" should
> >> avoid them.
> >>
> >> Also wrap a line which has become too wide for the 2c layout.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Ah, the lsp[2] was a temporary state.  I forgot to do a final "git push"
> > yesterday, apologies!
> > 
> >> ---
> >> Hi Paul,
> >>
> >> I'm in the middle of reading the updated code.
> >>
> >> I'm sure you are working on the update of Section 10.4.2.
> >> Because of the code change, there are quite a few broken refs
> >> and duplicated labels at the moment.
> > 
> > Yes, it is a bit of a mess at this point.  I figured that if I was
> > going to have to modify the text and labels, I might as well do the
> > extra work to make the API a little less obnoxious.  My first attempt to
> > move hash_resize.c's hashtab_add() in this direction broke very badly,
> > so it is back to the drawing board.
> > 
> > I am thinking in terms of having a single struct ht_lock_state that
> > contains an array or two as one part of making the API less obnoxious,
> > which should help avoid the brokenness.
> > 
> >> This commit just takes care of the vanishing "[" and "]" in
> >> Listing 10.11.
> > 
> > I am hoping that we can retain "[" and "]" -- it is normally not such
> > a good idea to have arrays in parameter lists.
> > 
> > Or do we need this commit anyway just due to array references within
> > the code snippet? 
> 
> Yes, we do.
> 
> >                   If the latter, I will hand-apply the patch.
> 
> Please do so.

Like this?  One reason that the patch didn't apply was that I had
already split the offending line.

							Thanx, Paul

------------------------------------------------------------------------

commit d138666652d064f1ac891af7770dd220d51caa86
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Thu Jan 3 16:50:25 2019 -0800

    datastruct/hash: Tweak appearance of updated code in snippet
    
    Now that "[" and "]" are used within the code, "commandchars" should
    avoid them.
    
    Also wrap a line which has become too wide for the 2c layout.
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 90ca6e57a21c..d042b2048083 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -159,7 +159,7 @@ static void hashtab_unlock_lookup(struct hashtab *htp_master, void *key)
 	rcu_read_unlock();
 }
 
-//\begin{snippet}[labelbase=ln:datastruct:hash_resize:lock_unlock_mod,commandchars=\\\[\]]
+//\begin{snippet}[labelbase=ln:datastruct:hash_resize:lock_unlock_mod,commandchars=\\\@\$]
 /* Update-side lock/unlock functions. */
 static void						//\lnlbl{lock:b}
 resize_lock_mod(struct hashtab *htp_master, void *key,

