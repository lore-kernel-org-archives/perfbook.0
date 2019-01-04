Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49130 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726094AbfADWkC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 4 Jan 2019 17:40:02 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x04MdExx143235
        for <perfbook@vger.kernel.org>; Fri, 4 Jan 2019 17:40:01 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ptg2crup9-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 04 Jan 2019 17:40:01 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 4 Jan 2019 22:40:00 -0000
Date: Fri, 4 Jan 2019 14:40:18 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/2] datastruct/hash: Tweak indent of folded line in
 snippet
Reply-To: paulmck@linux.ibm.com
References: <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com>
 <20190102191822.GA30360@linux.ibm.com>
 <a9847c9c-a7ca-5bf7-6936-7a68203c4fd2@gmail.com>
 <20190103172145.GG4170@linux.ibm.com>
 <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
 <faebf12a-02f1-df23-574c-8efe0385038c@gmail.com>
 <175d530e-1ec5-abed-a07f-209eba35e048@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175d530e-1ec5-abed-a07f-209eba35e048@gmail.com>
Message-Id: <20190104224018.GN4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jan 05, 2019 at 12:39:56AM +0900, Akira Yokosawa wrote:
> >From 426fa84ef7b5c6d0200dbd79d213e02ae31badad Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 4 Jan 2019 23:40:14 +0900
> Subject: [PATCH 1/2] datastruct/hash: Tweak indent of folded line in snippet
> 
> For a folded line to be properly indented in the Listing environment,
> it has to have the same number of tab characters as the previous
> line in the code. If the folded line has a deeper indent to align
> with some construct of the previous line, remaining indent depth
> should be represented by space characters.
> 
> Apply this rule to the function prototype of resize_lock_mod().
> In this case, as the previous line doesn't have any tab characters,
> space characters should be used for all of its indent.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Ah, good point, I well recall doing that by hand when creating the
old-style code displays.  I applied this by hand due to an intervening
conflict and pushed it.

							Thanx, Paul

> ---
>  CodeSamples/datastruct/hash/hash_resize.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> index 475a2ab..57c75c1 100644
> --- a/CodeSamples/datastruct/hash/hash_resize.c
> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> @@ -163,7 +163,7 @@ static void hashtab_unlock_lookup(struct hashtab *htp_master, void *key)
>  /* Update-side lock/unlock functions. */
>  static void						//\lnlbl{lock:b}
>  resize_lock_mod(struct hashtab *htp_master, void *key,
> -		struct ht_lock_state *lsp)
> +                struct ht_lock_state *lsp)
>  {
>  	long b;
>  	struct ht *htp;
> -- 
> 2.7.4
> 
> 

