Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgJFPlu (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 6 Oct 2020 11:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601998909;
        bh=IZ0RO9iCyuWjRGIKHuouV+o0S6/MQlEeUBurkNN+CJE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=j19dw2+ZDZJb+ipFxqwQxIEDYNEDegbH3yhUGjlxZtlN026Cih7QdK//3AHpcOqnK
         D1/7Oh30TXV6HyROl6+evlqFf9hlwI0u9VAQeb0J7ydjmojjgdNoUwGxpCzwAyH1WC
         2n4ne0aMvdJxB2M5tCb55UO6uXfQcX91W6661F3w=
Date: Tue, 6 Oct 2020 08:41:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] api-gcc.h: fix typos in the functions atomic_add_*
Message-ID: <20201006154149.GI29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200929084006.GA31703@HongKong.localdomain>
 <d634acb5-f4b4-4e76-fecf-91a0ca541e79@gmail.com>
 <20201003042847.GA32682@HongKong.localdomain>
 <20201003161925.GL29330@paulmck-ThinkPad-P72>
 <20201005221222.GA14386@paulmck-ThinkPad-P72>
 <20201006064020.GA22000@HongKong.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006064020.GA22000@HongKong.localdomain>
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchang2020@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Tue, Oct 06, 2020 at 02:40:20PM +0800, Junchang Wang wrote:
> On Mon, Oct 05, 2020 at 03:12:22PM -0700, Paul E. McKenney wrote:
> >On Sat, Oct 03, 2020 at 09:19:25AM -0700, Paul E. McKenney wrote:
> >> On Sat, Oct 03, 2020 at 12:28:47PM +0800, Junchang Wang wrote:
> >
> >[ . . . ]
> >
> >> But sadly, this change does not fix this bug:
> >> 
> >> $ ./hash_bkt_hazptr --schroedinger --nreaders 1 --duration 1000 --updatewait 0 --nbuckets 8192 --elems/writer 8192
> >> Segmentation fault (core dumped)
> >> 
> >> Can't have everything.  ;-)
> >> 
> >> It appears that hashtorture manages to fail to call the per-thread
> >> hazard-pointers initialization on some paths, so it is no surprise
> >> that Junchang's fix doesn't fix this bug.
> >
> >							Thanx, Paul
> >
> >------------------------------------------------------------------------
> >
> >commit 2533decebb7fca65d2860174246966f5ed255dd0
> >Author: Paul E. McKenney <paulmck@kernel.org>
> >Date:   Mon Oct 5 15:10:03 2020 -0700
> >
> >    datastruct/hash: Add missing hash_register_thread()
> >    
> >    The zoo_test() function was missing the hash_register_thread() invocation
> >    that is required to make hazard pointers work correctly.  The lack
> >    of this invocation results in a segmentation violation.  This commit
> >    therefore adds this call.
> >    
> >    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >
> 
> Hi Paul,
> 
> This patch fixes the bug, and now "./hash_bkt_hazptr --schroedinger" works
> correctly on my servers. Thanks a lot.

Thank you for testing!  May I apply your Tested-by?

							Thanx, Paul

> --Junchang
> 
> >diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
> >index 6d30cb8..7d43e11 100644
> >--- a/CodeSamples/datastruct/hash/hashtorture.h
> >+++ b/CodeSamples/datastruct/hash/hashtorture.h
> >@@ -1211,6 +1211,7 @@ void zoo_test(void)
> > 	for (i = 0; i < nupdaters * elperupdater; i++) {
> > 		sprintf(&zoo_names[ZOO_NAMELEN * i], "a%ld", i);
> > 	}
> >+	hash_register_thread();
> > 
> > 	zhep = malloc(sizeof(*zhep));
> > 	BUG_ON(!zhep);
