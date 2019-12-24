Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbfLXRYe (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 24 Dec 2019 12:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577208272;
        bh=It5dWln1VLlN2L0mXwwwZr06D4BcRpDgan7Ch4PNykk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=x6S6KPS9DiuATMGkociTJeHp1vEgw/B3vv+qDoys3OrjlPnRY5X9yBFtUtg6i49qI
         NRtq+OMTD9w0J1Ab0KycsJvg1eJ8GziURUAe6A/WpMFNSNnkyBktyeOvjQJArTNGfG
         B8ET7ALYYeApNyZlkkFDIIsQ4wM+pNwN7ZS35S2s=
Date: Tue, 24 Dec 2019 09:24:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] utilities/autodate: Restore compatibility with bash
Message-ID: <20191224172432.GI13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
 <b9691f42-5edb-d57f-3a11-d6ce7a7b930e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9691f42-5edb-d57f-3a11-d6ce7a7b930e@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Dec 23, 2019 at 08:55:08PM +0900, Akira Yokosawa wrote:
> >From 43bf4cc57125d756ccd14b629692c4ecdb5c36dc Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 23 Dec 2019 20:52:46 +0900
> Subject: [PATCH v2] utilities/autodate: Restore compatibility with bash
> 
> Also improve uses of single quotes (without escaping) and
> double quotes (with escaping) in the script.
> 
> Fixes: 650f763c31e8 ("utilities/autodate: Mark released versions")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Changes in v2:
> 
>     o Modified title
>     o Tested with both "dash" and "bash" as /bin/sh
> 
>         Thanks, Akira

It does work here, queued and pushed, thank you!

In other non-urgent news, arxiv does not like "@" in filenames (see below
for its complaints).  It -looks- like it is possible to make these instead
be "=" by changing the 's/:/@/g ;' instances in utilities/gen_snippet_d.pl
to 's/:/=/g ;', and then changing the pathnames containing "@" in the
various .tex files to "=".  But I figured I should check with you before
breaking something.  (If it was urgent, I would try it anyway, but I have
no problem waiting a few weeks before posting to Arxiv.  Hence my asking
non-urgently.)

							Thanx, Paul

------------------------------------------------------------------------

