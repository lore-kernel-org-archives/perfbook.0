Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbgJEWMX (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 5 Oct 2020 18:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601935943;
        bh=/XmQEdS+8IPNSsi4X51T+ZTkBkirInRH7eKG5bDrSEM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=xdtGNB9Srd17sNUyknATmeHIJs8jusCW5NoBXO11sc9UHjPh7id9shtUNGWtfliz5
         /AZBogMOYYI4F1K2B/euU2KfR/mfhaDWhAzRB5QA95Q95yvPp2gEuPKBkp1792CPbv
         tXhXe1EbwtcF9sbcB1jQ8gxQ1+O2OvqcOHJ/8dME=
Date: Mon, 5 Oct 2020 15:12:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] api-gcc.h: fix typos in the functions atomic_add_*
Message-ID: <20201005221222.GA14386@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200929084006.GA31703@HongKong.localdomain>
 <d634acb5-f4b4-4e76-fecf-91a0ca541e79@gmail.com>
 <20201003042847.GA32682@HongKong.localdomain>
 <20201003161925.GL29330@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003161925.GL29330@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchang2020@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Oct 03, 2020 at 09:19:25AM -0700, Paul E. McKenney wrote:
> On Sat, Oct 03, 2020 at 12:28:47PM +0800, Junchang Wang wrote:

[ . . . ]

> But sadly, this change does not fix this bug:
> 
> $ ./hash_bkt_hazptr --schroedinger --nreaders 1 --duration 1000 --updatewait 0 --nbuckets 8192 --elems/writer 8192
> Segmentation fault (core dumped)
> 
> Can't have everything.  ;-)
> 
> It appears that hashtorture manages to fail to call the per-thread
> hazard-pointers initialization on some paths, so it is no surprise
> that Junchang's fix doesn't fix this bug.

							Thanx, Paul

------------------------------------------------------------------------

commit 2533decebb7fca65d2860174246966f5ed255dd0
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Mon Oct 5 15:10:03 2020 -0700

    datastruct/hash: Add missing hash_register_thread()
    
    The zoo_test() function was missing the hash_register_thread() invocation
    that is required to make hazard pointers work correctly.  The lack
    of this invocation results in a segmentation violation.  This commit
    therefore adds this call.
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
index 6d30cb8..7d43e11 100644
--- a/CodeSamples/datastruct/hash/hashtorture.h
+++ b/CodeSamples/datastruct/hash/hashtorture.h
@@ -1211,6 +1211,7 @@ void zoo_test(void)
 	for (i = 0; i < nupdaters * elperupdater; i++) {
 		sprintf(&zoo_names[ZOO_NAMELEN * i], "a%ld", i);
 	}
+	hash_register_thread();
 
 	zhep = malloc(sizeof(*zhep));
 	BUG_ON(!zhep);
