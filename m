Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=aaRapxX0f4ngKrLf8ZD9ojHYR51VIGv9fJqUK14oE2Q=;
        b=Dw5LWGCGMNUvoMZ9GRemkyncyogu1+YRIN8vrqWaqgiQW7rere/WRLdnGILN6twfZQ
         FVw59LSxsDou2Q6zD3xBYk/+Xo/12KoaruFT5sjZnN5/361QebsuVD2a8HSt6rfUZ2j5
         m8BKtLe6qBnEVttHfwVeyNU9w2c9th7qKd1syBKKwR5KjsOZobN/NG8VU89nYLkjzEhb
         6gWVYTkNkVEWRewYBvOJKGE328OkNnST6TAJlkmjdgvMTXM4/Fqag99WzMB6A74DKM3D
         oxNr/+z9wfLMdBQGp+Kc8mHsds3hdPxv2h3o/xXMqZDT17aYsycfH/3G6JBxQQTTfQd3
         uD+Q==
Date: Thu, 25 Apr 2019 17:25:28 +0800
From: Junchang Wang <junchangwang@gmail.com>
Subject: Question about the detection of overflow in rcu_nest:rcu_read_lock()
Message-ID: <20190425092526.GA17338@PhD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: perfbook@vger.kernel.org
Cc: paulmck@linux.ibm.com, akiyks@gmail.com
List-ID: <perfbook.vger.kernel.org>

Hi list,

I was reading rcu_nest.h and the code snippet (lines 59 - 63), which I believe
is to detect the overflow of variable rcu_gp_ctr, confused me a lot. Can some
of you shed light on that?

Specifically, what's the goal of line 60? Why should we compare the value of
(rcu_gp_ctr - tmp) against "111 1111 0000 0000"? If I understand correctly,
line 60 is to detect the scenario where rcu_gp_ctr has wrapped around and is
currently smaller than variable tmp. If that is correct, should line 60 be the
following?

60             ((tmp - READ_ONCE(rcu_gp_ctr)) > RCU_GP_CTR_BOTTOM_BIT) {

Or did I misunderstand anything here? 

 40 static void rcu_read_lock(void)
 41 {
 42         long tmp;
 43         long *rrgp;
 44 
 45         /*
 46          * If this is the outermost RCU read-side critical section,
 47          * copy the global grace-period counter.  In either case,
 48          * increment the nesting count held in the low-order bits.
 49          */
 50 
 51         rrgp = &__get_thread_var(rcu_reader_gp);
 52 retry:
 53         tmp = *rrgp;
 54         if ((tmp & RCU_GP_CTR_NEST_MASK) == 0)
 55                 tmp = READ_ONCE(rcu_gp_ctr);
 56         tmp++;
 57         *rrgp = tmp;
 58         smp_mb();
 59         if (((tmp & RCU_GP_CTR_NEST_MASK) == 1) &&
 60             ((rcu_gp_ctr - tmp) > (RCU_GP_CTR_NEST_MASK << 8)) != 0) {
 61                 (*rrgp)--;
 62                 goto retry;
 63         }
 64 }

Thanks,
--Junchang