We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename lockhdeq@pop_push.fcv to lockhdeq_pop_push.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename lockhdeq@struct_pdeq.fcv to lockhdeq_struct_pdeq.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename locktdeq@pop_push.fcv to locktdeq_pop_push.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename smpalloc@alloc.fcv to smpalloc_alloc.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename smpalloc@data_struct.fcv to smpalloc_data_struct.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename smpalloc@free.fcv to smpalloc_free.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename time@consumer.fcv to time_consumer.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename time@producer.fcv to time_producer.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename api-pthreads@compiler_barrier.fcv to api-pthreads_compiler_barrier.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename api-pthreads@waitall.fcv to api-pthreads_waitall.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_atomic@inc-read.fcv to count_atomic_inc-read.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_end@whole.fcv to count_end_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_end_rcu@whole.fcv to count_end_rcu_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim@add_sub_read.fcv to count_lim_add_sub_read.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim@utility.fcv to count_lim_utility.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim@variable.fcv to count_lim_variable.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_app@balance.fcv to count_lim_app_balance.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_app@variable.fcv to count_lim_app_variable.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_atomic@add_sub.fcv to count_lim_atomic_add_sub.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_atomic@read.fcv to count_lim_atomic_read.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_atomic@utility1.fcv to count_lim_atomic_utility1.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_atomic@utility2.fcv to count_lim_atomic_utility2.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_atomic@var_access.fcv to count_lim_atomic_var_access.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_sig@add.fcv to count_lim_sig_add.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_sig@data.fcv to count_lim_sig_data.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_sig@initialization.fcv to count_lim_sig_initialization.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_sig@migration.fcv to count_lim_sig_migration.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_sig@read.fcv to count_lim_sig_read.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_lim_sig@sub.fcv to count_lim_sig_sub.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_nonatomic@inc-read.fcv to count_nonatomic_inc-read.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_stat@inc-read.fcv to count_stat_inc-read.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_stat_eventual@whole.fcv to count_stat_eventual_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename count_tstat@whole.fcv to count_tstat_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt@add_del.fcv to hash_bkt_add_del.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt@alloc_free.fcv to hash_bkt_alloc_free.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt@lookup.fcv to hash_bkt_lookup.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt@map_lock.fcv to hash_bkt_map_lock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt@struct.fcv to hash_bkt_struct.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt_rcu@add_del.fcv to hash_bkt_rcu_add_del.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt_rcu@lock_unlock.fcv to hash_bkt_rcu_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_bkt_rcu@lookup.fcv to hash_bkt_rcu_lookup.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_resize@access.fcv to hash_resize_access.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_resize@data.fcv to hash_resize_data.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_resize@get_bucket.fcv to hash_resize_get_bucket.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_resize@lock_unlock_mod.fcv to hash_resize_lock_unlock_mod.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_resize@resize.fcv to hash_resize_resize.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_resize_s@access.fcv to hash_resize_s_access.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hash_resize_s@lock_mod.fcv to hash_resize_s_lock_mod.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename datablows@whole.fcv to datablows_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hazptr@record_clear.fcv to hazptr_record_clear.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename hazptr@scan_free.fcv to hazptr_scan_free.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu@define.fcv to rcu_define.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu@read_lock_unlock.fcv to rcu_read_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu@synchronize.fcv to rcu_synchronize.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_lock@lock_unlock.fcv to rcu_lock_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_lock@synchronize.fcv to rcu_lock_synchronize.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_lock_percpu@lock_unlock.fcv to rcu_lock_percpu_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_lock_percpu@sync.fcv to rcu_lock_percpu_sync.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_nest@define.fcv to rcu_nest_define.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_nest@read_lock_unlock.fcv to rcu_nest_read_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_nest@synchronize.fcv to rcu_nest_synchronize.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_qs@define.fcv to rcu_qs_define.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_qs@read_lock_unlock.fcv to rcu_qs_read_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_qs@synchronize.fcv to rcu_qs_synchronize.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcg@lock_unlock.fcv to rcu_rcg_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcg@sync.fcv to rcu_rcg_sync.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpg@define.fcv to rcu_rcpg_define.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpg@r.fcv to rcu_rcpg_r.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpg@sync.fcv to rcu_rcpg_sync.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpl@define.fcv to rcu_rcpl_define.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpl@r.fcv to rcu_rcpl_r.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpl@u.fcv to rcu_rcpl_u.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpls@define.fcv to rcu_rcpls_define.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpls@r.fcv to rcu_rcpls_r.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rcu_rcpls@u.fcv to rcu_rcpls_u.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_hazptr@add_del.fcv to route_hazptr_add_del.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_hazptr@lookup.fcv to route_hazptr_lookup.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_rcu@add_del.fcv to route_rcu_add_del.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_rcu@lookup.fcv to route_rcu_lookup.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_refcnt@add_del.fcv to route_refcnt_add_del.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_refcnt@lookup.fcv to route_refcnt_lookup.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_seq@lookup_add_del.fcv to route_seq_lookup_add_del.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_seqlock@add_del.fcv to route_seqlock_add_del.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename route_seqlock@lookup.fcv to route_seqlock_lookup.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename seqlock@impl.fcv to seqlock_impl.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+o-rl-rul-o+o-rl-rul-o@whole.fcv to C-LB+o-rl-rul-o+o-rl-rul-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+rl-o-o-rul+rl-o-o-rul@whole.fcv to C-LB+rl-o-o-rul+rl-o-o-rul_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-Lock1@whole.fcv to C-Lock1_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-Lock2@whole.fcv to C-Lock2_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-RCU-remove@whole.fcv to C-RCU-remove_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-RomanPenyaev-list-rcu-rr@whole.fcv to C-RomanPenyaev-list-rcu-rr_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+l-o-o-u+l-o-o-u-C@whole.fcv to C-SB+l-o-o-u+l-o-o-u-C_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+i-rl-o-o-rul@whole.fcv to C-SB+o-rcusync-o+i-rl-o-o-rul_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+o-o@whole.fcv to C-SB+o-rcusync-o+o-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul@whole.fcv to C-SB+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+o-rcusync-o@whole.fcv to C-SB+o-rcusync-o+o-rcusync-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+o-rl-o-rul@whole.fcv to C-SB+o-rcusync-o+o-rl-o-rul_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+o-rl-rul-o@whole.fcv to C-SB+o-rcusync-o+o-rl-rul-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul@whole.fcv to C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+rl-o-o-rul@whole.fcv to C-SB+o-rcusync-o+rl-o-o-rul_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-rcusync-o+rl-o-rul-o@whole.fcv to C-SB+o-rcusync-o+rl-o-rul-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-2+2W+o-o+o-o@whole.fcv to C-2+2W+o-o+o-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-2+2W+o-wmb-o+o-wmb-o@whole.fcv to C-2+2W+o-wmb-o+o-wmb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-CCIRIW+o+o+o-o+o-o@whole.fcv to C-CCIRIW+o+o+o-o+o-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-ISA2+o-r+a-r+a-r+a-o@whole.fcv to C-ISA2+o-r+a-r+a-r+a-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+a-o+o-data-o+o-data-o@whole.fcv to C-LB+a-o+o-data-o+o-data-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+a-r+a-r+a-r+a-r@whole.fcv to C-LB+a-r+a-r+a-r+a-r_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+o-cgt-o+o-cgt-o@whole.fcv to C-LB+o-cgt-o+o-cgt-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+o-data-o+o-data-o+o-data-o@whole.fcv to C-LB+o-data-o+o-data-o+o-data-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+o-o+o-o@whole.fcv to C-LB+o-o+o-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+o-r+a-o@whole.fcv to C-LB+o-r+a-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+o-r+o-ctrl-o@whole.fcv to C-LB+o-r+o-ctrl-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-LB+o-r+o-data-o@whole.fcv to C-LB+o-r+o-data-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-MP+o-o+o-rmb-o@whole.fcv to C-MP+o-o+o-rmb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-MP+o-r+o-ctrl-o@whole.fcv to C-MP+o-r+o-ctrl-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-MP+o-wmb-o+o-addr-o@whole.fcv to C-MP+o-wmb-o+o-addr-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-MP+o-wmb-o+o-o@whole.fcv to C-MP+o-wmb-o+o-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-MP+o-wmb-o+o-rmb-o@whole.fcv to C-MP+o-wmb-o+o-rmb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-MP-OMCA+o-o-o+o-rmb-o@whole.fcv to C-MP-OMCA+o-o-o+o-rmb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-R+o-wmb-o+o-mb-o@whole.fcv to C-R+o-wmb-o+o-mb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-S+o-wmb-o+o-addr-o@whole.fcv to C-S+o-wmb-o+o-addr-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-mb-o+o-mb-o@whole.fcv to C-SB+o-mb-o+o-mb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-SB+o-o+o-o@whole.fcv to C-SB+o-o+o-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-W+RWC+o-mb-o+a-o+o-mb-o@whole.fcv to C-W+RWC+o-mb-o+a-o+o-mb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-W+RWC+o-r+a-o+o-mb-o@whole.fcv to C-W+RWC+o-r+a-o+o-mb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-WRC+o+o-data-o+o-rmb-o@whole.fcv to C-WRC+o+o-data-o+o-rmb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-WRC+o+o-r+a-o@whole.fcv to C-WRC+o+o-r+a-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-WWC+o-cgt-o+o-cgt-o+o@whole.fcv to C-WWC+o-cgt-o+o-cgt-o+o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-Z6.2+o-r+a-o+o-mb-o@whole.fcv to C-Z6.2+o-r+a-o+o-mb-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename C-Z6.2+o-r+a-r+a-r+a-o@whole.fcv to C-Z6.2+o-r+a-r+a-r+a-o_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename atomicincrement@incrementer.fcv to atomicincrement_incrementer.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base-s@dyntick_nohz.fcv to dyntickRCU-base-s_dyntick_nohz.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base-s@grace_period.fcv to dyntickRCU-base-s_grace_period.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base-s@grace_period_state.fcv to dyntickRCU-base-s_grace_period_state.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base-sl-busted@dyntick_nohz.fcv to dyntickRCU-base-sl-busted_dyntick_nohz.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base-sl-busted@grace_period.fcv to dyntickRCU-base-sl-busted_grace_period.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base-sl@dyntick_nohz.fcv to dyntickRCU-base-sl_dyntick_nohz.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base-sl@grace_period.fcv to dyntickRCU-base-sl_grace_period.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base@dyntick_nohz.fcv to dyntickRCU-base_dyntick_nohz.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-base@grace_period.fcv to dyntickRCU-base_grace_period.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irq-nmi-ssl@EXECUTE_IRQ.fcv to dyntickRCU-irq-nmi-ssl_EXECUTE_IRQ.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irq-nmi-ssl@EXECUTE_MAINLINE.fcv to dyntickRCU-irq-nmi-ssl_EXECUTE_MAINLINE.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irq-nmi-ssl@dyntick_irq.fcv to dyntickRCU-irq-nmi-ssl_dyntick_irq.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irq-nmi-ssl@dyntick_nmi.fcv to dyntickRCU-irq-nmi-ssl_dyntick_nmi.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irq-nmi-ssl@grace_period.fcv to dyntickRCU-irq-nmi-ssl_grace_period.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irq-ssl@dyntick_irq.fcv to dyntickRCU-irq-ssl_dyntick_irq.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irqnn-ssl@EXECUTE_MAINLINE.fcv to dyntickRCU-irqnn-ssl_EXECUTE_MAINLINE.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irqnn-ssl@dyntick_irq.fcv to dyntickRCU-irqnn-ssl_dyntick_irq.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irqnn-ssl@dyntick_nohz.fcv to dyntickRCU-irqnn-ssl_dyntick_nohz.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename dyntickRCU-irqnn-ssl@grace_period.fcv to dyntickRCU-irqnn-ssl_grace_period.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename increment@whole.fcv to increment_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename lock@spin.fcv to lock_spin.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename lock@whole.fcv to lock_whole.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename qrcu@gvar.fcv to qrcu_gvar.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename qrcu@init.fcv to qrcu_init.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename qrcu@reader.fcv to qrcu_reader.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename qrcu@sum_unordered.fcv to qrcu_sum_unordered.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename qrcu@updater.fcv to qrcu_updater.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename threadcreate@main.fcv to threadcreate_main.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename threadcreate@thread_test.fcv to threadcreate_thread_test.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename locked_list@list_print.fcv to locked_list_list_print.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename locked_list@start_next.fcv to locked_list_start_next.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename xchglock@lock_unlock.fcv to xchglock_lock_unlock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename forkjoinvar@main.fcv to forkjoinvar_main.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename lock@diff_lock.fcv to lock_diff_lock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename lock@reader_writer.fcv to lock_reader_writer.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename lock@same_lock.fcv to lock_same_lock.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename parallel@compute_it.fcv to parallel_compute_it.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename pcreate@mythread.fcv to pcreate_mythread.fcv.
We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
Attempting to rename rwlockscale@reader.fcv to rwlockscale_reader.fcv.
