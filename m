Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-ot1-f48.google.com ([209.85.210.48]:43713 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbfAGNtb (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 7 Jan 2019 08:49:31 -0500
Received: by mail-ot1-f48.google.com with SMTP id a11so321657otr.10
        for <perfbook@vger.kernel.org>; Mon, 07 Jan 2019 05:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=W5w0GLirQpTmV8Eg4oyhWxw5PVpNCyOYiMdXLHDmU2M=;
        b=m1oEH6JOIVGPNyaDL97x0Dqces1al6qctB87vHzCShfmZfyU0AE+xkjmzQMQCHj1cj
         GhyLYDyeU+lRG9ULrtffSwXOinTOU6xCgEudphvRg6HtvwiynO9Pn6dX577o1OKt6igF
         PSS6LfSa6UKaUo8KFS+ttBfzl9+iuAvWNzXcJ2wgm4AsAYUtts34Oh8QrAdzcOeOTen1
         DiTSxfEWJekEyQNf9q3NKEFfgpp/YNZ7S5nV3c2+KLqiG1+tt9EkQbQAmyWmdRyjiOto
         wjhmWXzJ8yu6HXjD4l9l4xvBTnZ8hbhZPgw26ai5wm42G2eQDDrxNTTQdsQHUstChnsn
         PTYA==
MIME-Version: 1.0
From: Junchang Wang <junchangwang@gmail.com>
Date: Mon, 7 Jan 2019 21:49:19 +0800
Message-ID: <CABoNC81XkNKv6=g2GUq4pNkwc4mcZ1FyZbjreD9KRfxQQUuPYg@mail.gmail.com>
Subject: Question regarding hash_resize
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi all,

I'm reading hash_resize recently, and have a few questions regarding
this algorithm. Please take a look if you have time. Any suggestions
are warmly welcomed.

=== Question 1 ===
In hash_resize.c : hashtab_lock_mod
186         if (b > READ_ONCE(htp->ht_resize_cur)) {
187                 lsp->hbp[1] = NULL;
188                 return;
189         }
190         htp = rcu_dereference(htp->ht_new);

It seems we are missing a barrier (e.g., smp_mb) in between lines 189
and 190, because neither READ_ONCE() nor rcu_dereference() can prevent
compilers and hardware from reordering the two unrelated variables,
ht_resize_cur and ht_new. Is my understanding correct?

=== Question 2 ===
In hash_resize.c, each time an updater wants to access a bucket, the
updater must first acquire the bucket's lock (htb_lock), preventing
other updaters accessing the same bucket concurrently. This approach
is OK if the linked list of a bucket is relatively short, but for a
larger system where linked lists are long enough and the
perftest_resize thread is running simultaneously, it could become a
potential performance bottleneck. One naive solution is to allow
multiple updaters to access the same bucket, only if they don't
operate on the same item of the list of this bucket. I wonder if there
are any existing works or discussions on this topic?

=== Question 3 ===
Chapter Data Structures also discusses other resizable hash tables,
namely "Resizable, scalable, concurrent hash tables via relativistic
programming" from Josh Triplett, which can save memory footprint by
using a single pair of pointers. But my understanding is that
perftest_resize.c is unique in that it allows you to rebuild the hash
table by utilizing a different hash function, which could be very
useful in practice (e.g., to prevent DDoS attack). Other solutions do
not share this property. Is my understanding correct? Did I miss any
discussions on this topic in perfbook?

=== Question 4 ===
In the current implementation of hash_resize.c, the perftest_resize
could block an updater, and vice versa. It seems this is not what we
expected. Ideally, they should be allowed to run concurrently, or at
least the perftest_resize thread should have lower priority and
updaters should never be blocked by the perftest_resize thread. Is
that right? I'm very interested in helping improve. Please let me know
if you have any suggestions.

Thanks,
--Junchang

